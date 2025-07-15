page 55002 "Freight Zone Lookup"
{
    Caption = 'Freight Zones';
    CardPageID = "Freight Zone Card";
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    SourceTable = "Torlys Freight Zones";

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
