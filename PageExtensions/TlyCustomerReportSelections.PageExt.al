pageextension 59657 TlyCustomerReportSelections extends "Customer Report Selections"
{
    layout
    {
        addbefore(Usage2)
        {
            field("Source No."; Rec."Source No.")
            {
                ApplicationArea = All;
                Caption = 'Source No.';
                ToolTip = 'Source No.';
                Visible = true;
                Editable = false;
            }
            field("Ship-to Code"; Rec."Ship-to Code")
            {
                ApplicationArea = All;
                Caption = 'Ship-to Code';
                ToolTip = 'Ship-to Code';
                Visible = true;
            }
        }
    }
}