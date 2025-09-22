pageextension 50042 TorlysSalesOrder extends "Sales Order"
{
    layout
    {
        movefirst(General; "Sell-to Customer No.")
        moveafter("Sell-to Customer No."; "Ship-to Code", "Sell-to Customer Name")
        moveafter("Sell-to Customer Name"; "Sell-to", "Order Date", "Posting Date")

        addafter("Posting Date")
        {
            field("Order Method"; Rec."Order Method")
            {
                Caption = 'Order Method';
                ToolTip = 'Order Method';
                ApplicationArea = All;
            }

            field("Temporary Hold"; Rec."Temporary Hold")
            {
                Caption = 'Temporary Hold';
                ToolTip = 'Temporary Hold';
                ApplicationArea = All;
                Importance = Additional;
            }

            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
            }
        }

        moveafter("Tag Name"; "Shipment Date", "Requested Delivery Date", Status, "External Document No.", "Salesperson Code")

        addafter("Salesperson Code")
        {
            field("Salesperson Commission"; Rec."Salesperson Commission")
            {
                Caption = 'Salesperson Commission';
                ToolTip = 'Salesperson Commission';
                ApplicationArea = All;
                Importance = Additional;
            }

            field("Salesperson Code 2"; Rec."Salesperson Code 2")
            {
                Caption = 'Salesperson Code 2';
                ToolTip = 'Salesperson Code 2';
                ApplicationArea = All;
                Importance = Additional;

            }

            field("Salesperson Commission 2"; Rec."Salesperson Commission 2")
            {
                Caption = 'Salesperson Commission 2';
                ToolTip = 'Salesperson Commission 2';
                ApplicationArea = All;
                Importance = Additional;
            }

            field("Salesperson Code 3"; Rec."Salesperson Code 3")
            {
                Caption = 'Salesperson Code 3';
                ToolTip = 'Salesperson Code 3';
                ApplicationArea = All;
                Importance = Additional;
            }

            field("Salesperson Commission 3"; Rec."Salesperson Commission 3")
            {
                Caption = 'Salesperson Commission 3';
                ToolTip = 'Salesperson Commission 3';
                ApplicationArea = All;
                Importance = Additional;
            }
        }



        addafter("Salesperson Commission 3")
        {

            field(ShortcutDimCode3; ShortcutDimCode[3])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,3';
                ToolTip = 'Global Dimension 3 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimension(3);
                end;
            }


            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                Caption = 'System Created By';
                ToolTip = 'System Created By';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'System Created Date';
                ToolTip = 'System Created Date';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }

            field(SystemModifiedBy; Rec.SystemModifiedBy)
            {
                Caption = 'System Last Modified By';
                ToolTip = 'System Last Modified By';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'System Last Modified Date';
                ToolTip = 'System Last Modified Date';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }

        }


        movefirst("Invoice Details"; BillToOptions, "Shortcut Dimension 1 Code", "Currency Code", "Gen. Bus. Posting Group", "Customer Posting Group", "Payment Terms Code", "Due Date", "Tax Liable", "Tax Area Code")

        addafter(BilltoOptions)
        {
            field("On Hold"; Rec."On Hold")
            {
                Caption = 'On Hold';
                ToolTip = 'On Hold';
                ApplicationArea = All;
                Importance = Promoted;
                Editable = false;
            }
        }

        movefirst("Shipping and Billing"; "Shipment Method", "Shipment Method Code", "Shipping Agent Code")

        addafter("Shipping Agent Code")
        {
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                Caption = 'Freight Zone Code';
                ToolTip = 'Freight Zone Code';
                ApplicationArea = All;
                Importance = Additional;
                TableRelation = "Torlys Freight Zones";
            }
        }

        moveafter("Freight Zone Code"; "Location Code", "Shipping Advice")

        addafter("Shipping and Billing")
        {
            group("Marketing")
            {
                Caption = 'Marketing';

                field("Club"; Rec."Club")
                {
                    Caption = 'Club';
                    ToolTip = 'Club';
                    ApplicationArea = All;
                    Importance = Additional;
                }

                field("Power Up Level"; Rec."Powerup Level")
                {
                    Caption = 'Power Up Level';
                    ToolTip = 'Power Up Level';
                    ApplicationArea = All;
                    Importance = Additional;
                }

                field("Sample Allowance Exclusion"; Rec."Sample Allowance Exclusion")
                {
                    Caption = 'Sample Allowance Exclusion';
                    ToolTip = 'Sample Allowance Exclusion';
                    ApplicationArea = All;
                    Importance = Additional;
                }


                field("MK Required"; Rec."MK Required")
                {
                    Caption = 'MK Required';
                    ToolTip = 'MK Required';
                    ApplicationArea = All;
                }

                field("MK Required Type"; Rec."MK Required Type")
                {
                    Caption = 'MK Required Type';
                    ToolTip = 'MK Required Type';
                    ApplicationArea = All;
                }
                field("MK Staged"; Rec."MK Staged Location")
                {
                    Caption = 'MK Staged Location';
                    ToolTip = 'MK Staged Location';
                    ApplicationArea = All;
                }
                field("MK Staged By"; Rec."MK Staged By")
                {
                    Caption = 'MK Staged By';
                    ToolTip = 'MK Staged By';
                    ApplicationArea = All;
                }

                field("MK Staged Date"; Rec."MK Staged Date")
                {
                    Caption = 'MK Staged Date';
                    ToolTip = 'MK Staged Date';
                    ApplicationArea = All;
                }

                field("Marketing Shipment Transfer"; Rec."Marketing Shipment Transfer")
                {
                    Caption = 'Marketing Shipment or Transfer';
                    ToolTip = 'Specifies if the order is a Shipment or a Transfer';
                    ApplicationArea = All;
                }
            }
        }

        modify("Sell-to Customer No.")
        {
            Importance = Standard;
            Visible = true;
        }

        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
            ToolTip = 'Ship-to Code';
            Editable = true;
        }


        modify(Control1900201301)
        {
            Visible = false;
        }

        modify("Sell-to Address")
        {
            Importance = Additional;
        }

        modify("Sell-to Address 2")
        {
            Importance = Additional;
        }

        modify("Sell-to City")
        {
            Importance = Additional;
        }

        modify("Sell-to County")
        {
            Importance = Additional;
        }

        modify("Sell-to Post Code")
        {
            Importance = Additional;
        }

        modify("Sell-to Country/Region Code")
        {
            Importance = Additional;
        }

        modify("Sell-to Phone No.")
        {
            Importance = Additional;
        }

        modify("Order Date")
        {
            Importance = Additional;
        }

        modify("Posting Date")
        {
            Importance = Additional;
        }

        modify("Salesperson Code")
        {
            Importance = Additional;
        }

        modify("Requested Delivery Date")
        {
            Importance = Additional;
        }

        modify("Payment Terms Code")
        {
            Importance = Promoted;
        }

        modify("Due Date")
        {
            Visible = false;
        }

        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Importance = Promoted;
        }
        modify("Currency Code")
        {
            Importance = Additional;
        }
        modify("Gen. Bus. Posting Group")
        {
            Importance = Additional;
            Editable = false;
        }
        modify("Customer Posting Group")
        {
            Importance = Additional;
        }
        modify("Tax Liable")
        {
            Importance = Additional;
        }
        modify("Tax Area Code")
        {
            Importance = Additional;
        }

        modify("Sell-to Contact")
        {
            Visible = false;
        }

        modify("Ship-to Contact")
        {
            Visible = false;
        }

        modify(SellToMobilePhoneNo)
        {
            Visible = false;
        }

        modify("Sell-to E-Mail")
        {
            Visible = false;
        }

        modify("Sell-to Contact No.")
        {
            Visible = false;
        }

        modify("No. of Archived Versions")
        {
            Visible = false;
        }

        modify("Document Date")
        {
            Visible = false;
        }

        modify("Promised Delivery Date")
        {
            Visible = false;
        }

        modify("External Document No.")
        {
            Visible = true;
            Importance = Standard;
        }

        modify("Campaign No.")
        {
            Visible = false;
        }

        modify("Opportunity No.")
        {
            Visible = false;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify("Assigned User ID")
        {
            Visible = false;
        }

        modify("Work Description")
        {
            Visible = false;
        }

        modify("Company Bank Account Code")
        {
            Visible = false;
        }

        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }

        modify(SelectedPayments)
        {
            Visible = false;
        }

        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }

        modify("Payment Discount %")
        {
            Visible = false;
        }

        modify("Direct Debit Mandate ID")
        {
            Visible = false;
        }

        modify("Payment Method Code")
        {
            Visible = false;
        }

        modify("Pmt. Discount Date")
        {
            Visible = false;
        }

        modify("Ship-to Phone No.")
        {
            Visible = false;
        }

        modify("Outbound Whse. Handling Time")
        {
            Visible = false;
        }

        modify("Package Tracking No.")
        {
            Visible = false;
        }

        modify("Shipping Time")
        {
            Visible = false;
        }

        modify("Late Order Shipping")
        {
            Visible = false;
        }

        modify("Combine Shipments")
        {
            Visible = false;
        }

        modify("Completely Shipped")
        {
            Visible = false;
        }

        modify(ShippingOptions)
        {
            Visible = false;
        }

    }

    actions
    {
        addbefore(Category_New)
        {
            group("Credit Hold")
            {
                Visible = true;
                Caption = 'Credit Hold';

                actionref("Remove from Hold"; "Remove Credit Hold")
                {
                }

                actionref("Add to Hold"; "Place Credit Hold")
                {
                }
            }
        }
        addfirst("F&unctions")
        {
            action("Remove Credit Hold")
            {
                ToolTip = 'Removes the Credit hold on an Order.';
                Caption = 'Remove Credit Hold';
                Image = Report;
                ApplicationArea = All;


                trigger OnAction()
                begin

                    Rec."On Hold" := '';
                    Rec.Modify(true);

                    Message('Removed Order from Credit Hold');
                end;
            }

            action("Place Credit Hold")
            {
                ToolTip = 'Places selected Order(s) on Credit Hold.';
                Caption = 'Place Credit Hold';
                Image = Report;
                ApplicationArea = All;


                trigger OnAction()
                begin
                    Rec."On Hold" := 'CR';
                    Rec.Modify(true);

                    Message('Placed Order on Credit Hold');
                end;
            }
        }
    }

    var
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    local procedure ValidateShortcutDimension(DimIndex: Integer)
    var
    begin
        Rec.ValidateShortcutDimCode(DimIndex, ShortcutDimCode[DimIndex]);
    end;
}