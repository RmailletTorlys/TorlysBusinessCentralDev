pageextension 59084 TlyCustomerDetailsFactBox extends "Customer Details FactBox"
{
    layout
    {
        addafter("No.")
        {
            field("Collector ID"; Rec."Collector ID")
            {
                ApplicationArea = All;
                Caption = 'Collector ID';
                ToolTip = 'Collector ID';
                Visible = true;
            }
            field("Salesperson Code"; Rec."Salesperson Code")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Code';
                ToolTip = 'Salesperson Code';
                Visible = true;
            }
        }
    }
}