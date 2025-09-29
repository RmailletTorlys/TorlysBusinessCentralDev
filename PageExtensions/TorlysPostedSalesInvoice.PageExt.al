pageextension 50132 TorlysPostedSalesInvoice extends "Posted Sales Invoice"
{
    layout
    {
        movefirst(General; "Sell-to Customer No.")
        moveafter("Sell-to Customer No."; "Ship-to Code", "Sell-to Customer Name", "Sell-to Address", "Sell-to Address 2", "Sell-to City", "Sell-to County", "Sell-to Post Code", "Sell-to Country/Region Code")

        addafter("Sell-to Country/Region Code")
        {
            field("Order Method"; Rec."Order Method")
            {
                Caption = 'Order Method';
                ToolTip = 'Order Method';
                ApplicationArea = All;
            }
        }

        moveafter("Order Method"; "Your Reference", "External Document No.")

        addafter("External Document No.")
        {
            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
            }
            field(ShortcutDimCode3; ShortcutDimCode[3])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,3';
                ToolTip = 'Global Dimension 3 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;
                Editable = false;

                // trigger OnValidate()
                // begin
                //     ValidateShortcutDimension(3);
                // end;
            }
            field("Order Type"; Rec."Order Type")
            {
                Caption = 'Order Type';
                ToolTip = 'Order Type';
                ApplicationArea = All;
            }
            field("Temporary Hold"; Rec."Temporary Hold")
            {
                Caption = 'Temporary Hold';
                ToolTip = 'Temporary Hold';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("Temporary Hold"; "Posting Date")

        addafter("Posting Date")
        {
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("Order Time"; Rec."Order Time")
            {
                Caption = 'Order Time';
                ToolTip = 'Order Time';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("Order Time"; "Shipment Date")

        addafter("Shipment Date")
        {
            field("Shipping Instructions"; Rec."Shipping Instructions")
            {
                Caption = 'Shipping Instructions';
                ToolTip = 'Shipping Instructions';
                ApplicationArea = All;
                Importance = Standard;
            }
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
                ApplicationArea = All;
                Importance = Standard;
            }
        }
        addafter("Shipping Comment")
        {
            field(SystemCreatedBy; LookupUserIdWithGuid(Rec.SystemCreatedBy))
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

            field(SystemModifiedBy; LookupUserIdWithGuid(Rec.SystemModifiedBy))
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

        moveafter(SystemModifiedAt; "No. Printed", "Order No.")

        addafter("Currency Code")
        {
            field("Currency Factor"; Rec."Currency Factor")
            {
                Caption = 'Currency Factor';
                ToolTip = 'Currency Factor';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("Currency Factor"; "Customer Posting Group", "Payment Method Code", "Payment Terms Code", "Due Date", "Pmt. Discount Date", "Payment Discount %", "Promised Pay Date", "Dispute Status", "Closed", "Cancelled", "Corrective", "Tax Liable", "Tax Area Code")

        addafter("Tax Area Code")
        {
            field("Tax Exemption No."; Rec."Tax Exemption No.")
            {
                Caption = 'Tax Exemption No.';
                ToolTip = 'Tax Exemption No.';
                ApplicationArea = All;
                Importance = Additional;
            }
        }

        moveafter("Tax Exemption No."; "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Salesperson Code")

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

        addafter("Shipping Agent Code")
        {
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                Caption = 'Freight Zone Code';
                ToolTip = 'Freight Zone Code';
                ApplicationArea = All;
                Importance = Standard;
                TableRelation = "Torlys Freight Zones";
            }
        }

        moveafter("Freight Zone Code"; "Location Code")

        addafter("Location Code")
        {
            group("Pick Slip Info")
            {
                Caption = 'Pick Slip Info';
                field("No. Pick Slips Printed"; Rec."No. Pick Slips Printed")
                {
                    Caption = 'No. Pick Slips Printed';
                    ToolTip = 'No. Pick Slips Printed';
                    ApplicationArea = All;
                    Importance = Standard;
                    Editable = false;
                }
                field("Pick Slip Printed By"; Rec."Pick Slip Printed By")
                {
                    Caption = 'Pick Slip Printed By';
                    ToolTip = 'Pick Slip Printed By';
                    ApplicationArea = All;
                    Importance = Standard;
                    Editable = false;
                }

                field("Pick Slip Printed Date"; Rec."Pick Slip Printed Date")
                {
                    Caption = 'Pick Slip Printed Date';
                    ToolTip = 'Pick Slip Printed Date';
                    ApplicationArea = All;
                    Importance = Standard;
                    Editable = false;
                }

                field("Pick Slip Printed Time"; Rec."Pick Slip Printed Time")
                {
                    Caption = 'Pick Slip Printed Time';
                    ToolTip = 'Pick Slip Printed Time';
                    ApplicationArea = All;
                    Importance = Standard;
                    Editable = false;
                }
            }
        }

        addbefore("Ship-to Name")
        {
            field("Ship-to Code1"; Rec."Ship-to Code")
            {
                Caption = 'Ship-to Customer No.';
                ToolTip = 'Ship-to Customer No.';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }
        }

        modify("No. Printed")
        {
            Importance = Standard;
        }

        modify("No.")
        {
            visible = false;
        }

        modify("Sell-to")
        {
            visible = false;
        }

        modify("Sell-to Customer No.")
        {
            visible = true;
        }

        modify("Sell-to Contact No.")
        {
            visible = false;
        }

        modify(SellToPhoneNo)
        {
            visible = false;
        }

        modify(SellToMobilePhoneNo)
        {
            visible = false;
        }

        modify(SellToEmail)
        {
            visible = false;
        }

        modify("Sell-to Contact")
        {
            visible = false;
        }

        modify("Document Date")
        {
            visible = false;
        }

        modify("Quote No.")
        {
            visible = false;
        }

        modify("Pre-Assigned No.")
        {
            visible = false;
        }

        modify("Responsibility Center")
        {
            visible = false;
        }

        modify("Work Description")
        {
            visible = false;
        }

        modify("Company Bank Account Code")
        {
            visible = false;
        }

        modify(SelectedPayments)
        {
            visible = false;
        }

        modify("Direct Debit Mandate ID")
        {
            visible = false;
        }

        modify(Corrective)
        {
            Importance = Standard;
        }

        modify("Shipment Method Code")
        {
            Importance = Standard;
            Caption = 'Shipment Method Code';
        }

        modify("Shipping Agent Code")
        {
            Importance = Standard;
            Caption = 'Shipping Agent Code';
        }

        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }

        modify("Package Tracking No.")
        {
            Visible = false;
        }

        modify("Location Code")
        {
            Importance = Standard;
        }
    }

    procedure LookupUserIdWithGuid(var UserGuid: Guid): Code[50]
    var
        UserDetails: Record "User";
    begin
        UserDetails.Get(UserGuid);
        exit(UserDetails."User Name");
    end;

    var
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    // local procedure ValidateShortcutDimension(DimIndex: Integer)
    // var
    // begin
    //     Rec.ValidateShortcutDimCode(DimIndex, ShortcutDimCode[DimIndex]);
    // end;
}