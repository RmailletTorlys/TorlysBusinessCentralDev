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

            field("Roll out Order"; Rec."Roll out Order")
            {
                Caption = 'Roll-out Order';
                ToolTip = 'Roll-out Order';
                ApplicationArea = All;
                Importance = Additional;
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

        moveafter("Tag Name"; "Shipment Date", "Requested Delivery Date", Status, "Your Reference", "Salesperson Code")

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


        movefirst("Invoice Details"; BillToOptions)

        addafter(BillToOptions)
        {
            field("Total Excl. Tax"; Rec."Total Excl. Tax")
            {
                Caption = 'Total Excl. Tax';
                ToolTip = 'Total Excl. Tax';
                ApplicationArea = All;
                Importance = Additional;
            }

            field("Total Tax"; Rec."Total Tax")
            {
                Caption = 'Total Tax';
                ToolTip = 'Total Tax';
                ApplicationArea = All;
                Importance = Additional;
            }

            field("Total Incl. Tax"; Rec."Total Incl. Tax")
            {
                Caption = 'Total Incl. Tax';
                ToolTip = 'Total Incl. Tax';
                ApplicationArea = All;
                Importance = Promoted;
            }

            field("Region Code"; Rec."Region Code")
            {
                Caption = 'Region Code';
                ToolTip = 'Region Code';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("Region Code"; "Currency Code", "Gen. Bus. Posting Group", "Customer Posting Group", "Payment Terms Code", "Due Date", "Tax Liable", "Tax Area Code")

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

        modify("Sell-to Customer No.")
        {
            Importance = Standard;
            Visible = true;
        }

        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
            ToolTip = 'Ship-to Code';
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
            Importance = Promoted;
        }

        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
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
            Visible = false;
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