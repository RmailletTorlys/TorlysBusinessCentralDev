pageextension 50050 "TorlysPurchOrder" extends "Purchase Order"
{
    layout
    {
        movefirst(General; "Buy-from Vendor No.", "Order Address Code", "Buy-from Vendor Name", "Buy-from")

        moveafter("Buy-from"; "Buy-from Address", "Buy-from Address 2", "Buy-from City", "Buy-from County", "Buy-from Post Code", "Buy-from Country/Region Code", "Location Code", "Shipment Method Code", "Posting Date", "Order Date", "Document Date", "Vendor Order No.", "Vendor Shipment No.", "Vendor Invoice No.", Status)

        addafter(Status)
        {
            field("No. Printed"; Rec."No. Printed")
            {
                Caption = 'Quantity Printed';
                ToolTip = 'Quantity Printed';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("No. Printed"; "No. of Archived Versions")

        addafter("No. of Archived Versions")
        {
            field("Last Archived Date"; Rec."Last Archived Date")
            {
                Caption = 'Last Archived Date';
                ToolTip = 'Last Archived Date';
                ApplicationArea = All;
                Importance = Additional;
                Editable = false;
            }

            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
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

            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Importance = Additional;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        addafter("Currency Code")
        {
            field("Currency Factor"; Rec."Currency Factor")
            {
                Caption = 'Currency Factor';
                ToolTip = 'Currency Factor';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        moveafter("Currency Factor"; "Vendor Posting Group", "Payment Method Code", "Payment Terms Code", "Due Date", "Pmt. Discount Date", "Payment Discount %", "Tax Liable", "Tax Area Code", "Tax Exemption No.", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code")

        movefirst("Shipping and Payment"; "Lead Time Calculation", "Requested Receipt Date", "Promised Receipt Date")

        addafter(ShippingOptionWithLocation)
        {
            field("Location Code1"; Rec."Location Code")
            {
                Caption = 'Location Code';
                ToolTip = 'Location Code';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        modify(ShippingOptionWithLocation)
        {
            importance = Standard;
        }

        modify("Posting Date")
        {
            Importance = Promoted;
            Editable = false;
        }

        modify("Order Date")
        {
            Importance = Promoted;
        }

        modify("Vendor Order No.")
        {
            Importance = Promoted;
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
            Visible = true;
            Importance = Additional;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify(Status)
        {
            Visible = true;
            Importance = Standard;
        }

        modify("Ship-to Phone No.")
        {
            Visible = false;
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

        modify("Remit-to Code")
        {
            Visible = false;
        }

        modify("Vendor Posting Group")
        {
            Visible = true;
            Importance = Standard;
        }

        modify("Inbound Whse. Handling Time")
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
            Visible = true;
            Importance = Standard;
        }

        modify("Payment Discount %")
        {
            Visible = true;
        }

        modify("Currency Code")
        {
            Importance = Standard;
        }

        modify("Tax Liable")
        {
            Importance = Promoted;
        }

        modify("Lead Time Calculation")
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

        modify("Location Code")
        {
            Editable = true;
        }

        modify("Purchaser Code")
        {
            Visible = false;
        }

        modify("No.")
        {
            Visible = false;
        }

        modify("Pmt. Discount Date")
        {
            Importance = Standard;
        }

        modify("Due Date")
        {
            Importance = Standard;
        }

        modify("Payment Method Code")
        {
            Importance = Standard;
        }

        modify("Expected Receipt Date")
        {
            Visible = false;
        }

    }
    actions
    {
        addlast(Category_Category8)
        {
            actionref(LinkededSO; "View and Fill Linked SO")
            {
            }
        }

        addlast(Documents)
        {
            action("View and Fill Linked SO")
            {
                ApplicationArea = Location;
                Caption = 'View and Fill Linked SO';
                ToolTip = 'View and Fill Linked SO';
                Image = OrderTracking;
                RunObject = Page TorlysLinkedSOtoPO;
                RunPageLink = "Linked Purchase Order No." = field("No."), Type = const(Item);
            }
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}
