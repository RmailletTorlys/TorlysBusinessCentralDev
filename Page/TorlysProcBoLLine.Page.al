page 55009 "Torlys Proc BoL Line"
{
    ApplicationArea = Basic, Suite;
    Caption = 'Processed BoL Lines';
    Editable = true;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Torlys Processed BOL Line";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("BoL No."; Rec."BOL No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Caption = 'BoL No.';
                }

                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the order that is being shipped.';
                    Caption = 'Order No.';
                }

                field("Shipment No."; Rec."Shipment No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the shipment that is being shipped.';
                    Caption = 'Shipment No.';
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated customer';
                }

                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated ship-to code';
                }

                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated ship-to name';
                }

                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated ship-to address';
                }

                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the second line of the address of the ship-to address.';
                    Caption = 'Ship-to Address 2';

                }

                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated ship-to city';
                }

                field("Ship-to County"; Rec."Ship-to County")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the county of the ship-to address.';
                    Caption = 'Ship-to County';
                }

                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the post code of the ship-to address.';
                    Caption = 'Ship-to Post Code';
                }
            }
        }
    }
}