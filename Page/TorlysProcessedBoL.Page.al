page 55014 "Torlys Processed BOL"
{
    AdditionalSearchTerms = 'Bill of Lading, BOL, BoL';
    Caption = 'Processed Bill of Lading';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Torlys Processed BOL Header";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Caption = 'No.';
                }

                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the type of transaction that is being posted for this bill of lading.';
                    Caption = 'Transaction Type';
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Caption = 'Customer No.';
                }

                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
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

                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the post code of the ship-to address.';
                    Caption = 'Ship-to Post Code';
                }

                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the user who posted the bill of lading.';
                    Caption = 'Posted By';
                }

                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date the bill of lading was posted.';
                    Caption = 'Posted Date';
                }
            }

            group(Shipping)
            {
                Caption = 'Shipping';

                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the location.';
                    Caption = 'Location Code';
                }

                field("Pickup Date"; Rec."Pickup Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date of the pickup.';
                    Caption = 'Pickup Date';
                }

                field("Carrier Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the Carrier agent.';
                    Caption = 'Carrier Agent Code';
                }

                field("Carrier Tracking No."; Rec."Carrier Tracking No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the tracking number of the carrier.';
                    Caption = 'Carrier Tracking No.';
                }

                field("Whse Associate Loaded By"; Rec."Warehouse Associate Loaded by")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the warehouse associate who loaded the bill of lading.';
                    Caption = 'Whse Associate Loaded By';
                }

                field("Shipping Instructions 1"; Rec."Shipping Instructions 1")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the first line of the shipping instructions.';
                    Caption = 'Shipping Instructions 1';
                }

                field("Shipping Instructions 2"; Rec."Shipping Instructions 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the second line of the shipping instructions.';
                    Caption = 'Shipping Instructions 2';
                }
                group("Shipment Contents")
                {
                    Caption = 'Shipment Contents';
                    field("No. of Skids"; Rec."No. of Skids")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the number of skids in the shipment.';
                        Caption = 'No. of Skids';
                    }
                    field("No. of Boxes"; Rec."No. of Boxes")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the number of boxes in the shipment.';
                        Caption = 'No. of Boxes';
                    }
                    field("No. of Tubes"; Rec."No. of Tubes")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the number of tubes in the shipment.';
                        Caption = 'No. of Tubes';
                    }
                    field("No. of Packages"; Rec."No. of Packages")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the number of packages in the shipment.';
                        Caption = 'No. of Packages';
                    }
                    field("No. of Rolls"; Rec."No. of Rolls")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the number of rolls in the shipment.';
                        Caption = 'No. of Rolls';
                    }

                    field("Piece Count"; Rec."Piece Count")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the number of pieces in the shipment.';
                        Caption = 'Piece Count';
                    }
                }
            }

            group(Destination)
            {
                Caption = 'Destination';
                field("Destination Instructions 1"; Rec."Destination Instructions 1")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the first line of the destination instructions.';
                    Caption = 'Destination Instructions 1';
                }

                field("Destination Instructions 2"; Rec."Destination Instructions 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the second line of the destination instructions.';
                    Caption = 'Destination Instructions 2';
                }
            }

            part(BoLLine; "Torlys Proc BOL Subform")
            {
                ApplicationArea = All;
                Editable = true;
                Enabled = true;
                SubPageLink = "BOL No." = field("No.");
                UpdatePropagation = Both;
            }

            group(WeightsQuantities)
            {
                Caption = 'Weights & Quantities';
                group(Weights)
                {

                    Caption = 'Weights';

                    field("Weight - Flooring"; Rec."Weight - Flooring")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the weight of the flooring in the shipment.';
                        Caption = 'Weight - Flooring';
                    }

                    field("Weight - Underlayment Rolls"; Rec."Weight - Underlayment Rolls")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the weight of the underlayment rolls in the shipment.';
                        Caption = 'Weight - Underlayment Rolls';
                    }

                    field("Weight - Mouldings"; Rec."Weight - Mouldings")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the weight of the mdlings in the shipment.';
                        Caption = 'Weight - Mouldings';
                    }

                    field("Weight - Other"; Rec."Weight - Other")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the weight of other items in the shipment.';
                        Caption = 'Weight - Other';
                    }

                    field("Weight - Total"; Rec."Weight - Total")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the total weight of the shipment.';
                        Caption = 'Weight - Total';
                    }

                }

                group(Quantity)
                {
                    Caption = 'Quantity(CASE)';

                    field("Cases - Flooring"; Rec."Cases - Flooring")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the quantity of the flooring in the shipment.';
                        Caption = 'Case - Flooring';
                    }

                    field("Cases - Underlayment Rolls"; Rec."Cases - Underlayment Rolls")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the quantity of the underlayment rolls in the shipment.';
                        Caption = 'Cases - Underlayment Rolls';
                    }

                    field("Cases - Mouldings"; Rec."Cases - Mouldings")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the quantity of the mdlings in the shipment.';
                        Caption = 'Cases - Mouldings';

                    }

                    field("Cases - Other"; Rec."Cases - Other")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the quantity of other items in the shipment.';
                        Caption = 'Cases - Other';

                    }

                    field("Cases - Total"; Rec."Cases - Total")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the total quantity of the shipment.';
                        Caption = 'Cases - Total';
                    }

                }

                group(Quantity2)
                {
                    Caption = 'Quantity(BASE)';

                    field("Base Quantity - Flooring"; Rec."Base Quantity - Flooring")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the base quantity of the flooring in the shipment.';
                        Caption = 'Base Quantity - Flooring';
                    }

                    field("Base Quantity - Underlayment Rolls"; Rec."Base Qty. - Underlayment Rolls")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the base quantity of the Underlayment Rolls in the shipment.';
                        Caption = 'Base Quantity - Underlayment Rolls';
                    }

                    field("Base Quantity - Mouldings"; Rec."Base Quantity - Mouldings")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the base quantity of the mdlings in the shipment.';
                        Caption = 'Base Quantity - Mouldings';
                    }

                    field("Base Quantity - Other"; Rec."Base Quantity - Other")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the base quantity of other items in the shipment.';
                        Caption = 'Base Quantity - Other';
                    }

                    field("Base Quantity - Total"; Rec."Base Quantity - Total")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the total base quantity of the shipment.';
                        Caption = 'Base Quantity - Total';
                    }
                }
            }
        }
    }
}
