tableextension 50032 TlyItemLedgerEntry extends "Item Ledger Entry"
{
    fields
    {
        field(50001; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            ToolTip = 'Reason Code';
            FieldClass = FlowField;
            CalcFormula = lookup("Value Entry"."Reason Code" where("Item Ledger Entry No." = field("Entry No.")));
        }
    }
}