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
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }

                field("Shipment No."; Rec."Shipment No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated shipment';
                }

                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The date of the shipment';
                }

                field("PO Number"; Rec."External Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated purchase order';
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
                    ToolTip = 'The associated ship-to address 2';

                }

                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated ship-to city';
                }

                field("Ship-to State"; Rec."Ship-to County")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated ship-to state';
                }

                field("Ship-to Country"; Rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated ship-to country';

                }

                field("Ship-to Zip"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated ship-to zip';
                }

                field("Total Weight"; Rec."Total Weight")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated total weight';
                }

                field("Total Cases"; Rec."Total Cases")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated total cases';

                }

                field("Total Base Qty."; Rec."Total Pallet")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated total base quantity';
                    Caption = 'NEED TO UPDATE FIELD';

                }


            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("BOL No.", Rec."BOL No.");
    end;



}