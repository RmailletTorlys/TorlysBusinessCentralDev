page 55006 "Torlys BOL Subform"
{
    AutoSplitKey = true;
    Caption = 'Bill of Lading Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Torlys BOL Line";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                ShowCaption = false;
                field("BOL No."; Rec."BOL No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Caption = 'Customer No.';
                }

                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the ship-to address.';
                    Caption = 'Ship-to Code';
                }

                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the ship-to address.';
                    Caption = 'Ship-to Name';
                }

                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the address of the ship-to address.';
                    Caption = 'Ship-to Address';
                }

                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the second address line of the ship-to address.';
                    Caption = 'Ship-to Address 2';
                }

                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the city of the ship-to address.';
                    Caption = 'Ship-to City';
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

                field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the country/region code of the ship-to address.';
                    Caption = 'Ship-to Country/Region Code';
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
                    ToolTip = 'Specifies the date that the shipment is being shipped.';
                    Caption = 'Shipment Date';
                }

                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the external document that is being shipped.';
                    Caption = 'External Document No.';
                }

                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the shipping agent that is being used to ship the document.';
                    Caption = 'Shipping Agent Code';
                }

                field("Destination Instruction 1"; Rec."Destination Instruction 1")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the first line of the destination instructions.';
                    Caption = 'Destination Instruction';
                }

                field("Destination Instruction 2"; Rec."Destination Instruction 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the second line of the destination instructions.';
                    Caption = 'Destination Instruction 2';
                }

                field("Total Cases"; Rec."Total Cases")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total number of cases that are being shipped.';
                    Caption = 'Total Cases';
                }

                field("Total Pallet"; Rec."Total Pallet")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total number of pallets that are being shipped.';
                    Caption = 'Total Pallet';
                }

                field("Total Weight"; Rec."Total Weight")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total weight of the items that are being shipped.';
                    Caption = 'Total Weight';
                }
            }
        }

    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("BOL No.", Rec."BOL No.");
    end;



}