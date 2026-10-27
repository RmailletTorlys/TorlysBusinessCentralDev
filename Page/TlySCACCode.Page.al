page 55079 TlySCACCode
{
    Caption = 'SCAC Code';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;
    SourceTable = TlySCACCode;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'Code';
                }

                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description';
                }
            }
        }
    }
}
