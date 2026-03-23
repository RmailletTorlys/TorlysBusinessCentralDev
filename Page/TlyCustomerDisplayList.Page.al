Page 51023 TlyCustomerDisplayList
{
    ApplicationArea = Basic, Suite, Assembly;
    UsageCategory = Lists;
    Caption = 'Customer Displays';
    PageType = List;
    // DataCaptionFields = CustLocationCode;
    SourceTable = TlyDisplayHeader;
    CardPageId = "Customer Display Card";
    Editable = false;
    AdditionalSearchTerms = 'Displays, Customer Displays';

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number.';
                }
                field("Customer Location"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer  code.';
                }

                field("Customer Address"; Rec.CustAddress)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer address.';
                }

                field("Power Up Member"; Rec.Club)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the PowerUp ID.';
                }
                field("Power Up Level"; Rec."Power Up Level")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the PowerUp ID.';
                }

            }
        }
    }

    actions
    {
    }
}