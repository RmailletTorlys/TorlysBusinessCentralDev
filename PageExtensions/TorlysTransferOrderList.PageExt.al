pageextension 55742 TorlysTransferOrders extends "Transfer Orders"
{
    layout
    {
        moveafter("No."; Status)

        addafter("Status")
        {
            field("Transfer Type"; Rec."Transfer Type")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Transfer Type';
                Caption = 'Transfer Type';
            }
        }
        moveafter("Transfer Type"; "Transfer-from Code", "Transfer-to Code", "Direct Transfer", "In-Transit Code", "Shipment Date", "Receipt Date")

        modify("Shipment Date")
        {
            visible = true;
        }

        modify("Receipt Date")
        {
            visible = true;
        }
    }
}
