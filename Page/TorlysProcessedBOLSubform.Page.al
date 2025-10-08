page 51008 "Torlys Processed BOL Subform"
{
    AutoSplitKey = true;
    Caption = 'Processed Bill of Lading Subform';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Torlys Processed BOL Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("BOL No."; Rec."BOL No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the bill of lading.';
                    Caption = 'BOL No.';
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

                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date of the shipment.';
                    Caption = 'Shipment Date';
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

                field("Ship-to State"; Rec."Ship-to County")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the state of the ship-to address.';
                    Caption = 'Ship-to State';
                }
                field("Ship-to Country"; Rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the country of the ship-to address.';
                    Caption = 'Ship-to Country';
                }

                field("Ship-to Comment 1"; Rec."Destination Instruction 1")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the first line of the comment for the ship-to address.';
                    Caption = 'Ship-to Comment 1';
                }

                field("Ship-to Comment 2"; Rec."Destination Instruction 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the second line of the comment for the ship-to address.';
                    Caption = 'Ship-to Comment 2';
                }

                field("Total Weight"; Rec."Total Weight")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total weight of the shipment.';
                    Caption = 'Total Weight';
                }

                field("Total Cases"; Rec."Total Cases")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total number of cases in the shipment.';
                    Caption = 'Total Cases';
                }
            }
        }
    }
}