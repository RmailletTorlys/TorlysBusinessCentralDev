Page 51025 "Customer Display Lines Part"
{
    Caption = 'Customer Display Lines Part';
    PageType = ListPart;
    SourceTable = "Display Line";
    ApplicationArea = All;
    PopulateAllFields = true;

    layout
    {
        area(Content)
        {
            repeater(DisplayLines)
            {
                field("Line No."; Rec."LineNo.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line number.';
                }
                field("Customer No."; Rec."CustNo.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number.';
                }

                field("Customer Location"; Rec."CustLocationCode")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer location code.';
                }

                field("Display Type"; Rec."Display Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the display type.';
                }
                field("Program No."; Rec."Program No.")
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