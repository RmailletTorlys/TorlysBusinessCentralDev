page 51013 "Lookup Values Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Torlys Lookup Values";
    Caption = 'Lookup Values Card';
    Editable = true;

    layout
    {
        area(Content)
        {
            group(Group)
            {
                Caption = 'General';
                field(Type; Rec."Type")
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                    ToolTip = 'Lookup Value Type.';
                }
                field(Code; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'Lookup Value Code.';
                }
                field(Description; Rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Lookup Value Description.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Back)
            {
                ApplicationArea = All;
                Caption = 'Back';
                ToolTip = 'Return to the previous page.';
                RunObject = page "Sales Price Code List";
                RunPageMode = Create;
            }
        }
    }
}