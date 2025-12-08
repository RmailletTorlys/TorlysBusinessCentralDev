codeunit 50022 TorlysCreateMPOFromSalesLine
{
    procedure AddToExisting(Rec: Record "Sales Line")
    var
        SalesOrders: Page "Sales Order List";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        LineNo: Integer;
    begin
        SalesOrders.LookupMode(true);
        SalesHeader.Reset;
        SalesHeader.SetFilter(Status, 'Open');
        SalesHeader.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
        SalesHeader.SetRange("Ship-to Code", Rec."Ship-to Code");
        // some sort of MPO filter here to only show those from this one
        SalesOrders.SetTableView(SalesHeader);
        if SalesOrders.RunModal() = Action::LookupOK then
            SalesOrders.GetRecord(SalesHeader);

        SalesLine.Reset;
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.Find('+') then begin
            Message('SUCCESS!\%1 from %2 with a quantity of %3 will be added to %4 line %5.', Rec."No.", Rec."Document No.", Rec."Quantity", SalesHeader."No.", SalesLine."Line No." + 10000);
            LineNo := SalesLine."Line No." + 10000;
        end else begin
            Message('SUCCESS!\%1 from %2 with a quantity of %3 will be added to  %4 line 10000.', Rec."No.", Rec."Document No.", Rec."Quantity", SalesHeader."No.");
            LineNo := 10000;
        end;

        SalesLine.Init;
        SalesLine."Document No." := SalesHeader."No.";
        SalesLine."Line No." := LineNo;
        SalesLine.Validate(Type, Rec.Type);
        SalesLine.Validate("No.", Rec."No.");
        SalesLine.Validate(Quantity, Rec.Quantity);
        SalesLine.Insert(true);
        Commit();

    end;

    procedure CreateNew(Rec: Record "Sales Line")
    var
        NewSalesHeader: Record "Sales Header";
        NewSalesLine: Record "Sales Line";
    begin
        NewSalesHeader.Reset();
        NewSalesHeader.Init();
        NewSalesHeader.Validate(NewSalesHeader."Document Type", 1);
        NewSalesHeader.Validate(NewSalesHeader."Sell-to Customer No.", Rec."Sell-to Customer No.");
        NewSalesHeader.Validate(NewSalesHeader."Ship-to Code", Rec."Ship-to Code"); //this is not on the line, so an issue for now
        // line here that puts the original order number in a MPO field
        NewSalesHeader.Insert(true);
        NewSalesLine.Reset();
        NewSalesLine.Init();
        NewSalesLine.Validate(NewSalesLine."Document Type", 1);
        NewSalesLine.Validate(NewSalesLine."Document No.", NewSalesHeader."No.");
        NewSalesLine.Validate(NewSalesLine."Line No.", 10000);
        NewSalesLine.Insert(true);
        NewSalesLine.Validate(NewSalesLine."Type", Rec.Type);
        NewSalesLine.Validate(NewSalesLine."No.", Rec."No.");
        NewSalesLine.Modify(true);
        Page.Run(Page::"Sales Order", NewSalesHeader);
    end;
}