page 55095 TlyMKStagedLocation
{
    Caption = 'MK Staged Location';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;
    SourceTable = TlyMKStagedLocation;


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
