page 55006 "Torlys BOL Subform"
{
    AutoSplitKey = true;
    Caption = 'BoL Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Torlys BOL Line";


    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
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
                    ToolTip = 'Specifies the second line of the address of the ship-to address.';
                    Caption = 'Ship-to Address 2';
                }

                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the city of the ship-to address.';
                    Caption = 'Ship-to City';
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

                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the post code of the ship-to address.';
                    Caption = 'Ship-to Post Code';
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

    trigger OnOpenPage()
    begin
        Rec.SetRange("BOL No.", Rec."BOL No.");
    end;



}