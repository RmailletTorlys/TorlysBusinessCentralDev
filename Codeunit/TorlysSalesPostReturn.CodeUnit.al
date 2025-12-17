codeunit 50018 TorlysSalesPostReturn
{
    [EventSubscriber(ObjectType::Table, Database::"Return Receipt Line", 'OnAfterInitFromSalesLine', '', false, false)]
    local procedure OnAfterInitFromSalesLine(ReturnRcptHeader: Record "Return Receipt Header"; SalesLine: Record "Sales Line"; var ReturnRcptLine: Record "Return Receipt Line")
    begin
        // quantity case and pallet dont transfer properly on return if partial
        ReturnRcptLine."Quantity Case" := SalesLine."Return Qty. to Receive Case";
        ReturnRcptLine."Quantity Pallet" := SalesLine."Return Qty. to Receive Pallet";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    var
        SalesLine: Record "Sales Line";
    begin
        // "Qty. to Invoice" never gets populated on return (our choice)
        if SalesHeader."Document Type" = SalesHeader."Document Type"::"Return Order" then begin
            SalesLine.Reset();
            SalesLine.SetFilter("Document Type", 'Return Order');
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            if SalesLine.Find('-') then
                repeat
                    SalesLine.Validate("Qty. to Invoice", SalesLine."Return Qty. Rcd. Not Invd.");
                    SalesLine.Validate("Qty. to Invoice (Base)", SalesLine."Ret. Qty. Rcd. Not Invd.(Base)");
                    SalesLine.Modify(true);
                    Commit();
                until SalesLine.Next() = 0
        end;
    end;
}