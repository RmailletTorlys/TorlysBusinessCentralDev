page 50555 "Warehouse Assignment"
{
    Caption = 'Warehouse Picker Assignment';
    PageType = List;
    SourceTable = "Salesperson/Purchaser";



    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the warehouse associate.';
                    Caption = 'Code';
                }

                field("Name"; Rec."Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the warehouse associate.';
                    Caption = 'Name';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Select)
            {
                Caption = 'Select';
                Tooltip = 'Select';
                Image = CheckList;
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    CurrPage.Close(); // Close the page after selection
                end;
            }
        }
    }
}
