codeunit 57012 TlyBOLGetShipment
{
    Permissions = tabledata "Sales Shipment Header" = rm;

    procedure GetShipment(BOLHeader: Record TlyBillOfLadingHeader)
    //TLY-SD - 11/26/2026 - move here from table
    var
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        BOLLine: Record TlyBillOfLadingLine;
        NextLineNo: Integer;
        ShippingAgent: Record "Shipping Agent";
        UOMMgt: Codeunit "Unit of Measure Management";
        QtyPerCase: Decimal;
        Item: Record Item;
        TotalWeight: Decimal;
        TotalCases: Integer;
        SalesHeader: Record "Sales Header";
        TransferShipmentHeader: Record "Transfer Shipment Header";
        TransferShipmentLine: Record "Transfer Shipment Line";
        TransferHeader: Record "Transfer Header";
    begin
        SalesShipmentHeader.Reset();
        SalesShipmentLine.Reset();
        BOLLine.Reset();
        NextLineNo := 0;
        ShippingAgent.Reset();
        QtyPerCase := 0;
        Item.Reset();
        TotalWeight := 0;
        TotalCases := 0;
        SalesHeader.Reset();
        TransferShipmentHeader.Reset();
        TransferShipmentLine.Reset();
        TransferHeader.Reset();

        BOLLine.SetRange("BOL No.", BOLHeader."No.");
        if BOLLine.Find('+') then
            NextLineNo := BOLLine."BOL Line No." + 10000
        else
            NextLineNo := 10000;

        if BOLHeader."Transaction Type" = BOLHeader."Transaction Type"::Shipment then begin
            SalesShipmentHeader.SetRange("Sell-to Customer No.", BOLHeader."Customer No.");
            SalesShipmentHeader.SetRange("Ship-to Code", BOLHeader."Ship-to Code");
            SalesShipmentHeader.SetRange("Location Code", BOLHeader."Location Code");
            SalesShipmentHeader.SetRange("Shipment Date", BOLHeader."Pickup Date");
            SalesShipmentHeader.SetRange("Shipping Agent Code", BOLHeader."Shipping Agent Code");
            SalesShipmentHeader.SetRange("BOL No.", '');
            if SalesShipmentHeader.IsEmpty then begin
                Error('No shipments were found. Please verify the information and try again.');
            end;
            if SalesShipmentHeader.FindSet() then begin
                repeat
                    BOLLine.Init();
                    BOLLine."BOL Line No." := NextLineNo;
                    BOLLine."BOL No." := BOLHeader."No.";
                    BOLLine."Order No." := SalesShipmentHeader."Order No.";
                    BOLLine."Shipment No." := SalesShipmentHeader."No.";
                    BOLLine."Shipment Date" := SalesShipmentHeader."Shipment Date";
                    BOLLine."Customer No." := SalesShipmentHeader."Sell-to Customer No.";
                    BOLLine."Ship-to Code" := SalesShipmentHeader."Ship-to Code";
                    BOLLine."Ship-to Name" := SalesShipmentHeader."Ship-to Name";
                    BOLLine."Ship-to Address" := SalesShipmentHeader."Ship-to Address";
                    BOLLine."Ship-to Address 2" := SalesShipmentHeader."Ship-to Address 2";
                    BOLLine."Ship-to City" := SalesShipmentHeader."Ship-to City";
                    BOLLine."Ship-to County" := SalesShipmentHeader."Ship-to County";
                    BOLLine."Ship-to Post Code" := SalesShipmentHeader."Ship-to Post Code";
                    BOLLine."Ship-to Country/Region Code" := SalesShipmentHeader."Ship-to Country/Region Code";
                    BOLLine."External Document No." := SalesShipmentHeader."External Document No.";
                    BOLLine."Shipping Agent Code" := SalesShipmentHeader."Shipping Agent Code";
                    if ShippingAgent.Get(BOLHeader."Shipping Agent Code") THEN
                        BOLLine."Freight Charges" := ShippingAgent."Freight Charges";
                    BOLLine."Shipping Comment" := SalesShipmentHeader."Shipping Comment";
                    BOLLine."Total Weight" := 0;
                    BOLLine."Total Cases" := 0;

                    if BOLHeader."Shipping Comment" = '' then begin
                        BOLHeader."Shipping Comment" := SalesShipmentHeader."Shipping Comment";
                        BOLHeader.Modify(true);
                    end;

                    SalesShipmentLine.Reset();
                    SalesShipmentLine.SetRange("Document No.", SalesShipmentHeader."No.");
                    SalesShipmentLine.SetFilter(Type, 'Item');
                    if SalesShipmentLine.FindSet() then begin
                        repeat
                            Item.Get(SalesShipmentLine."No.");
                            if Item."Compare Unit of Measure" <> '' then begin
                                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE');
                                BOLHeader."Weight - Flooring" := BOLHeader."Weight - Flooring" + (SalesShipmentLine."Quantity" * Item."Net Weight");
                                BOLHeader."Cases - Flooring" := BOLHeader."Cases - Flooring" + (SalesShipmentLine.Quantity / QtyPerCase);
                                BOLHeader.Modify(true);
                                BOLLine."Total Weight" := BOLLine."Total Weight" + (SalesShipmentLine."Quantity" * Item."Net Weight");
                                BOLLine."Total Cases" := BOLLine."Total Cases" + (SalesShipmentLine.Quantity / QtyPerCase);
                            end else begin
                                if (SalesShipmentLine."Gen. Prod. Posting Group" in ['MOULDINGS', 'MQ MOULDINGS', 'SS MOULDINGS']) then begin
                                    BOLHeader."Weight - Mouldings" := BOLHeader."Weight - Mouldings" + (SalesShipmentLine."Quantity" * Item."Net Weight");
                                    BOLHeader."Cases - Mouldings" := BOLHeader."Cases - Mouldings" + SalesShipmentLine."Quantity";
                                    BOLHeader.Modify(true);
                                    BOLLine."Total Weight" := BOLLine."Total Weight" + (SalesShipmentLine."Quantity" * Item."Net Weight");
                                    BOLLine."Total Cases" := BOLLine."Total Cases" + SalesShipmentLine."Quantity";
                                end else if (SalesShipmentLine."Gen. Prod. Posting Group" = 'UNDERLAYMENT') and (SalesShipmentLine."Unit of Measure Code" = 'ROLL') then begin
                                    BOLHeader."Weight - Underlayment Rolls" := BOLHeader."Weight - Underlayment Rolls" + (SalesShipmentLine."Quantity" * Item."Net Weight");
                                    BOLHeader."Cases - Underlayment Rolls" := BOLHeader."Cases - Underlayment Rolls" + SalesShipmentLine."Quantity";
                                    BOLHeader.Modify(true);
                                    BOLLine."Total Weight" := BOLLine."Total Weight" + (SalesShipmentLine."Quantity" * Item."Net Weight");
                                    BOLLine."Total Cases" := BOLLine."Total Cases" + SalesShipmentLine."Quantity";
                                end else begin
                                    BOLHeader."Weight - Other" := BOLHeader."Weight - Other" + (SalesShipmentLine."Quantity" * Item."Net Weight");
                                    BOLHeader."Cases - Other" := BOLHeader."Cases - Other" + SalesShipmentLine."Quantity";
                                    BOLHeader.Modify(true);
                                    BOLLine."Total Weight" := BOLLine."Total Weight" + (SalesShipmentLine."Quantity" * Item."Net Weight");
                                    BOLLine."Total Cases" := BOLLine."Total Cases" + SalesShipmentLine."Quantity";
                                end;
                            end;
                        until SalesShipmentLine.Next() = 0;
                    end;
                    BOLLine.Insert();
                    NextLineNo += 10000;
                until SalesShipmentHeader.Next() = 0;
                // write BOL # on shipment header
                if SalesShipmentHeader.Find('-') then begin
                    SalesShipmentHeader.ModifyAll(SalesShipmentHeader."BOL No.", BOLHeader."No.");
                end;
                // write BOL # on sales header
                BOLLine.Reset();
                BOLLine.SetRange("BOL No.", BOLHeader."No.");
                if BOLLine.Find('-') then begin
                    repeat
                        SalesHeader.Reset();
                        SalesHeader.SetRange("No.", BOLLine."Order No.");
                        if SalesHeader.Find('-') then begin
                            repeat
                                SalesHeader."BOL No." := BOLLine."BOL No.";
                                SalesHeader.Modify(true);
                            until SalesHeader.Next() = 0;
                        end;
                    until BOLLine.Next() = 0;
                end;
            end;
        end else if BOLHeader."Transaction Type" = BOLHeader."Transaction Type"::Transfer then begin
            TransferShipmentHeader.SetRange("Transfer-to Code", BOLHeader."Customer No.");
            TransferShipmentHeader.SetRange("Transfer-from Code", BOLHeader."Location Code");
            TransferShipmentHeader.SetRange("Shipment Date", BOLHeader."Pickup Date");
            TransferShipmentHeader.SetRange("Shipping Agent Code", BOLHeader."Shipping Agent Code");
            TransferShipmentHeader.SetRange("BOL No.", '');
            if TransferShipmentHeader.IsEmpty then begin
                Error('No transfers were found. Please verify the information and try again.');
            end;
            if TransferShipmentHeader.FindSet() then begin
                repeat
                    BOLLine.Init();
                    BOLLine."BOL Line No." := NextLineNo;
                    BOLLine."BOL No." := BOLHeader."No.";
                    BOLLine."Order No." := TransferShipmentHeader."Transfer Order No.";
                    BOLLine."Shipment No." := TransferShipmentHeader."No.";
                    BOLLine."Shipment Date" := TransferShipmentHeader."Shipment Date";
                    BOLLine."Customer No." := TransferShipmentHeader."Transfer-to Code";
                    BOLLine."Ship-to Name" := TransferShipmentHeader."Transfer-to Name";
                    BOLLine."Ship-to Address" := TransferShipmentHeader."Transfer-to Address";
                    BOLLine."Ship-to Address 2" := TransferShipmentHeader."Transfer-to Address 2";
                    BOLLine."Ship-to City" := TransferShipmentHeader."Transfer-to City";
                    BOLLine."Ship-to County" := TransferShipmentHeader."Transfer-to County";
                    BOLLine."Ship-to Post Code" := TransferShipmentHeader."Transfer-to Post Code";
                    BOLLine."Ship-to Country/Region Code" := TransferShipmentHeader."Trsf.-to Country/Region Code";
                    BOLLine."External Document No." := TransferShipmentHeader."External Document No.";
                    BOLLine."Shipping Agent Code" := TransferShipmentHeader."Shipping Agent Code";
                    if ShippingAgent.Get(BOLHeader."Shipping Agent Code") THEN
                        BOLLine."Freight Charges" := ShippingAgent."Freight Charges";
                    BOLLine."Shipping Comment" := TransferShipmentHeader."Shipping Comment";
                    BOLLine."Total Weight" := 0;
                    BOLLine."Total Cases" := 0;

                    if BOLHeader."Shipping Comment" = '' then begin
                        BOLHeader."Shipping Comment" := TransferShipmentHeader."Shipping Comment";
                        BOLHeader.Modify(true);
                    end;

                    TransferShipmentLine.Reset();
                    TransferShipmentLine.SetRange("Document No.", TransferShipmentHeader."No.");
                    if TransferShipmentLine.FindSet() then begin
                        repeat
                            Item.Get(TransferShipmentLine."Item No.");
                            if Item."Compare Unit of Measure" <> '' then begin
                                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE');
                                BOLHeader."Weight - Flooring" := BOLHeader."Weight - Flooring" + (TransferShipmentLine."Quantity" * Item."Net Weight");
                                BOLHeader."Cases - Flooring" := BOLHeader."Cases - Flooring" + (TransferShipmentLine.Quantity / QtyPerCase);
                                BOLHeader.Modify(true);
                                BOLLine."Total Weight" := BOLLine."Total Weight" + (TransferShipmentLine."Quantity" * Item."Net Weight");
                                BOLLine."Total Cases" := BOLLine."Total Cases" + (TransferShipmentLine.Quantity / QtyPerCase);
                            end else begin
                                if (TransferShipmentLine."Gen. Prod. Posting Group" in ['MOULDINGS', 'MQ MOULDINGS', 'SS MOULDINGS']) then begin
                                    BOLHeader."Weight - Mouldings" := BOLHeader."Weight - Mouldings" + (TransferShipmentLine."Quantity" * Item."Net Weight");
                                    BOLHeader."Cases - Mouldings" := BOLHeader."Cases - Mouldings" + TransferShipmentLine."Quantity";
                                    BOLHeader.Modify(true);
                                    BOLLine."Total Weight" := BOLLine."Total Weight" + (TransferShipmentLine."Quantity" * Item."Net Weight");
                                    BOLLine."Total Cases" := BOLLine."Total Cases" + TransferShipmentLine."Quantity";
                                end else if (TransferShipmentLine."Gen. Prod. Posting Group" = 'UNDERLAYMENT') and (TransferShipmentLine."Unit of Measure Code" = 'ROLL') then begin
                                    BOLHeader."Weight - Underlayment Rolls" := BOLHeader."Weight - Underlayment Rolls" + (TransferShipmentLine."Quantity" * Item."Net Weight");
                                    BOLHeader."Cases - Underlayment Rolls" := BOLHeader."Cases - Underlayment Rolls" + TransferShipmentLine."Quantity";
                                    BOLHeader.Modify(true);
                                    BOLLine."Total Weight" := BOLLine."Total Weight" + (TransferShipmentLine."Quantity" * Item."Net Weight");
                                    BOLLine."Total Cases" := BOLLine."Total Cases" + TransferShipmentLine."Quantity";
                                end else begin
                                    BOLHeader."Weight - Other" := BOLHeader."Weight - Other" + (TransferShipmentLine."Quantity" * Item."Net Weight");
                                    BOLHeader."Cases - Other" := BOLHeader."Cases - Other" + TransferShipmentLine."Quantity";
                                    BOLHeader.Modify(true);
                                    BOLLine."Total Weight" := BOLLine."Total Weight" + (TransferShipmentLine."Quantity" * Item."Net Weight");
                                    BOLLine."Total Cases" := BOLLine."Total Cases" + TransferShipmentLine."Quantity";
                                end;
                            end;
                        until TransferShipmentLine.Next() = 0;
                    end;
                    BOLLine.Insert();
                    NextLineNo += 10000;
                until TransferShipmentHeader.Next() = 0;
                // write BOL # on shipment header
                if TransferShipmentHeader.Find('-') then begin
                    TransferShipmentHeader.ModifyAll(TransferShipmentHeader."BOL No.", BOLHeader."No.");
                end;
                // write BOL # on sales header
                BOLLine.Reset();
                BOLLine.SetRange("BOL No.", BOLHeader."No.");
                if BOLLine.Find('-') then begin
                    repeat
                        TransferHeader.Reset();
                        TransferHeader.SetRange("No.", BOLLine."Order No.");
                        if TransferHeader.Find('-') then begin
                            repeat
                                TransferHeader."BOL No." := BOLLine."BOL No.";
                                TransferHeader.Modify(true);
                            until TransferHeader.Next() = 0;
                        end;
                    until BOLLine.Next() = 0;
                end;
            end;
        end;
    end;
}