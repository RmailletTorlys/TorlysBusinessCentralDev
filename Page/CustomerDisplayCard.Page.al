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

                    trigger onValidate()
                    begin
                        Rec.GetDisplayHeaderInfo(Rec);
                        CurrPage.Update(true);
                    end;
                }
                field("Customer Name"; Rec.CustName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer name.';
                }
                field("Customer Location"; Rec."CustLocationCode")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer code.';

                    trigger onValidate()
                    begin
                        Rec.GetShipToAddressInfo(Rec);
                        CurrPage.Update(true);
                    end;
                }
                field("Customer Address"; Rec.CustAddress)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer address.';
                }
                field("Power Up Member"; Rec."PowerUp")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the PowerUp ID.';
                }

                field("Power Up Level"; Rec."PowerUpLevel")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the PowerUp Level.';
                }

            }
            group(DisplayLines)
            {
                Caption = 'Display Lines';

                part(DisplayLinesPart; "Customer Display Subform")
                {
                    ApplicationArea = All;
                    UpdatePropagation = Both;
                    SubPageLink = "CustNo." = field("CustNo."),
                                  "CustLocationCode" = field("CustLocationCode");
                }
            }
        }
    }
}