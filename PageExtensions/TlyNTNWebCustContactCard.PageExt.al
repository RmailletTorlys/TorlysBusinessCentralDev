pageextension 51660 TlyNTNWebCustContactCard extends "NTN Web Cust. Contact Card"
{
    layout
    {
        addafter("No.")
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