pageextension 50130 TorlysPostedSalesShipment extends "Posted Sales Shipment"
{
    layout
    {
        movefirst(General; "Sell-to Customer No.")

        moveafter("Sell-to Customer No."; "Ship-to Code")

        addafter("Sell-to")
        {
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
            }

            field("Temporary Hold"; Rec."Temporary Hold")
            {
                Caption = 'Temporary Hold';
                ToolTip = 'Temporary Hold';
                ApplicationArea = All;
            }

            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
            }
        }

        moveafter("Order Date"; "Posting Date")

        moveafter("Tag Name"; "Shipment Date", "Requested Delivery Date")

        addafter("Requested Delivery Date")
        {
            field("Your Reference"; Rec."Your Reference")
            {
                Caption = 'Your Reference';
                ToolTip = 'Your Reference';
                ApplicationArea = All;
            }
        }

        moveafter("Your Reference"; "Salesperson Code")

        addafter("Salesperson Code")
        {

            field("Salesperson Commission"; Rec."Salesperson Commission")
            {
                Caption = 'Salesperson Commission';
                ToolTip = 'Salesperson Commission';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }

            field("Salesperson Code 2"; Rec."Salesperson Code 2")
            {
                Caption = 'Salesperson Code 2';
                ToolTip = 'Salesperson Code 2';
                ApplicationArea = All;
            }

            field("Salesperson Commission 2"; Rec."Salesperson Commission 2")
            {
                Caption = 'Salesperson Commission 2';
                ToolTip = 'Salesperson Commission 2';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }

            field("Salesperson Code 3"; Rec."Salesperson Code 3")
            {
                Caption = 'Salesperson Code 3';
                ToolTip = 'Salesperson Code 3';
                ApplicationArea = All;
            }

            field("Salesperson Commission 3"; Rec."Salesperson Commission 3")
            {
                Caption = 'Salesperson Commission 3';
                ToolTip = 'Salesperson Commission 3';
                ApplicationArea = All;
                DecimalPlaces = 2;
            }
        }

        moveafter("Salesperson Commission 3"; "Shortcut Dimension 2 Code")

        addafter("Shortcut Dimension 2 Code")
        {

            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'SystemCreatedBy';
                ToolTip = 'SystemCreatedBy';
                ApplicationArea = All;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'SystemCreatedAtd';
                ToolTip = 'SystemCreatedAtd';
                ApplicationArea = All;
            }

            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
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

        addafter(SalesShipmLines)
        {
            group("Invoice Details")
            {
                Caption = 'Invoice Details';
                field("Bill-to"; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                    ToolTip = 'Bill-to Customer No.';
                    ApplicationArea = All;
                }

                field("Total Excl. Tax"; Rec."Total Excl. Tax")
                {
                    Caption = 'Total Excl. Tax';
                    ToolTip = 'Total Excl. Tax';
                    ApplicationArea = All;
                    DecimalPlaces = 2;
                }

                field("Total Tax"; Rec."Total Tax")
                {
                    Caption = 'Total Tax';
                    ToolTip = 'Total Tax';
                    ApplicationArea = All;
                    DecimalPlaces = 2;
                }

                field("Total Incl. Tax"; Rec."Total Incl. Tax")
                {
                    Caption = 'Total Incl. Tax';
                    ToolTip = 'Total Incl. Tax';
                    ApplicationArea = All;
                    DecimalPlaces = 2;
                }

                field("Region Code"; Rec."Region Code")
                {
                    Caption = 'Region Code';
                    ToolTip = 'Region Code';
                    ApplicationArea = All;
                }

                field("Currency Code"; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ToolTip = 'Currency Code';
                    ApplicationArea = All;
                }

                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                    ToolTip = 'Gen. Bus. Posting Group';
                    ApplicationArea = All;
                }

                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                    ToolTip = 'Customer Posting Group';
                    ApplicationArea = All;
                }

                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';
                    ToolTip = 'Payment Terms Code';
                    ApplicationArea = All;
                }

                field("Due Date"; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ToolTip = 'Due Date';
                    ApplicationArea = All;
                }

                field("Tax Liable"; Rec."Tax Liable")
                {
                    Caption = 'Tax Liable';
                    ToolTip = 'Tax Liable';
                    ApplicationArea = All;
                }

                field("Tax Area Code"; Rec."Tax Area Code")
                {
                    Caption = 'Tax Area Code';
                    ToolTip = 'Tax Area Code';
                    ApplicationArea = All;
                }


            }
        }

        addafter("Invoice Details")
        {
            group("Shipping and Billing")
            {
                Caption = 'Shipping and Billing';

            }
        }

        movefirst("Shipping and Billing"; "Shipment Method")

        addafter("Shipping Agent Code")
        {
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                Caption = 'Freight Zone Code';
                ToolTip = 'Freight Zone Code';
                ApplicationArea = All;
            }
        }

        moveafter("Freight Zone Code"; "Location Code")

        addafter("Location Code")
        {
            field("BoL No."; Rec."BoL No.")
            {
                Caption = 'BoL No.';
                ToolTip = 'BoL No.';
                ApplicationArea = All;
            }
        }

        addafter("Shipping and Billing")
        {
            group("Marketing")
            {
                Caption = 'Marketing';

                field("Sample Allowance Exclusion"; Rec."Sample Allowance Exclusion")
                {
                    Caption = 'Sample Allowance Exclusion';
                    ToolTip = 'Sample Allowance Exclusion';
                    ApplicationArea = All;
                }

                field("MK Required"; Rec."MKRequired")
                {
                    Caption = 'MK Required';
                    ToolTip = 'MK Required';
                    ApplicationArea = All;
                }

                field("Marketing Order Type"; Rec."Marketing Order Type")
                {
                    Caption = 'MK Required By';
                    ToolTip = 'MK Required By';
                    ApplicationArea = All;
                }
                field("MK Staged"; Rec."MKStaged_Location")
                {
                    Caption = 'MK Staged';
                    ToolTip = 'MK Staged';
                    ApplicationArea = All;
                }
                field("MK Staged By"; Rec."MKStaged_By")
                {
                    Caption = 'MK Staged By';
                    ToolTip = 'MK Staged By';
                    ApplicationArea = All;
                }

                field("MK Staged Date"; Rec."MKStaged_Date")
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

        modify("No.")
        {
            Visible = false;
        }

        modify("Sell-to Customer No.")
        {
            Visible = true;
            Caption = 'Customer No.';
        }

        modify(SellToMobilePhoneNo)
        {
            Visible = false;
        }

        modify(SellToEmail)
        {
            Visible = false;
        }

        modify("Sell-to Contact")
        {
            Visible = false;
        }

        modify(Shipping)
        {
            Visible = false;
        }

        modify(Billing)
        {
            Visible = false;
        }

        modify("No. Printed")
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

        modify("Quote No.")
        {
            Visible = false;
        }

        modify("Order No.")
        {
            Visible = false;
        }

        modify("External Document No.")
        {
            Visible = false;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify(GetWorkDescription)
        {
            Visible = false;
        }

    }

    var
        LookupUserId: Codeunit "LookupUserID";
}