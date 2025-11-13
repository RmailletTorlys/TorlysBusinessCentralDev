Page 51024 "Customer Display Card"
{
    Caption = 'Customer Display Card';
    PageType = Card;
    SourceTable = "Display Header";
    ApplicationArea = All;


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Customer No."; Rec."CustNo.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number.';
                }
                field("Customer Location"; Rec."CustLocationCode")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer code.';
                }
                field("Power Up"; Rec."PowerUp")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the PowerUp ID.';
                }

            }
            group(DisplayLines)
            {
                Caption = 'Display Lines';

                part(DisplayLinesPart; "Customer Display Lines Part")
                {
                    ApplicationArea = All;
                    SubPageLink = "CustNo." = field("CustNo."),
                                  "CustLocationCode" = field("CustLocationCode");
                }
            }
        }
    }
}