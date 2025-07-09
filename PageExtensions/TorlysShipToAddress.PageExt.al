pageextension 50300 TorlysShipToAddress extends "Ship-to Address"
{
    layout
    {

        moveafter(ShowMap; "Phone No.")

        moveafter(Contact; "Fax No.", "E-Mail", "Location Code", "Shipment Method Code", "Shipping Agent Code", "Tax Liable", "Tax Area Code")

        addafter("Tax Area Code")
        {
            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                Caption = 'SystemCreatedBy';
                ToolTip = 'SystemCreatedBy';
                ApplicationArea = All;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'SystemCreatedAt';
                ToolTip = 'SystemCreatedAt';
                ApplicationArea = All;
            }

            field(SystemModifiedBy; Rec.SystemModifiedBy)
            {
                Caption = 'SystemModifiedBy';
                ToolTip = 'SystemModifiedBy';
                ApplicationArea = All;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'SystemModifiedAt';
                ToolTip = 'SystemModifiedAt';
                ApplicationArea = All;
            }
        }

        addafter(General)
        {
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
    }
}