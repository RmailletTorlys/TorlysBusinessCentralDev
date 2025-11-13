Page 51023 "Customer Displays List"
{
    Caption = 'Customer Displays';
    PageType = List;
    SourceTable = "Display Header";
    CardPageId = "Customer Display Card";
    ApplicationArea = All;
    UsageCategory = Lists;

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
                    ToolTip = 'Specifies the customer  code.';
                }
                field("Power Up"; Rec."PowerUp")
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