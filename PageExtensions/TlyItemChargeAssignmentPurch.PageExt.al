pageextension 55805 TlyItemChargeAssignmentPurch extends "Item Charge Assignment (Purch)"
{
    layout
    {
        addafter(Description)
        {
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
                Caption = 'Gen. Prod. Posting Group';
                ToolTip = 'Gen. Prod. Posting Group';
                Editable = false;
            }
        }
    }
}