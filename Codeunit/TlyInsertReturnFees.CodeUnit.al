codeunit 50424 TlyInsertReturnFees
{
    procedure RestockingROscreens(Rec: Record "Sales Header")
    // this is for adding restocking fee when initiated from the return order screen
    // TLY-SD - 11/17/2026 - moved to CU
    var
        Cust: Record "Customer";
        OrderAmount: Decimal;
        RestockingAmount: Decimal;
        SalesLine: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.Get;
        Cust.Get(Rec."Sell-to Customer No.");
        if Cust."Restocking Fee %" = 0 then
            Error('No Restocking Fee % setup on customer card for %1.', Rec."Sell-to Customer No.");
        if Cust."Restocking Fee Minimum" = 0 then
            Error('No Restocking Fee Minimum setup on customer card for %1.', Rec."Sell-to Customer No.");

        // Check if restocking line exists
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetRange(Type, SalesLine.Type::"G/L Account");
        SalesLine.SetFilter("No.", SalesSetup."Restocking G/L Acc. No.");
        if SalesLine.Find('-') then
            Error('Restocking line already exists, please remove before adding new.');

        // Get the total of the sales order
        OrderAmount := 0.0;
        RestockingAmount := 0.0;
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        if SalesLine.Find('-') then begin
            repeat
                OrderAmount := OrderAmount + SalesLine."Line Amount";
            until SalesLine.Next = 0;
        end;

        // Check if max has been reached and calculate amount to be charged
        if OrderAmount > 0 then
            if Round(OrderAmount * Cust."Restocking Fee %" / 100, 0.01, '=') < Cust."Restocking Fee Minimum" then
                RestockingAmount := Cust."Restocking Fee Minimum"
            else
                RestockingAmount := Round(OrderAmount * Cust."Restocking Fee %" / 100, 0.01, '=');

        if RestockingAmount <> 0 then begin
            // Fill in the Sales Line
            SalesLine.Reset;
            SalesLine.SetRange("Document Type", Rec."Document Type");
            SalesLine.SetRange("Document No.", Rec."No.");
            SalesLine.Find('+');
            SalesLine."Line No." := SalesLine."Line No." + 10000;
            SalesLine.Init;
            SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
            SalesLine.Validate("No.", SalesSetup."Restocking G/L Acc. No.");
            SalesLine.Validate(Description, 'Restocking fee');
            SalesLine.Validate(Quantity, -1);
            SalesLine.Validate("Unit Price", RestockingAmount);
            SalesLine.Insert;
        end;
    end;

    procedure FreightROscreens(Rec: Record "Sales Header")
    // this is for adding freight fee when initiated from the return order screen
    // TLY-SD - 11/17/2026 - created
    var
        OrderAmount: Decimal;
        FreightAmount: Decimal;
        SalesLine: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        SalesSetup.Get;

        // Check if freight fee line exists
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetRange(Type, SalesLine.Type::"G/L Account");
        SalesLine.SetFilter("No.", SalesSetup."Freight G/L Acc. No.");
        if SalesLine.Find('-') then
            Error('Freight fee line already exists, please remove before adding new.');

        // Get the total of the sales order
        OrderAmount := 0.0;
        FreightAmount := 0.0;
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        if SalesLine.Find('-') then begin
            repeat
                OrderAmount := OrderAmount + SalesLine."Line Amount";
            until SalesLine.Next = 0;
        end;

        // Check if max has been reached and calculate amount to be charged
        if OrderAmount > 0 then
            if Round(OrderAmount * 0.07, 0.01, '=') < 75 then
                FreightAmount := 75
            else
                FreightAmount := Round(OrderAmount * 0.07, 0.01, '=');

        if FreightAmount <> 0 then begin
            // Fill in the Sales Line
            SalesLine.Reset;
            SalesLine.SetRange("Document Type", Rec."Document Type");
            SalesLine.SetRange("Document No.", Rec."No.");
            SalesLine.Find('+');
            SalesLine."Line No." := SalesLine."Line No." + 10000;
            SalesLine.Init;
            SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
            SalesLine.Validate("No.", SalesSetup."Freight G/L Acc. No.");
            SalesLine.Validate(Description, 'Freight fee');
            SalesLine.Validate(Quantity, -1);
            SalesLine.Validate("Unit Price", FreightAmount);
            SalesLine.Insert;
        end;
    end;
}