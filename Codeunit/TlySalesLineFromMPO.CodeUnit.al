codeunit 50022 TlySalesLineFromMPO
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
                Message('SUCCESS!\\%1 from %2 with a quantity of %3 will be added to %4 line %5.\\%6 was reduced from %7 to %8.',
                        Rec."No.", Rec."Document No.", QtySendback, NewSalesLine."Document No.", NewSalesLine."Line No." + 10000, Rec."Document No.", Rec."Quantity", Rec.Quantity - QtySendback);
                LineNo := NewSalesLine."Line No." + 10000;
            end else begin
                Message('SUCCESS!\\%1 from %2 with a quantity of %3 will be added to %4 line 10000.\\%5 was reduced from %6 to %7.',
                        Rec."No.", Rec."Document No.", QtySendback, SalesHeader."No.", Rec."Document No.", Rec."Quantity", Rec.Quantity - QtySendback);
                LineNo := 10000;
            end;

            Rec.Validate("Quantity", Rec."Quantity" - QtySendback);
            Rec.Modify(true);

            NewSalesLine.Init();
            NewSalesLine.Validate("Document Type", 1);
            NewSalesLine.Validate("Document No.", SalesHeader."No.");
            NewSalesLine.Validate("Line No.", LineNo);
            NewSalesLine.Validate(Type, Rec.Type);
            NewSalesLine.Validate("No.", Rec."No.");
            NewSalesLine.Validate(Quantity, QtySendback);
            NewSalesLine.Validate("Unit Price", Rec."Unit Price");
            NewSalesLine.Validate("Builder Description", Rec."Builder Description");
            NewSalesLine.Validate("Master Project Order No.", Rec."Document No.");
            NewSalesLine.Validate("Master Project Order Line No.", Rec."Line No.");
            NewSalesLine.Insert(true);
            Commit();
        end;
    end;

    procedure CreateNew(Rec: Record "Sales Line")
    var
        TorlysSalesLineFromMPOQty: Page TorlysSalesLineFromMPOQty;
        QtySendback: Decimal;
        SalesHeader: Record "Sales Header";
        NewSalesHeader: Record "Sales Header";
        NewSalesLine: Record "Sales Line";
    begin
        TorlysSalesLineFromMPOQty.PresentModal(Rec."Document No.", Rec."No.", Rec.Description, Rec.Quantity);
        if TorlysSalesLineFromMPOQty.RunModal() = Action::OK then begin
            QtySendback := TorlysSalesLineFromMPOQty.GetQuantity();
        end;

        SalesHeader.Get(1, Rec."Document No.");

        Rec.Validate("Quantity", Rec."Quantity" - QtySendback);
        Rec.Modify(true);

        NewSalesHeader.Reset();
        NewSalesHeader.Init();
        NewSalesHeader.Validate(NewSalesHeader."Document Type", 1);
        NewSalesHeader.Validate(NewSalesHeader."Sell-to Customer No.", Rec."Sell-to Customer No.");
        NewSalesHeader.Validate(NewSalesHeader."Ship-to Code", Rec."Ship-to Code");
        NewSalesHeader.Validate(NewSalesHeader."Tag Name", SalesHeader."Tag Name");
        // NewSalesHeader.Validate(NewSalesHeader.ShortcutDimCode3,SalesHeader.Shortcut);
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
        NewSalesLine.Validate("Builder Description", Rec."Builder Description");
        NewSalesLine.Validate("Master Project Order No.", Rec."Document No.");
        NewSalesLine.Validate("Master Project Order Line No.", Rec."Line No.");
        NewSalesLine.Modify(true);
        Page.Run(Page::"Sales Order", NewSalesHeader);

        Message('SUCCESS!\\%1 from %2 with a quantity of %3 will be added to %4 line 10000.\\%5 was reduced from %6 to %7.',
        Rec."No.", Rec."Document No.", QtySendback, NewSalesHeader."No.", Rec."Document No.", Rec."Quantity" + QtySendback, Rec."Quantity");
    end;
}