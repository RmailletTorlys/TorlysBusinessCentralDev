codeunit 50020 TlyPostSalesShipment
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Shipment Line", 'OnAfterInitFromSalesLine', '', false, false)]
    local procedure OnAfterInitFromSalesLine(SalesShptHeader: Record "Sales Shipment Header"; SalesLine: Record "Sales Line"; var SalesShptLine: Record "Sales Shipment Line")
    begin
        // quantity case and pallet dont transfer properly on shipment if backorder
        SalesShptLine."Quantity Case" := SalesLine."Qty. to Ship Case";
        SalesShptLine."Quantity Pallet" := SalesLine."Qty. to Ship Pallet";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean; PreviewMode: Boolean)
    var
        SalesLine: Record "Sales Line";
    begin
        // when posting shipment for a G/L Account, it clears the "Qty. to Invoice"
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            SalesLine.Reset();
            SalesLine.SetFilter("Document Type", 'Order');
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
    end;
}