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
            repeater(General)
            {

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

                field("Power Up Member"; Rec.PowerUp)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the PowerUp ID.';
                }
                field("Power Up Level"; Rec."PowerUpLevel")
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