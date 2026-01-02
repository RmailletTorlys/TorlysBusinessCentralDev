pageextension 50507 TorlysBlanketSalesOrder extends "Blanket Sales Order"
{
    layout
    {
        movefirst(General; "Sell-to Customer No.", "Ship-to Code", "Sell-to Customer Name", "Your Reference", "External Document No.")

        addafter("External Document No.")
        {
            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
            }
        }

        moveafter("Tag Name"; "Location Code")

        addafter("Location Code")
        {
            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created Date';
                ToolTip = 'Created Date';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified Date';
                ToolTip = 'Modified Date';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
        }

        modify("Sell-to Customer No.")
        {
            Importance = Standard;
            Visible = true;
        }

        modify("Sell-to")
        {
            Visible = false;
        }

        modify("Shipment Method Code")
        {
            Importance = Standard;
            Caption = 'Shipment Method Code';
            Visible = false;
        }

        modify("Shipping Agent Code")
        {
            Importance = Standard;
            Caption = 'Shipping Agent Code';
        }

        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
            ToolTip = 'Ship-to Code';
            Editable = true;
        }

        modify("BillToOptions")
        {
            Visible = true;
        }

        modify("Sell-to Address")
        {
            Visible = false;
        }

        modify("Sell-to Address 2")
        {
            Visible = false;
        }

        modify("Sell-to City")
        {
            Visible = false;
        }

        modify("Sell-to County")
        {
            Visible = false;
        }

        modify("Sell-to Post Code")
        {
            Visible = false;
        }

        modify("Sell-to Country/Region Code")
        {
            Visible = false;
        }

        modify("Order Date")
        {
            Visible = false;
        }

        modify("Payment Terms Code")
        {
            Importance = Promoted;
        }

        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Importance = Promoted;
            ShowMandatory = true;
        }

        modify("Currency Code")
        {
            Importance = Additional;
        }

        modify("Tax Liable")
        {
            Importance = Standard;
        }

        modify("Tax Area Code")
        {
            Importance = Standard;
            ShowMandatory = true;
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

        modify(BillToContactEmail)
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

        modify("Campaign No.")
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

        modify("Company Bank Account Code")
        {
            Visible = false;
        }

        modify("VAT Bus. Posting Group")
        {
            Visible = false;
        }

        modify("Ship-to Phone No.")
        {
            Visible = false;
        }

        modify("Package Tracking No.")
        {
            Visible = false;
        }

        modify("Bill-to Name")
        {
            Editable = false;
        }

        modify("Bill-to Address")
        {
            Editable = false;
        }

        modify("Bill-to Address 2")
        {
            Editable = false;
        }

        modify("Bill-to City")
        {
            Editable = false;
        }

        modify("Bill-to County")
        {
            Editable = false;
        }

        modify("Bill-to Post Code")
        {
            Editable = false;
        }

        modify("Bill-to Country/Region Code")
        {
            Editable = false;
        }

        modify("Bill-to Contact No.")
        {
            visible = false;
        }

        modify("Bill-to Contact")
        {
            visible = false;
        }

        modify(BillToContactPhoneNo)
        {
            visible = false;
        }

        modify(BillToContactMobilePhoneNo)
        {
            visible = false;
        }

        modify("No.")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 2 Code")
        {
            Editable = false;
            Importance = Additional;
            ShowMandatory = true;
        }

        modify("Payment Discount %")
        {
            Importance = Additional;
        }

        modify("Ship-to Country/Region Code")
        {
            Importance = Standard;
        }

        modify("External Document No.")
        {
            Importance = Standard;
        }

        modify("Due Date")
        {
            Visible = false;
        }

        modify(Status)
        {
            Visible = false;
        }

        modify("Salesperson Code")
        {
            Visible = false;
        }

        modify("Invoice Details")
        {
            Visible = false;
        }

        modify("Shipping and Billing")
        {
            Visible = false;
        }

        modify("Your Reference")
        {
            Importance = Standard;
            Caption = 'Ordered By';
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}