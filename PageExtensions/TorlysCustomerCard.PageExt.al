pageextension 50002 TorlysCustomerCard extends "Customer Card"
{
    layout
    {
        addafter("No.")
        {
            field("Collector ID"; Rec."Collector ID")
            {
                ApplicationArea = All;
                Caption = 'Collector ID';
                Visible = true;
                ToolTip = 'This field is the Primary Credit Collector assigned to the customer account.';
            }
        }
    }

}