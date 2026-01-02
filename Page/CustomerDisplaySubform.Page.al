Page 51025 "Customer Display Subform"
{
    Caption = 'Customer Display Lines';
    PageType = ListPart;
    SourceTable = TlyDisplayLine;
    SourceTableView = sorting("Display Type", "Item Category Code") order(ascending);
    ApplicationArea = All;
    PopulateAllFields = true;
    DelayedInsert = true;
    LinksAllowed = false;
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(DisplayLines)
            {
                field("Customer No."; Rec."CustNo.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number.';
                    Visible = false;
                }

                field("Customer Location"; Rec."CustLocationCode")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer location code.';
                    Visible = false;
                }

                field("Display Type"; Rec."Display Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the display type.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the program number.';

                    trigger OnValidate()
                    begin
                        Rec.PopulateDescription(Rec);
                        CurrPage.Update(true);
                    end;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description.';
                }
                field("Comments"; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the comments.';
                }
            }
        }
    }
}