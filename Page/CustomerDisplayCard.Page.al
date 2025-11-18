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

                part(DisplayLinesPart; "Customer Display Lines Part")
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