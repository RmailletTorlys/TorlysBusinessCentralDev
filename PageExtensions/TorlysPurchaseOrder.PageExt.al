pageextension 50051 "TorlysPurchaseOrder" extends "Purchase Order"
{
    layout
    {
        movefirst(General; "Buy-from Vendor No.", "Buy-from Vendor Name", "Buy-from")
        moveafter("Buy-from"; "Posting Date", "Order Date", "Document Date", "Vendor Order No.", "Vendor Invoice No.")

        addafter("Vendor Invoice No.")
        {
            field("Manufacturer Code"; Rec."Manufacturer Code")
            {
                Caption = 'Manufacturer Code';
                ToolTip = 'Manufacturer Code';
                ApplicationArea = All;
            }

            field("Production Date"; Rec."Production Date")
            {
                Caption = 'Production Date';
                ToolTip = 'Production Date';
                ApplicationArea = All;
            }

            field("No. Printed"; Rec."No. Printed")
            {
                Caption = 'No. Printed';
                ToolTip = 'No. Printed';
                ApplicationArea = All;
            }
        }

        moveafter("No. Printed"; "Purchaser Code")

        addafter("Purchaser Code")
        {
            field("Last Archived Date"; Rec."Last Archived Date")
            {
                Caption = 'Last Archived Date';
                ToolTip = 'Last Archived Date';
                ApplicationArea = All;
            }
        }

        moveafter("Last Archived Date"; "No. of Archived Versions")

        addafter("No. of Archived Versions")
        {
            field("Amount"; Rec.Amount)
            {
                Caption = 'Amount';
                ToolTip = 'Amount';
                ApplicationArea = All;
            }

            field("Inv. Discount Amount"; Rec."Invoice Discount Amount")
            {
                Caption = 'Invoice Discount Amount';
                ToolTip = 'Invoice Discount Amount';
                ApplicationArea = All;

            }

            field("Total"; Rec.Amount + Rec."Invoice Discount Amount")
            {
                Caption = 'Total';
                ToolTip = 'Total';
                ApplicationArea = All;

            }

            field("Tax Amount"; Rec."Amount Including VAT" - Rec.Amount)
            {
                Caption = 'Tax Amount';
                ToolTip = 'Tax Amount';
                ApplicationArea = All;
            }

            field("Total Incl. Tax"; Rec."Amount Including VAT")
            {
                Caption = 'Total Incl. Tax';
                ToolTip = 'Total Incl. Tax';
                ApplicationArea = All;
            }



        }

        addafter("Total Incl. Tax")
        {
            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
            }
        }


        addfirst("Invoice Details")
        {
            field("Pay-to Vendor No."; Rec."Buy-from Vendor No.")
            {
                Caption = 'Pay-to Vendor No.';
                ToolTip = 'Pay-to Vendor No.';
                ApplicationArea = All;
            }

            field("Name"; Rec."Buy-from Vendor Name")
            {
                Caption = 'Name';
                ToolTip = 'Name';
                ApplicationArea = All;

            }

            field("Address"; Rec."Buy-from Address")
            {
                Caption = 'Address';
                ToolTip = 'Address';
                ApplicationArea = All;
            }

            field("Address 2"; Rec."Buy-from Address 2")
            {
                Caption = 'Address 2';
                ToolTip = 'Address 2';
                ApplicationArea = All;
            }

            field("City"; Rec."Buy-from City")
            {
                Caption = 'City';
                ToolTip = 'City';
                ApplicationArea = All;
            }

            field("County"; Rec."Buy-from County")
            {
                Caption = 'County';
                ToolTip = 'County';
                ApplicationArea = All;
            }

            field("Post Code"; Rec."Buy-from Post Code")
            {
                Caption = 'Post Code';
                ToolTip = 'Post Code';
                ApplicationArea = All;
            }

            field("Country"; Rec."Buy-from Country/Region Code")
            {
                Caption = 'Country';
                ToolTip = 'Country';
                ApplicationArea = All;
            }
        }
        addfirst("Shipping and Payment")
        {
            group("Ship-to")
            {
                Caption = 'Ship-to';
            }
        }

        movefirst("Ship-to"; ShippingOptionWithLocation, "Ship-to Code", "Ship-to Name", "Ship-to Address", "Ship-to Address 2", "Ship-to City", "Ship-to County", "Ship-to Post Code", "Ship-to Country/Region Code")

        moveafter("Ship-to"; "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Payment Terms Code", "Due Date", "Payment Discount %", "Pmt. Discount Date", "Tax Liable", "Tax Area Code", "Tax Exemption No.")

        movebefore("Ship-to Code"; "Sell-to Customer No.")

        moveafter("Tax Exemption No."; "Location Code", "Shipment Method Code", "Requested Receipt Date", "Promised Receipt Date", "Expected Receipt Date")

        moveafter("Shipping and Payment"; "Foreign Trade")

        modify("Shipment Method Code")
        {
            Visible = true;
            Caption = 'Incoterms';
        }

        modify("Buy-from Vendor No.")
        {
            Importance = Standard;
            Visible = true;
            Caption = 'Vendor No.';
        }

        modify("Buy-from Contact No.")
        {
            Visible = false;
        }

        modify(BuyFromContactPhoneNo)
        {
            Visible = false;
        }

        modify(BuyFromContactMobilePhoneNo)
        {
            Visible = false;
        }

        modify(BuyFromContactEmail)
        {
            Visible = false;
        }

        modify("Buy-from Contact")
        {
            Visible = false;
        }

        modify("Quote No.")
        {
            Visible = false;
        }

        modify("Order Address Code")
        {
            Visible = false;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify(Status)
        {
            Visible = false;
        }

        modify("Ship-to Phone No.")
        {
            Visible = false;
        }

        modify("Foreign Trade")
        {
            Visible = true;
        }

        modify(Prepayment)
        {
            Visible = false;
        }

        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }

        modify("Provincial Tax Area Code")
        {
            Visible = false;
        }



        modify("Payment Reference")
        {
            Visible = false;
        }

        modify("Creditor No.")
        {
            Visible = false;
        }

        modify("On Hold")
        {
            Visible = false;
        }

        modify(PayToOptions)
        {
            Visible = false;
        }

        modify("Remit-to Code")
        {
            Visible = false;
        }

        modify("Vendor Posting Group")
        {
            Visible = false;
        }

        modify("Payment Method Code")
        {
            Visible = false;
        }

        modify("Inbound Whse. Handling Time")
        {
            Visible = false;
        }

        modify("Lead Time Calculation")
        {
            Visible = false;
        }

        modify("Invoice Received Date")
        {
            Visible = false;
        }

        modify("Your Reference")
        {
            Visible = false;
        }

        modify("Vendor Shipment No.")
        {
            Visible = false;
        }

        modify("Assigned User ID")
        {
            Visible = false;
        }
    }
}
