page 50305 "Item Category Lookup"
{
    PageType = List;
    SourceTable = "Item Category";
    Editable = false;
    Caption = 'Item Category';


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

                field("Description"; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description';
                }

                field("Sales Price Code"; Rec."Sales Price Code")
                {
                    ApplicationArea = All;
                    Caption = 'Sales Price Code';
                    ToolTip = 'Sales Price Code';
                }
            }
        }
    }
    trigger OnFindRecord(Which: Text): Boolean
    var
        Found: Boolean;
        IsHandled: Boolean;
    begin
        exit(Rec.Find(Which));
    end;
}