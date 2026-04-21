pageextension 51662 TlyNTNWebCompContactCard extends "NTN Web Comp. Contact Card"
{
    layout
    {
        addafter("Salesperson Code")
        {
            field("Customer No."; Rec."Customer No.")
            {
                ApplicationArea = All;
                Caption = 'Customer No.';
                ToolTip = 'Customer No.';
            }
        }
    }
}
