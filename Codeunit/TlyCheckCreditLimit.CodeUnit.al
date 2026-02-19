codeunit 50343 TlyCheckCreditLimit
{
    [EventSubscriber(ObjectType::Page, Page::"Check Credit Limit", 'OnBeforeSalesHeaderShowWarning', '', false, false)]
    local procedure OnBeforeSalesHeaderShowWarning(var SalesHeader: Record "Sales Header"; var Result: Boolean; var IsHandled: Boolean; var Customer: Record Customer; var DeltaAmount: Decimal)
    begin
        IsHandled := true;
        Result := SalesHeaderShowWarning(SalesHeader, Result);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Check Credit Limit", 'OnBeforeSalesLineShowWarning', '', false, false)]
    local procedure OnbeforeSalesLineShowWarning(var SalesLine: Record "Sales Line"; var Result: Boolean; var IsHandled: Boolean; var Customer: Record Customer; var DeltaAmount: Decimal)
    begin
        IsHandled := true;
        Result := SalesLineShowWarning(SalesLine, Result, DeltaAmount);
    end;

    local procedure SalesHeaderShowWarning(var SalesHeader: Record "Sales Header"; var Result: Boolean): Boolean
    var
        OldSalesHeader: Record "Sales Header";
        AssignDeltaAmount: Boolean;
    begin
        BillToCustomerNo := SalesHeader."Bill-to Customer No.";
        if BillToCustomerNo = '' then
            BillToCustomerNo := SalesHeader."Sell-to Customer No.";

        CalcSalesHeaderNewOrderAmountLCY(SalesHeader);

        if not (SalesHeader."Document Type" in
                [SalesHeader."Document Type"::Quote,
                 SalesHeader."Document Type"::Order,
                 SalesHeader."Document Type"::"Return Order"])
        then
            NewOrderAmountLCY := NewOrderAmountLCY + SalesLineAmount(SalesHeader."Document Type", SalesHeader."No.");

        OldSalesHeader := SalesHeader;
        if OldSalesHeader.FindFirst() then
            // If "Bill-To Customer" is the same and Sales Header exists then do not consider amount in credit limit calculation since it's already included in "Outstanding Amount"
            // If "Bill-To Customer" was changed the consider amount in credit limit calculation since changes was not yet commited and not included in "Outstanding Amount"
            AssignDeltaAmount := OldSalesHeader."Bill-to Customer No." <> SalesHeader."Bill-to Customer No."
        else
            // If Sales Header is not inserted yet then consider the amount in credit limit calculation
            AssignDeltaAmount := true;
        if AssignDeltaAmount then
            DiffAmount := NewOrderAmountLCY;

        Result := ShowWarning(SalesHeader."Bill-to Customer No.", NewOrderAmountLCY, OldOrderAmountLCY, true, SalesHeader."No.");
    end;

    local procedure SalesLineShowWarning(var SalesLine: Record "Sales Line"; var Result: Boolean; var DeltaAmount: Decimal): Boolean
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");

        BillToCustomerNo := SalesHeader."Bill-to Customer No.";
        if BillToCustomerNo = '' then
            BillToCustomerNo := SalesHeader."Sell-to Customer No.";

        CalcSalesLineOrderAmountsLCY(SalesLine);

        DeltaAmount := NewOrderAmountLCY - OldOrderAmountLCY;
        NewOrderAmountLCY :=
          DeltaAmount + SalesLineAmount(SalesLine."Document Type", SalesLine."Document No.");

        if SalesHeader."Document Type" = SalesHeader."Document Type"::Quote then
            DeltaAmount := NewOrderAmountLCY;
        Result := ShowWarning(SalesHeader."Bill-to Customer No.", NewOrderAmountLCY, OldOrderAmountLCY, false, SalesLine."Document No.");
    end;

    local procedure CalcSalesHeaderNewOrderAmountLCY(SalesHeader: Record "Sales Header")
    begin

        if SalesHeader."Currency Code" = '' then
            NewOrderAmountLCY := SalesHeader."Amount Including VAT"
        else
            NewOrderAmountLCY :=
              Round(
                CurrExchRate.ExchangeAmtFCYToLCY(
                  WorkDate(), SalesHeader."Currency Code",
                  SalesHeader."Amount Including VAT", SalesHeader."Currency Factor"));
    end;

    local procedure CalcSalesLineOrderAmountsLCY(SalesLine: Record "Sales Line")
    begin

        NewOrderAmountLCY := SalesLine."Outstanding Amount (LCY)" + SalesLine."Shipped Not Invoiced (LCY)";

        if SalesLine.FindFirst() then
            OldOrderAmountLCY := SalesLine."Outstanding Amount (LCY)" + SalesLine."Shipped Not Invoiced (LCY)"
        else
            OldOrderAmountLCY := 0;
    end;

    local procedure SalesLineAmount(DocType: Enum "Sales Document Type"; DocNo: Code[20]): Decimal
    begin
        SalesLineRec.Reset();
        SalesLineRec.SetRange("Document Type", DocType);
        SalesLineRec.SetRange("Document No.", DocNo);
        SalesLineRec.CalcSums("Outstanding Amount (LCY)", "Shipped Not Invoiced (LCY)");
        exit(SalesLineRec."Outstanding Amount (LCY)" + SalesLineRec."Shipped Not Invoiced (LCY)");
    end;

    procedure ShowWarning(NewCustNo: Code[20]; NewOrderAmountLCY2: Decimal; OldOrderAmountLCY2: Decimal; CheckOverDueBalance: Boolean; SalesHeaderNo: Code[20]) Result: Boolean
    var
        CustCheckCrLimit: Codeunit "Cust-Check Cr. Limit";
        ExitValue: Integer;
    begin
        if NewCustNo = '' then
            exit;
        CustNo := NewCustNo;
        NewOrderAmountLCY := NewOrderAmountLCY2;
        OldOrderAmountLCY := OldOrderAmountLCY2;
        Rec.Get(CustNo);
        Rec.SetRange("No.", Rec."No.");
        Cust2.Copy(Rec);

        // Cust2.Get();
        if Cust2."Credit Warnings" = Cust2."Credit Warnings"::"Cr Limit Only"
        then begin
            CalcCreditLimitLCY();
            if (CustCreditAmountLCY > Rec."Credit Limit (LCY)") and (Rec."Credit Limit (LCY)" <> 0) then
                ExitValue := 1;
        end;

        if Cust2."Credit Warnings" = Cust2."Credit Warnings"::"Terms Only"
        then begin
            CalcOverdueBalanceLCY();
            if Rec."Balance Due (LCY)" > 0 then
                ExitValue := ExitValue + 2;
        end;

        if Cust2."Credit Warnings" = Cust2."Credit Warnings"::"Cr Limit / Terms"
        then begin
            CalcCreditLimitLCY();
            CalcOverdueBalanceLCY();
            if (CustCreditAmountLCY > Rec."Credit Limit (LCY)") and (Rec."Credit Limit (LCY)" <> 0) then
                ExitValue := 1;
            if Rec."Balance Due (LCY)" > 0 then
                ExitValue := ExitValue + 2;
        end;

        if Cust2."Credit Warnings" = Cust2."Credit Warnings"::"Cr Limit+Open Ord Only" then begin
            CalcCreditLimitLCY();
            if (CustCreditAmountLCY + NewOrderAmountLCY - OldOrderAmountLCY > Rec."Credit Limit (LCY)") and (Rec."Credit Limit (LCY)" <> 0) then
                ExitValue := 1;
        end;

        if Cust2."Credit Warnings" = Cust2."Credit Warnings"::"Cr Limit+Open Ord / Terms" then begin
            CalcCreditLimitLCY();
            CalcOverdueBalanceLCY();
            if (CustCreditAmountLCY + NewOrderAmountLCY - OldOrderAmountLCY > Rec."Credit Limit (LCY)") and (Rec."Credit Limit (LCY)" <> 0) then
                ExitValue := 1;
            if Rec."Balance Due (LCY)" > 0 then
                ExitValue := ExitValue + 2;
        end;

        if ExitValue > 0 then begin

            PutOrderOnHold(SalesHeaderNo);

            case ExitValue of
                1:
                    begin
                        Heading := CopyStr(CustCheckCrLimit.GetCreditLimitNotificationMsg(), 1, 250);
                        NotificationId := CustCheckCrLimit.GetCreditLimitNotificationId();
                    end;
                2:
                    begin
                        Heading := CopyStr(CustCheckCrLimit.GetOverdueBalanceNotificationMsg(), 1, 250);
                        NotificationId := CustCheckCrLimit.GetOverdueBalanceNotificationId();
                    end;
                3:
                    begin
                        Heading := CopyStr(CustCheckCrLimit.GetCreditLimitNotificationMsg(), 1, 250);
                        SecondHeading := CopyStr(CustCheckCrLimit.GetOverdueBalanceNotificationMsg(), 1, 250);
                        NotificationId := CustCheckCrLimit.GetBothNotificationsId();
                    end;
            end;
            exit(true);
        end;
    end;

    local procedure CalcCreditLimitLCY()
    begin
        Rec.Get(BillToCustomerNo);
        if Rec.GetFilter("Date Filter") = '' then
            Rec.SetFilter("Date Filter", '..%1', WorkDate());
        Rec.CalcFields("Balance (LCY)", "Shipped Not Invoiced (LCY)");
        CalcReturnAmounts(OutstandingRetOrdersLCY, RcdNotInvdRetOrdersLCY);

        OrderAmountTotalLCY := CalcTotalOutstandingAmt() - OutstandingRetOrdersLCY + DiffAmount;

        CustCreditAmountLCY :=
          Rec."Balance (LCY)" + Rec."Shipped Not Invoiced (LCY)" - RcdNotInvdRetOrdersLCY +
          OrderAmountTotalLCY - Rec.GetInvoicedPrepmtAmountLCY();
    end;

    local procedure CalcReturnAmounts(var OutstandingRetOrdersLCY2: Decimal; var RcdNotInvdRetOrdersLCY2: Decimal)
    begin
        SalesLineRec.Reset();
        SalesLineRec.SetCurrentKey("Document Type", "Bill-to Customer No.", "Currency Code");
        SalesLineRec.SetRange("Document Type", SalesLineRec."Document Type"::"Return Order");
        SalesLineRec.SetRange("Bill-to Customer No.", Rec."No.");
        SalesLineRec.CalcSums("Outstanding Amount (LCY)", "Return Rcd. Not Invd. (LCY)");
        OutstandingRetOrdersLCY2 := SalesLineRec."Outstanding Amount (LCY)";
        RcdNotInvdRetOrdersLCY2 := SalesLineRec."Return Rcd. Not Invd. (LCY)";
    end;

    local procedure CalcTotalOutstandingAmt() Result: Decimal
    var
        SalesOutstandingAmountFromShipment: Decimal;

    begin
        Rec.Get(BillToCustomerNo);
        Rec.CalcFields("Outstanding Invoices (LCY)", "Outstanding Orders (LCY)");
        SalesOutstandingAmountFromShipment := SalesLineRec.OutstandingInvoiceAmountFromShipment(Rec."No.");

        Result := Rec."Outstanding Orders (LCY)" + Rec."Outstanding Invoices (LCY)" - SalesOutstandingAmountFromShipment;
    end;

    local procedure CalcOverdueBalanceLCY()
    begin
        Rec.Get(BillToCustomerNo);
        if Rec.GetFilter("Date Filter") = '' then
            Rec.SetFilter("Date Filter", '..%1', WorkDate());
        Rec.CalcFields("Balance Due (LCY)");
    end;

    local procedure PutOrderOnHold(OrderNo: Code[20])
    var
        SalesHeader: Record "Sales Header";

    begin
        SalesHeader.Reset();
        SalesHeader.SetRange("No.", OrderNo);

        if SalesHeader.FindFirst() then begin
            if SalesHeader."On Hold" = '' then
                SalesHeader."On Hold" := 'CR';

            SalesHeader.Modify(true);
        end;
    end;

    var
        Rec: Record Customer;
        Cust2: Record Customer;
        CurrExchRate: Record "Currency Exchange Rate";
        SalesLineRec: Record "Sales Line";
        CustNo: Code[20];
        BillToCustomerNo: Code[20];
        Heading: Text[250];
        SecondHeading: Text[250];
        NotificationId: Guid;
        NewOrderAmountLCY: Decimal;
        DiffAmount: Decimal;
        OrderAmountTotalLCY: Decimal;
        OldOrderAmountLCY: Decimal;
        OutstandingRetOrdersLCY: Decimal;
        RcdNotInvdRetOrdersLCY: Decimal;
        CustCreditAmountLCY: Decimal;
}