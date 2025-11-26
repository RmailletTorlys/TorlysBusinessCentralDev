Page 51023 "Customer Displays List"
{
    Caption = 'Customer Displays';
    PageType = List;
    DataCaptionFields = CustLocationCode;
    SourceTable = "Display Header";
    CardPageId = "Customer Display Card";
    Editable = false;


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

                field("Customer Address"; Rec.CustAddress)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer address.';
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