pageextension 50051 "TorlysPurchaseOrder" extends "Purchase Order"
{
    layout
    {
        movefirst(General; "Buy-from Vendor No.", "Order Address Code", "Buy-from Vendor Name", "Buy-from")
        moveafter("Buy-from"; "Buy-from Address", "Buy-from Address 2", "Buy-from City", "Buy-from County", "Buy-from Post Code", "Buy-from Country/Region Code", "Location Code", "Posting Date", "Order Date", "Document Date", "Expected Receipt Date")

        addafter("Expected Receipt Date")
        {
            field("Production Date"; Rec."Production Date")
            {
                Caption = 'Production Date';
                ToolTip = 'Production Date';
                ApplicationArea = All;
            }
        }

        moveafter("Production Date"; "Vendor Order No.", "Vendor Shipment No.", "Vendor Invoice No.", "Purchaser Code", "No. of Archived Versions")

        addafter("No. of Archived Versions")
        {
            field("Last Archived Date"; Rec."Last Archived Date")
            {
                Caption = 'Last Archived Date';
                ToolTip = 'Last Archived Date';
                ApplicationArea = All;
                Importance = Additional;
            }

            field(SystemCreatedBy; LookupUserIdWithGuid(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Importance = Additional;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
                Importance = Additional;
            }
        }





        addfirst("Invoice Details")
        {
            field("Pay-to Vendor No."; Rec."Buy-from Vendor No.")
            {
                Caption = 'Pay-to Vendor No.';
                ToolTip = 'Pay-to Vendor No.';
                ApplicationArea = All;
                Importance = Additional;
            }

            field("Name"; Rec."Buy-from Vendor Name")
            {
                Caption = 'Name';
                ToolTip = 'Name';
                ApplicationArea = All;
                Importance = Additional;

            }

            field("Address"; Rec."Buy-from Address")
            {
                Caption = 'Address';
                ToolTip = 'Address';
                ApplicationArea = All;
                Importance = Additional;
            }

            field("Address 2"; Rec."Buy-from Address 2")
            {
                Caption = 'Address 2';
                ToolTip = 'Address 2';
                ApplicationArea = All;
                Importance = Additional;
            }

            field("City"; Rec."Buy-from City")
            {
                Caption = 'City';
                ToolTip = 'City';
                ApplicationArea = All;
                Importance = Additional;
            }

            field("County"; Rec."Buy-from County")
            {
                Caption = 'County';
                ToolTip = 'County';
                ApplicationArea = All;
                Importance = Additional;
            }

            field("Post Code"; Rec."Buy-from Post Code")
            {
                Caption = 'Post Code';
                ToolTip = 'Post Code';
                ApplicationArea = All;
                Importance = Additional;
            }

            field("Country"; Rec."Buy-from Country/Region Code")
            {
                Caption = 'Country';
                ToolTip = 'Country';
                ApplicationArea = All;
                Importance = Additional;
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

        moveafter("Tax Exemption No."; "Ship-to Contact")

        moveafter("Shipping and Payment"; "Foreign Trade")

        modify("Posting Date")
        {
            Importance = Promoted;
        }

        modify("Order Date")
        {
            Importance = Promoted;
        }

        modify("Vendor Order No.")
        {
            Importance = Promoted;
        }

        modify("Shipment Method Code")
        {
            Visible = true;
            Caption = 'Shipment Method Code';
            Importance = Additional;
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
            Visible = true;
        }

        modify("Assigned User ID")
        {
            Visible = false;
        }

        modify("Sell-to Customer No.")
        {
            Importance = Additional;
        }

        modify(ShippingOptionWithLocation)
        {
            Importance = Additional;
        }

        modify("Ship-to Code")
        {
            Importance = Additional;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Importance = Promoted;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Importance = Promoted;
        }

        modify("Payment Terms Code")
        {
            Importance = Additional;
        }

        modify("Payment Discount %")
        {
            Visible = false;
        }

        modify("Pmt. Discount Date")
        {
            Visible = false;
        }

        modify("Ship-to Contact")
        {
            Importance = Additional;
        }

        modify("Currency Code")
        {
            Importance = Additional;
        }

        modify("Requested Receipt Date")
        {
            Importance = Additional;
        }

        modify("Promised Receipt Date")
        {
            Importance = Additional;
        }

        modify("Tax Liable")
        {
            Importance = Promoted;
        }

        modify("Tax Area Code")
        {
            Importance = Promoted;
        }

        modify("TPS CMG Transfer Order No.")
        {
            Visible = false;
        }

        modify(PurchaseOrderLinkedToEdoc)
        {
            Visible = false;
        }
    }

    procedure LookupUserIdWithGuid(var UserGuid: Guid): Code[50]
    var
        UserDetails: Record "User";
    begin
        UserDetails.Get(UserGuid);
        exit(UserDetails."User Name");
    end;
}
