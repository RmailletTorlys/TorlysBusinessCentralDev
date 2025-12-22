pageextension 50313 TorlysGenProductPostingGroups extends "Gen. Product Posting Groups"
{
    layout
    {
        addafter("Description")
        {
            field("Reportable Group"; Rec."Reportable Group")
            {
                ApplicationArea = All;
                Caption = 'Reportable Group';
                ToolTip = 'Specifies if this a reportable group.';
            }
        }
    }
}