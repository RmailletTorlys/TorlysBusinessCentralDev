codeunit 50041 "Shipping Route Report Job"
{
    trigger OnRun()
    begin
        SendTomorrowRouteEmail('ROCKCITY');
    end;

    procedure SendTomorrowRouteEmail(TargetShippingAgent: Text)
    var
        CompanyInfo: Record "Company Information";
        SalesShipmentHeader: Record "Sales Shipment Header";
        DistanceCalc: Codeunit "Distance Calculator";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit "Email";
        Tomorrow: Date;
        ComputedDistance: Decimal;
        TotalDistance: Decimal;
        CurrentRowWeightLbs: Decimal;
        AccumulatedWeightSummaryLbs: Decimal;
        HtmlBody: Text;
        RowError: Text;
        EmailSubject: Text;
        NormalizedPostCode: Text;
        ExistingIndex: Integer;

        // Parallel data tracking collections
        ShipmentNoList: List of [Text];
        CustomerNameList: List of [Text];
        CityList: List of [Text];
        PostCodeList: List of [Text];
        DistanceList: List of [Decimal];
        WeightList: List of [Decimal];
        ErrorLogList: List of [Text];
        RecipientsList: List of [Text];

        i: Integer;
        j: Integer;
        TempShipmentNo: Text;
        TempCustName: Text;
        TempCity: Text;
        TempPostCode: Text;
        TempDistance: Decimal;
        TempWeight: Decimal;
        TempError: Text;
        DropSequenceText: Text;
    begin
        CompanyInfo.Get();
        Tomorrow := CalcDate('<+1D>', Today);
        TotalDistance := 0;
        AccumulatedWeightSummaryLbs := 0;

        SalesShipmentHeader.Reset();
        SalesShipmentHeader.SetRange("Shipping Agent Code", TargetShippingAgent);
        SalesShipmentHeader.SetRange("Shipment Date", Tomorrow);

        if not SalesShipmentHeader.FindSet() then
            exit;

        repeat
            NormalizedPostCode := UpperCase(DelChr(SalesShipmentHeader."Ship-to Post Code", '=', ' '));
            CurrentRowWeightLbs := CalculateShipmentWeightAndRoundUp(SalesShipmentHeader."No.");

            if PostCodeList.Contains(NormalizedPostCode) then begin
                ExistingIndex := PostCodeList.IndexOf(NormalizedPostCode);

                ShipmentNoList.Set(ExistingIndex, ShipmentNoList.Get(ExistingIndex) + ', ' + SalesShipmentHeader."No.");

                if StrPos(CustomerNameList.Get(ExistingIndex), SalesShipmentHeader."Ship-to Name") = 0 then
                    CustomerNameList.Set(ExistingIndex, CopyStr(CustomerNameList.Get(ExistingIndex) + ' / ' + SalesShipmentHeader."Ship-to Name", 1, 250));

                WeightList.Set(ExistingIndex, WeightList.Get(ExistingIndex) + CurrentRowWeightLbs);
            end else begin
                ComputedDistance := DistanceCalc.GetDistanceKM(
                    SalesShipmentHeader."Ship-to Address", SalesShipmentHeader."Ship-to City", SalesShipmentHeader."Ship-to Post Code",
                    RowError
                );

                ShipmentNoList.Add(SalesShipmentHeader."No.");
                CustomerNameList.Add(SalesShipmentHeader."Ship-to Name");
                CityList.Add(SalesShipmentHeader."Ship-to City");
                PostCodeList.Add(NormalizedPostCode);
                DistanceList.Add(ComputedDistance);
                WeightList.Add(CurrentRowWeightLbs);
                ErrorLogList.Add(RowError);

                TotalDistance += ComputedDistance;
            end;
        until SalesShipmentHeader.Next() = 0;

        // 2. Pure Memory Bubble Sort
        if PostCodeList.Count > 1 then begin
            for i := 1 to PostCodeList.Count - 1 do begin
                for j := i + 1 to PostCodeList.Count do begin
                    if DistanceList.Get(i) > DistanceList.Get(j) then begin
                        DistanceList.Get(i, TempDistance);
                        DistanceList.Set(i, DistanceList.Get(j));
                        DistanceList.Set(j, TempDistance);

                        ShipmentNoList.Get(i, TempShipmentNo);
                        ShipmentNoList.Set(i, ShipmentNoList.Get(j));
                        ShipmentNoList.Set(j, TempShipmentNo);

                        CustomerNameList.Get(i, TempCustName);
                        CustomerNameList.Set(i, CustomerNameList.Get(j));
                        CustomerNameList.Set(j, TempCustName);

                        CityList.Get(i, TempCity);
                        CityList.Set(i, CityList.Get(j));
                        CityList.Set(j, TempCity);

                        PostCodeList.Get(i, TempPostCode);
                        PostCodeList.Set(i, PostCodeList.Get(j));
                        PostCodeList.Set(j, TempPostCode);

                        WeightList.Get(i, TempWeight);
                        WeightList.Set(i, WeightList.Get(j));
                        WeightList.Set(j, TempWeight);

                        ErrorLogList.Get(i, TempError);
                        ErrorLogList.Set(i, ErrorLogList.Get(j));
                        ErrorLogList.Set(j, TempError);
                    end;
                end;
            end;
        end;

        // 3. Build Colourful Dashboard HTML Table Layout with fixed-width styling rules
        HtmlBody := '<div style="font-family:''Segoe UI'',Arial,sans-serif; max-width:980px; margin:0 auto; padding:20px; color:#333;">';
        HtmlBody += '<h2 style="color:#003366; border-bottom:3px solid #006699; padding-bottom:10px; margin-bottom:5px;">📋 Tomorrow Logistics Delivery Routing (Consolidated Stops)</h2>';
        HtmlBody += '<p style="color:#666; margin-top:0;">Schedule Date: <b style="color:#003366;">' + Format(Tomorrow, 0, 4) + '</b> | Shipping Agent: <b style="color:#003366;">' + TargetShippingAgent + '</b></p>';

        HtmlBody += '<table style="border-collapse:collapse; width:100%; box-shadow: 0 4px 6px rgba(0,0,0,0.1); border-radius:4px; overflow:hidden; font-size:14px; border:1px solid #003366;">';
        HtmlBody += '<thead><tr style="background-color:#003366; color:#ffffff; text-align:left; font-weight:bold;">';
        HtmlBody += '<th style="padding:12px 15px; width:15%;">Shipment No(s).</th>';
        HtmlBody += '<th style="padding:12px 15px; width:25%;">Customer Name(s)</th>';
        HtmlBody += '<th style="padding:12px 15px; width:15%;">City</th>';
        HtmlBody += '<th style="padding:12px 15px; width:12%;">Postal Code</th>';
        HtmlBody += '<th style="padding:12px 15px; width:10%; text-align:right;">Distance</th>';
        HtmlBody += '<th style="padding:12px 15px; width:13%; text-align:right;">Total Weight</th>';
        HtmlBody += '<th style="padding:12px 15px; width:10%; text-align:center;">Sequence</th></tr></thead>';
        HtmlBody += '<tbody>';

        for i := 1 to PostCodeList.Count do begin
            AccumulatedWeightSummaryLbs += WeightList.Get(i);

            if (i mod 2 = 0) then
                HtmlBody += '<tr style="background-color:#f8fbfd; border-bottom:1px solid #e0eaf0;">'
            else
                HtmlBody += '<tr style="background-color:#ffffff; border-bottom:1px solid #e0eaf0;">';

            HtmlBody += '<td style="padding:12px 15px; font-weight:bold; color:#006699;">' + ShipmentNoList.Get(i) + '</td>';
            HtmlBody += '<td style="padding:12px 15px;">' + CustomerNameList.Get(i) + '</td>';
            HtmlBody += '<td style="padding:12px 15px;">' + CityList.Get(i) + '</td>';
            HtmlBody += '<td style="padding:12px 15px; font-family:monospace; font-weight:bold;">' + PostCodeList.Get(i) + '</td>';

            if ErrorLogList.Get(i) <> '' then
                HtmlBody += '<td style="padding:12px 15px; color:#e67e22; font-weight:bold; text-align:right;">' + ErrorLogList.Get(i) + '</td>'
            else
                HtmlBody += '<td style="padding:12px 15px; text-align:right; font-weight:bold; color:#2c3e50;">' + Format(DistanceList.Get(i), 0, '<Integer><Decimals,1>') + ' KM</td>';

            HtmlBody += '<td style="padding:12px 15px; text-align:right; font-weight:bold; color:#27ae60;">' + Format(WeightList.Get(i), 0, '<Integer>') + ' LBS</td>';

            case i of
                1:
                    DropSequenceText := '1st drop';
                2:
                    DropSequenceText := '2nd drop';
                3:
                    DropSequenceText := '3rd drop';
                else
                    DropSequenceText := Format(i) + 'th drop';
            end;

            HtmlBody += '<td style="padding:12px 15px; text-align:center;"><span style="background-color:#e1f5fe; color:#0288d1; padding:4px 10px; border-radius:12px; font-weight:bold; font-size:12px;">' + DropSequenceText + '</span></td>';
            HtmlBody += '</tr>';
        end;
        HtmlBody += '</tbody>';

        // CRITICAL SPACING FIX: Using a solid single colspan="5" cell blocks Outlook's column compression bug.
        // This ensures the aggregated weights and drop sequences lock directly under columns 6 and 7.
        HtmlBody += '<tfoot><tr style="background-color:#002244; color:#ffffff; font-weight:bold;">';
        HtmlBody += '<td colspan="5" style="padding:15px; font-size:14px; text-align:left; border-top:2px solid #001122;">🏁 TOTAL MATRIX:</td>';
        HtmlBody += '<td style="padding:15px; text-align:right; font-size:14px; color:#a3e4d7; border-top:2px solid #001122; white-space:nowrap; width:13%;">' + Format(AccumulatedWeightSummaryLbs, 0, '<Integer>') + ' LBS</td>';
        HtmlBody += '<td style="padding:15px; text-align:center; font-size:14px; color:#81d4fa; border-top:2px solid #001122; white-space:nowrap; width:10%;">' + Format(PostCodeList.Count) + ' Total Drops</td>';
        HtmlBody += '';
        HtmlBody += '';
        // 5. Subject Line remaining formatted as: "X Shipments - YYYY-MM-DD"
        EmailSubject := Format(PostCodeList.Count) + ' Shipments - ' + Format(WorkDate(), 0, '-<Month,2>-<Day,2>');
        // 6. Assign recipients
        RecipientsList.Add('sameer.patel@torlys.com');
        RecipientsList.Add('Robert.maillet@torlys.com');
        EmailMessage.Create(RecipientsList, EmailSubject, HtmlBody, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    local procedure CalculateShipmentWeightAndRoundUp(ShipmentNo: Text): Decimal
    var
        SalesShipmentLine: Record "Sales Shipment Line";
        ShipmentWeightTotal: Decimal;
    begin
        ShipmentWeightTotal := 0;
        SalesShipmentLine.Reset();
        SalesShipmentLine.SetRange("Document No.", ShipmentNo);
        SalesShipmentLine.SetFilter(Quantity, '>0');
        if SalesShipmentLine.FindSet() then begin
            repeat
                ShipmentWeightTotal += (SalesShipmentLine.Quantity * SalesShipmentLine."Gross Weight");
            until SalesShipmentLine.Next() = 0;
        end;
        exit(Round(ShipmentWeightTotal, 1, '>'));
    end;
}
