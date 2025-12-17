codeunit 50027 TorlysAddSalesLineToTransLine
{
    [EventSubscriber(ObjectType::Table, Database::"Transfer Line", 'OnDeleteOnBeforeDeleteRelatedData', '', false, false)]
    local procedure OnDeleteOnBeforeDeleteRelatedData(var TransferLine: Record "Transfer Line")
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.Reset;
        SalesLine.SetRange("Document No.", TransferLine."Sales Order No.");
        SalesLine.SetRange("Line No.", TransferLine."Sales Order Line No.");
        if SalesLine.Find('-') then
            if TransferLine."Item No." <> '' then begin
                Message('SUCCESS!\\%1 from %2 with a quantity of %3.\\Join will be broken with %4 line %5.', TransferLine."Item No.", TransferLine."Document No.", TransferLine.Quantity, TransferLine."Sales Order No.", TransferLine."Sales Order Line No.");
                SalesLine.Validate(SalesLine."Transfer Order No.", '');
                SalesLine.Validate(SalesLine."Transfer Order Line No.", 0);
                SalesLine.Modify(true);
            end else begin
                Message('SUCCESS!\\%1 from %2.\Join will be broken with %3 line %4.', TransferLine."Description", TransferLine."Document No.", TransferLine."Sales Order No.", TransferLine."Sales Order Line No.");
                SalesLine.Validate(SalesLine."Transfer Order No.", '');
                SalesLine.Validate(SalesLine."Transfer Order Line No.", 0);
                SalesLine.Modify(true);
            end;
    end;

    procedure PresentModal(Rec: Record "Sales Line"; var TransferOrderNumber: Code[20])
    var
        TransferOrders: Page "Transfer Orders";
        TransferHeader: Record "Transfer Header";
    begin
        if Rec."Transfer Order No." <> '' then
            Error('ERROR!\\%1 from %2 with a quantity of %3 is already joined to %4 line %5.\\Delete from transfer in order to change.', Rec."No.", Rec."Document No.", Rec.Quantity, Rec."Transfer Order No.", Rec."Transfer Order Line No.");

        if Rec.Type = Rec.Type::Item then begin
            TransferOrders.LookupMode(true);
            TransferHeader.Reset;
            TransferHeader.SetFilter(Status, 'Open');
            TransferHeader.SetFilter("Transfer Type", 'Order Fulfillment');
            TransferHeader.SetRange("Transfer-to Code", Rec."Location Code");
            TransferOrders.SetTableView(TransferHeader);
            if TransferOrders.RunModal() = Action::LookupOK then
                TransferOrders.GetRecord(TransferHeader);
            TransferOrderNumber := TransferHeader."No.";
        end else if Rec.Type = Rec.Type::" " then begin
            TransferOrders.LookupMode(true);
            TransferHeader.Reset;
            TransferHeader.SetFilter(Status, 'Open');
            TransferHeader.SetFilter("Transfer Type", 'Order Fulfillment');
            TransferOrders.SetTableView(TransferHeader);
            if TransferOrders.RunModal() = Action::LookupOK then
                TransferOrders.GetRecord(TransferHeader);
            TransferOrderNumber := TransferHeader."No.";
        end else begin
            Error('ERROR!\\In order to join to a transfer order the line must be an Item or Comment.');
        end;
    end;

    procedure AddSalesLineToTransLine(Rec: Record "Sales Line"; var TransferOrderNumber: Code[20])
    var
        TransferHeader: Record "Transfer Header";
        TransferLine: Record "Transfer Line";
        LineNo: Integer;
    begin

        if Rec.Type = Rec.Type::Item then begin

            TransferLine.Reset;
            TransferLine.SetRange("Document No.", TransferOrderNumber);
            if TransferLine.Find('+') then begin
                Message('SUCCESS!\\%1 from %2 with a quantity of %3 will be added to %4 line %5.', Rec."No.", Rec."Document No.", Rec."Quantity", TransferOrderNumber, TransferLine."Line No." + 10000);
                LineNo := TransferLine."Line No." + 10000;
            end else begin
                Message('SUCCESS!\\%1 from %2 with a quantity of %3 will be added to  %4 line 10000.', Rec."No.", Rec."Document No.", Rec."Quantity", TransferOrderNumber);
                LineNo := 10000;
            end;

            TransferLine.Init;
            TransferLine."Document No." := TransferOrderNumber;
            TransferLine."Line No." := LineNo;
            TransferLine.Validate("Item No.", Rec."No.");
            TransferLine.Validate(Quantity, Rec.Quantity);
            TransferLine.Validate("Sales Order No.", Rec."Document No.");
            TransferLine.Validate("Sales Order Line No.", Rec."Line No.");
            TransferLine.Insert;

            Rec.Validate(Rec."Transfer Order No.", TransferLine."Document No.");
            Rec.Validate(Rec."Transfer Order Line No.", TransferLine."Line No.");
            Rec.Modify(true);
            Commit();

        end else if Rec.Type = Rec.Type::" " then begin

            TransferLine.Reset;
            TransferLine.SetRange("Document No.", TransferOrderNumber);
            if TransferLine.Find('+') then begin
                Message('SUCCESS!\\%1 from %2 will be added to %3 line %4.', Rec."Description", Rec."Document No.", TransferOrderNumber, TransferLine."Line No." + 10000);
                LineNo := TransferLine."Line No." + 10000;
            end else begin
                Message('SUCCESS!\\%1 from %2 will be added to %3 line 10000.', Rec."Description", Rec."Document No.", TransferOrderNumber);
                LineNo := 10000;
            end;

            TransferLine.Init;
            TransferLine."Document No." := TransferOrderNumber;
            TransferLine."Line No." := LineNo;
            TransferLine.Validate("Description", Rec."Description");
            TransferLine.Validate("Sales Order No.", Rec."Document No.");
            TransferLine.Validate("Sales Order Line No.", Rec."Line No.");
            TransferLine.Insert;

            Rec.Validate(Rec."Transfer Order No.", TransferLine."Document No.");
            Rec.Validate(Rec."Transfer Order Line No.", TransferLine."Line No.");
            Rec.Modify(true);
            Commit();

        end;

    end;
}