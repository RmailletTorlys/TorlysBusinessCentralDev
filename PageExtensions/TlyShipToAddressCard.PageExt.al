pageextension 50300 TlyShipToAddressCard extends "Ship-to Address"
{
    layout
    {
        moveafter(ShowMap; "Phone No.", "Fax No.", "E-Mail")

        addafter("E-Mail")
        {
            field("Dealer Locator Participant"; Rec."Dealer Locator Participant")
            {
                ApplicationArea = All;
                Caption = 'Dealer Locator Participant';
                ToolTip = 'Dealer Locator Participant';
            }
        }

        moveafter("Location Code"; "Shipment Method Code", "Shipping Agent Code")

        addafter("Shipping Agent Code")
        {
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                ApplicationArea = All;
                Caption = 'Freight Zone Code';
                ToolTip = 'Freight Zone Code';
            }
            field("Shipping Instructions"; Rec."Shipping Instructions")
            {
                ApplicationArea = All;
                Caption = 'Shipping Instructions';
                ToolTip = 'Shipping Instructions';
                Visible = false;
            }
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                ApplicationArea = All;
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
                MultiLine = true;
            }
        }

        moveafter("Shipping Comment"; "Tax Liable", "Tax Area Code")

        addafter("Tax Area Code")
        {
            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
            }

            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                ApplicationArea = All;
            }
        }

        addafter(General)
        {
            group("Shipping Days")
            {
                Caption = 'Shipping Days';

                field("Ships On - Monday"; Rec."Ships On - Monday")
                {
                    Caption = 'Ships On - Monday';
                    ToolTip = 'Ships On - Monday';
                    ApplicationArea = All;
                }
                field("Ships On - Tuesday"; Rec."Ships On - Tuesday")
                {
                    Caption = 'Ships On - Tuesday';
                    ToolTip = 'Ships On - Tuesday';
                    ApplicationArea = All;
                }
                field("Ships On - Wednesday"; Rec."Ships On - Wednesday")
                {
                    Caption = 'Ships On - Wednesday';
                    ToolTip = 'Ships On - Wednesday';
                    ApplicationArea = All;
                }
                field("Ships On - Thursday"; Rec."Ships On - Thursday")
                {
                    Caption = 'Ships On - Thursday';
                    ToolTip = 'Ships On - Thursday';
                    ApplicationArea = All;
                }
                field("Ships On - Friday"; Rec."Ships On - Friday")
                {
                    Caption = 'Ships On - Friday';
                    ToolTip = 'Ships On - Friday';
                    ApplicationArea = All;
                }
            }
            group("Receiving Capabilities")
            {
                Caption = 'Receiving Capabilities';

                field("Receiving Hours"; Rec."Receiving Hours")
                {
                    Caption = 'Receiving Hours';
                    ToolTip = 'Receiving Hours';
                    ApplicationArea = All;
                }

                field("Maximum Truck Size"; Rec."Maximum Truck Size")
                {
                    Caption = 'Maximum Truck Size';
                    ToolTip = 'Maximum Truck Size';
                    ApplicationArea = All;
                }

                field("Have Dock"; Rec."Have Dock")
                {
                    Caption = 'Have Dock';
                    ToolTip = 'Have Dock';
                    ApplicationArea = All;
                }

                field("Tailgate Required"; Rec."Tailgate Required")
                {
                    Caption = 'Tailgate Required';
                    ToolTip = 'Tailgate Required';
                    ApplicationArea = All;

                }

                field("Pump Truck Required"; Rec."Pump Truck Required")
                {
                    Caption = 'Pump Truck Required';
                    ToolTip = 'Pump Truck Required';
                    ApplicationArea = All;
                }

                field("Forklift Available"; Rec."Forklift Available")
                {
                    Caption = 'Forklift Available';
                    ToolTip = 'Forklift Available';
                    ApplicationArea = All;
                }
            }
        }

        modify(GLN)
        {
            Visible = false;
        }

        modify("Home Page")
        {
            Visible = false;
        }

        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }

        modify("Last Date Modified")
        {
            Visible = false;
        }

        modify(Contact)
        {
            Visible = false;
        }

        modify("Shipment Method Code")
        {
            Visible = false;
        }
    }

    // trigger OnNewRecord(BelowxRec: Boolean)
    // var
    //     Customer: Record Customer;
    // begin
    //     if not Customer.Get(Rec.GetFilterCustNo()) then
    //         exit;
    //     Rec.Validate("Location Code", Customer."Location Code");
    //     Rec.Validate("Shipment Method Code", Customer."Shipment Method Code");
    //     Rec.Validate("Shipping Agent Code", Customer."Shipping Agent Code");
    //     Rec.Validate("Freight Zone Code", Customer."Freight Zone Code");
    //     Rec.Validate("Shipping Instructions", Customer."Shipping Instructions");
    //     Rec.Validate("Shipping Comment", Customer."Shipping Comment");
    //     Rec.Validate("Tax Liable", Customer."Tax Liable");
    //     Rec.Validate("Tax Area Code", Customer."Tax Area Code");
    // end;

    var
        LookupUserId: Codeunit TlyLookupUserID;

}
