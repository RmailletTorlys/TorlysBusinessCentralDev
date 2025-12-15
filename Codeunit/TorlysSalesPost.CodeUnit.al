codeunit 50018 TorlysSalesPost
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    var
        SalesLine: Record "Sales Line";
    begin
        // this is because when posting shipment for a G/L Account, it clears the "Qty. to Invoice"
        SalesLine.Reset();
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetFilter(Type, 'G/L Account');
        if SalesLine.Find('-') then
            repeat
                // Message('QTS = %1, Outs. QTY = %2, Sh not inv = %3', SalesLine."Qty. to Ship", SalesLine."Outstanding Quantity", SalesLine."Qty. Shipped Not Invoiced");
                SalesLine.Validate("Qty. to Invoice", SalesLine."Qty. Shipped Not Invoiced");
                SalesLine.Validate("Qty. to Invoice (Base)", SalesLine."Qty. Shipped Not Invd. (Base)");
                SalesLine.Modify(true);
                Commit();
            until SalesLine.Next() = 0
    end;
}