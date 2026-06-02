codeunit 50021 TlyLinkSalesLine
{
    procedure LinkSalesLineToPurchaseLine(Rec: Record "Sales Line")
    var
        PurchaseLines: Page "Purchase Lines";
        PurchaseLine: Record "Purchase Line";
    begin
        if Rec."Linked Purchase Order No." <> '' then
            Error('ERROR!\\%1 from %2 with a quantity of %3 is already linked to %4 line %5.\\Remove link to change.', Rec."No.", Rec."Document No.", Rec.Quantity, Rec."Linked Purchase Order No.", Rec."Linked Purch. Order Line No.");

        PurchaseLines.LookupMode(true);
        PurchaseLine.Reset;
        PurchaseLine.FilterGroup(2); //TLY-SD - 04/07/2026 - added this because CSRs were removing filters and adding to bogus documents
        PurchaseLine.SetRange("Location Code", Rec."Location Code");
        PurchaseLine.SetRange("No.", Rec."No.");
        PurchaseLine.SetFilter("Outstanding Quantity", '<>0');
        //i wish the next line could take how much is remaining to be linked, but i think would need to create a new field
        PurchaseLine.SetFilter("Outstanding Quantity", '>=%1', Rec."Quantity");
        PurchaseLines.SetTableView(PurchaseLine);
        if PurchaseLines.RunModal() = Action::LookupOK then begin
            PurchaseLines.GetRecord(PurchaseLine);

            //TLY-SD - 06/01/2026 - here we only need to check what is linked to the PO, because the TO is not created yet
            PurchaseLine.CalcFields("Quantity Linked");
            if (PurchaseLine."Quantity Linked" + Rec."Quantity") > PurchaseLine."Outstanding Quantity" then begin
                Error('ERROR!\\Not enough quantity remaining on %1 line %2.\\Please choose another purchase order.', PurchaseLine."Document No.", PurchaseLine."Line No.");
            end else begin
                Message('SUCCESS!\\%1 from %2 with a quantity of %3 will be linked to %4 line %5.', Rec."No.", Rec."Document No.", Rec."Quantity", PurchaseLine."Document No.", PurchaseLine."Line No.");
                Rec.Validate(Rec."Linked Purchase Order No.", PurchaseLine."Document No.");
                Rec.Validate(Rec."Linked Purch. Order Line No.", PurchaseLine."Line No.");
                Rec.Modify(true);
                Commit();
            end;
        end;
    end;


    procedure LinkSalesLineToTransferLine(Rec: Record "Sales Line")
    var
        TransferLines: Page "Transfer Lines";
        TransferLine: Record "Transfer Line";
        ContainerLine: Record "TPS CMG Container Line";
    begin
        if Rec."Linked Transfer Order No." <> '' then
            Error('ERROR!\\%1 from %2 with a quantity of %3 is already linked to %4 line %5.\\Remove link to change.', Rec."No.", Rec."Document No.", Rec.Quantity, Rec."Linked Transfer Order No.", Rec."Linked Transfer Order Line No.");

        TransferLines.LookupMode(true);
        TransferLine.Reset;
        TransferLine.FilterGroup(2); //TLY-SD - 04/07/2026 - added this because CSRs were removing filters and adding to bogus documents
        TransferLine.SetRange("Transfer-to Code", Rec."Location Code");
        TransferLine.SetRange("Item No.", Rec."No.");
        TransferLine.SetFilter("Qty. in Transit", '<>0');
        //i wish the next line could take how much is remaining to be linked, but i think would need to create a new field
        TransferLine.SetFilter("Quantity", '>=%1', Rec."Quantity");
        TransferLines.SetTableView(TransferLine);
        if TransferLines.RunModal() = Action::LookupOK then begin
            TransferLines.GetRecord(TransferLine);

            //TLY-SD - 06/01/2026 - here we need to check what is linked to the PO and TO, because some was linked to the PO before it was turned into a TO
            // Message('to cont # = %1.', TransferLine."TPS CMG Container No.");
            ContainerLine.Reset;
            ContainerLine.SetRange("Container No.", TransferLine."TPS CMG Container No.");
            if ContainerLine.Find('-') then begin
                ContainerLine.CalcFields("Transfer Order No.", "Transfer Order Line No.");
                // Message('%1, %2, %3, %4.', TransferLine."TPS CMG Container No.", ContainerLine."Container No.", ContainerLine."Transfer Order No.", ContainerLine."Transfer Order Line No.");
                ContainerLine.SetRange("Transfer Order No.", TransferLine."Document No.");
                ContainerLine.SetRange("Transfer Order Line No.", TransferLine."Line No.");
                ContainerLine.CalcFields("Quantity Linked via PO", "Quantity Linked via TO");
            end;
            TransferLine.CalcFields("Quantity Linked");
            // Message('%1, %2, %3. po = %4. to = %5. to on cont = %6.', TransferLine."TPS CMG Container No.", TransferLine."Document No.", TransferLine."Line No.", ContainerLine."Quantity Linked via PO", TransferLine."Quantity Linked", ContainerLine."Quantity Linked via TO");

            if (TransferLine."Quantity Linked" + ContainerLine."Quantity Linked via PO" + Rec.Quantity) > TransferLine.Quantity then begin
                Error('ERROR!\\Not enough quantity remaining on %1 line %2.\\Please choose another transfer.', TransferLine."Document No.", TransferLine."Line No.");
            end else begin
                Message('SUCCESS!\\%1 from %2 with a quantity of %3 will be linked to %4 line %5.', Rec."No.", Rec."Document No.", Rec."Quantity", TransferLine."Document No.", TransferLine."Line No.");
                Rec.Validate(Rec."Linked Transfer Order No.", TransferLine."Document No.");
                Rec.Validate(Rec."Linked Transfer Order Line No.", TransferLine."Line No.");
                Rec.Modify(true);
                Commit();
            end;
        end;
    end;
}