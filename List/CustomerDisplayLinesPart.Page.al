Page 51025 "Customer Display Lines Part"
{
    Caption = 'Customer Display Lines Part';
    PageType = ListPart;
    SourceTable = "Display Line";
    ApplicationArea = All;

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

    actions
    {
    }
}