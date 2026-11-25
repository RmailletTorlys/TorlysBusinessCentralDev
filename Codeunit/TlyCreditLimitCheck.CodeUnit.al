codeunit 50343 TlyCreditLimitCheck
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Cust-Check Cr. Limit", 'OnBeforeSalesLineCheck', '', false, false)]
    local procedure OnBeforeSalesLineCheck(var SalesLine: Record "Sales Line"; var IsHandled: Boolean; var CreditLimitExceeded: Boolean)
    var
        Customer: Record Customer;
        SalesHeader: Record "Sales Header";
        CustBalance: Decimal;
        CustBalanceDue: Decimal;
    begin
        IsHandled := true;

        Customer.Reset();
        Customer.Get(SalesLine."Bill-to Customer No.");
        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");

        CustBalance := 0;
        CustBalanceDue := 0;

        //still need to add in current order into calc
        //check if balance plus open orders is greater than credit limit
        //check if balance with 15 days grace is greater than 0
        if Customer."Credit Warnings" = Customer."Credit Warnings"::"Credit Limit + Open Orders or Terms" then begin
            Customer.CalcFields(Balance, "Outstanding Orders");
            CustBalance := Customer.Balance + Customer."Outstanding Orders";
            Customer.SetFilter("Date Filter", '..%1', WorkDate() - 15);
            Customer.CalcFields(Balance);
            CustBalanceDue := Customer.Balance;
            if CustBalance > Customer."Credit Limit (LCY)" then begin
                SalesHeader."On Hold" := 'CR';
                CreditLimitExceeded := true; //TLY-SD - 09/25/2026 - added, not sure if needed
                SalesHeader.Modify(true);
            end else if CustBalanceDue > 0 then begin
                SalesHeader."On Hold" := 'CR';
                CreditLimitExceeded := true; //TLY-SD - 09/25/2026 - added, not sure if needed
                SalesHeader.Modify(true);
            end;
        end;

        //still need to add in current order into calc
        //check if balance plus open orders is greater than credit limit
        if Customer."Credit Warnings" = Customer."Credit Warnings"::"Credit Limit + Open Orders" then begin
            Customer.CalcFields(Balance, "Outstanding Orders");
            CustBalance := Customer.Balance + Customer."Outstanding Orders";
            if CustBalance > Customer."Credit Limit (LCY)" then begin
                SalesHeader."On Hold" := 'CR';
                CreditLimitExceeded := true; //TLY-SD - 09/25/2026 - added, not sure if needed
                SalesHeader.Modify(true);
            end;
        end;

        //still need to add in current order into calc
        //check if balance with 15 days grace is greater than 0
        if Customer."Credit Warnings" = Customer."Credit Warnings"::"Terms" then begin
            Customer.SetFilter("Date Filter", '..%1', WorkDate() - 15);
            Customer.CalcFields(Balance);
            CustBalanceDue := Customer.Balance;
            if CustBalanceDue > 0 then begin
                SalesHeader."On Hold" := 'CR';
                CreditLimitExceeded := true; //TLY-SD - 09/25/2026 - added, not sure if needed
                SalesHeader.Modify(true);
            end;
        end;

        //still need to add in current order into calc
        //check if balance is above credit limit
        //check if balance with 15 days grace is greater than 0
        if Customer."Credit Warnings" = Customer."Credit Warnings"::"Credit Limit or Terms" then begin
            Customer.CalcFields(Balance);
            CustBalance := Customer.Balance;
            Customer.SetFilter("Date Filter", '..%1', WorkDate() - 15);
            Customer.CalcFields(Balance);
            CustBalanceDue := Customer.Balance;
            if CustBalance > Customer."Credit Limit (LCY)" then begin
                SalesHeader."On Hold" := 'CR';
                CreditLimitExceeded := true; //TLY-SD - 09/25/2026 - added, not sure if needed
                SalesHeader.Modify(true);
            end else if CustBalanceDue > 0 then begin
                SalesHeader."On Hold" := 'CR';
                CreditLimitExceeded := true; //TLY-SD - 09/25/2026 - added, not sure if needed
                SalesHeader.Modify(true);
            end;
        end;

        //still need to add in current order into calc
        //check if balance is above credit limit
        if Customer."Credit Warnings" = Customer."Credit Warnings"::"Credit Limit" then begin
            Customer.CalcFields(Balance);
            CustBalance := Customer.Balance;
            if CustBalance > Customer."Credit Limit (LCY)" then begin
                SalesHeader."On Hold" := 'CR';
                CreditLimitExceeded := true; //TLY-SD - 09/25/2026 - added, not sure if needed
                SalesHeader.Modify(true);
            end;
        end;

        //always hold
        if Customer."Credit Warnings" = Customer."Credit Warnings"::"Hold All" then begin
            SalesHeader."On Hold" := 'CR';
            CreditLimitExceeded := true; //TLY-SD - 09/25/2026 - added, not sure if needed
            SalesHeader.Modify(true);
        end;

        //never hold
        //TLY-SD - 11/24/2026 - get rid of this, what if we put the order on hold and add stuff to it, dont want it to come off hold
        // if Customer."Credit Warnings" = Customer."Credit Warnings"::"No Hold" then begin
        //     SalesHeader."On Hold" := '';
        //     CreditLimitExceeded := false; //TLY-SD - 09/25/2026 - added, not sure if needed
        //     SalesHeader.Modify(true);
        // end;
    end;


    // cant get this to work, dont know why, but there is a temp fix on the sales header table with the bill-to customer # field that gets us by
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Cust-Check Cr. Limit", 'OnBeforeSalesHeaderCheck', '', false, false)]
    // local procedure OnBeforeSalesHeaderCheck(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean; var CreditLimitExceeded: Boolean);
    // var
    //     Customer: Record Customer;
    // begin
    //     IsHandled := true;

    //     Customer.Reset();
    //     Customer.Get(SalesHeader."Bill-to Customer No.");
    //     Message('bill cust = %1 cr warn = %2 or # = %3', SalesHeader."Bill-to Customer No.", Customer."Credit Warnings", SalesHeader."No.");
    //     //always hold
    //     if Customer."Credit Warnings" = Customer."Credit Warnings"::"Hold All" then begin
    //         Message('order # = %1', SalesHeader."No.");
    //         SalesHeader."On Hold" := 'CR';
    //         CreditLimitExceeded := true;
    //         // SalesHeader.Modify(true);
    //     end;

    // end;
}