codeunit 50022 TorlysSalesLineFromMPO
{
    procedure AddToExisting(Rec: Record "Sales Line")
    var
        TorlysSalesLineFromMPOQty: Page TorlysSalesLineFromMPOQty;
        QtySendback: Decimal;
        SalesOrders: Page "Sales Order List";
        SalesHeader: Record "Sales Header";
        NewSalesLine: Record "Sales Line";
        LineNo: Integer;
    begin
        TorlysSalesLineFromMPOQty.PresentModal(Rec."Document No.", Rec."No.", Rec.Description, Rec.Quantity);
        if TorlysSalesLineFromMPOQty.RunModal() = Action::OK then begin
            QtySendback := TorlysSalesLineFromMPOQty.GetQuantity();
        end;

        SalesOrders.LookupMode(true);
        SalesHeader.Reset;
        SalesHeader.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
        SalesHeader.SetRange("Ship-to Code", Rec."Ship-to Code");
        // line here that puts the original order number in a MPO field
        SalesOrders.SetTableView(SalesHeader);
        if SalesOrders.RunModal() = Action::LookupOK then begin
            SalesOrders.GetRecord(SalesHeader);

            NewSalesLine.Reset;
            NewSalesLine.SetRange("Document No.", SalesHeader."No.");
            if NewSalesLine.Find('+') then begin
                Message('SUCCESS!\%1 from %2 with a quantity of %3 will be added to %4 line %5.', Rec."No.", Rec."Document No.", QtySendback, SalesHeader."No.", NewSalesLine."Line No." + 10000);
                LineNo := NewSalesLine."Line No." + 10000;
            end else begin
                Message('SUCCESS!\%1 from %2 with a quantity of %3 will be added to %4 line 10000.', Rec."No.", Rec."Document No.", QtySendback, SalesHeader."No.");
                LineNo := 10000;
            end;

            NewSalesLine.Init();
            NewSalesLine.Validate("Document Type", 1);
            NewSalesLine.Validate("Document No.", Rec."Document No.");
            NewSalesLine.Validate("Line No.", LineNo);
            NewSalesLine.Validate(Type, Rec.Type);
            NewSalesLine.Validate("No.", Rec."No.");
            NewSalesLine.Validate(Quantity, QtySendback);
            NewSalesLine.Validate("Unit Price", Rec."Unit Price");
            NewSalesLine.Insert(true);
            Commit();
        end;
    end;

    procedure CreateNew(Rec: Record "Sales Line")
    var
        TorlysSalesLineFromMPOQty: Page TorlysSalesLineFromMPOQty;
        QtySendback: Decimal;
        NewSalesHeader: Record "Sales Header";
        NewSalesLine: Record "Sales Line";
    begin
        TorlysSalesLineFromMPOQty.PresentModal(Rec."Document No.", Rec."No.", Rec.Description, Rec.Quantity);
        if TorlysSalesLineFromMPOQty.RunModal() = Action::OK then begin
            QtySendback := TorlysSalesLineFromMPOQty.GetQuantity();
        end;

        NewSalesHeader.Reset();
        NewSalesHeader.Init();
        NewSalesHeader.Validate(NewSalesHeader."Document Type", 1);
        NewSalesHeader.Validate(NewSalesHeader."Sell-to Customer No.", Rec."Sell-to Customer No.");
        NewSalesHeader.Validate(NewSalesHeader."Ship-to Code", Rec."Ship-to Code");
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
        NewSalesLine.Validate(Quantity, QtySendback);
        NewSalesLine.Validate("Unit Price", Rec."Unit Price");
        NewSalesLine.Modify(true);
        Page.Run(Page::"Sales Order", NewSalesHeader);
    end;
}