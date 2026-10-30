tableextension 55805 TlyItemChargeAssignmentPurch extends "Item Charge Assignment (Purch)"
{
    fields
    {
        field(50001; "Gen. Prod. Posting Group"; Code[20])
        {
            Caption = 'Gen. Prod. Posting Group';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Gen. Prod. Posting Group" where("No." = field("Item No.")));
            Editable = false;
        }
    }
}