page 51015 TlyFreightZoneList
{
    Caption = 'Freight Zones';
    CardPageID = TlyFreightZoneCard;
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    SourceTable = TlyFreightZone;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'Code of the freight zone.';
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description of the freight zone.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }
}
