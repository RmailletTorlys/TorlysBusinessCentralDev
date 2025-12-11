pageextension 50042 TorlysSalesOrder extends "Sales Order"
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
                trigger OnValidate()
                begin
                    if (Rec."Order Method" = '') and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot delete if order released');
                end;
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
                trigger OnValidate()
                begin
                    if (Rec."Tag Name" = '') and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot delete if order released');
                end;
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
                trigger OnValidate()
                begin
                    if (MPOCount <> 0) and (ShortcutDimCode[3] = 'BUILDER') then
                        Message('There are %1 MPOs tied to this customer.', MPOCount);
                    if (MPOCount <> 0) and (ShortcutDimCode[3] = 'RENTAL') then
                        Message('There are %1 MPOs tied to this customer.', MPOCount);
                    if (ShortcutDimCode[3] = '') and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot delete if order released')
                    else
                        ValidateShortcutDimension(3);
                end;
            }
            // field("MPO Count"; MPOCount)
            // {
            //     Caption = 'MPO Count';
            //     ToolTip = 'MPO Count';
            //     ApplicationArea = All;
            //     Editable = false;
            //     Visible = (ShortcutDimCode[3] = 'BUILDER');
            // }
            field("Order Type"; Rec."Order Type")
            {
                Caption = 'Order Type';
                ToolTip = 'Order Type';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    if (Rec."Order Type" = '') and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot delete if order released');
                end;
            }
            field("Temporary Hold"; Rec."Temporary Hold")
            {
                Caption = 'Temporary Hold';
                ToolTip = 'Temporary Hold';
                ApplicationArea = All;
                Importance = Additional;
                trigger OnValidate()
                begin
                    if (Rec."Temporary Hold") and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot change if order released');
                end;
            }
        }

        moveafter("Temporary Hold"; "Posting Date", "Order Date")

        addafter("Order Date")
        {
            field("Order Time"; Rec."Order Time")
            {
                Caption = 'Order Time';
                ToolTip = 'Order Time';
                ApplicationArea = All;
                Importance = Additional;
                Editable = false;
            }
        }

        moveafter("Order Time"; "Location Code", "Shipment Date")

        addafter("Shipment Date")
        {
            field("Shipping Instructions"; Rec."Shipping Instructions")
            {
                Caption = 'Shipping Instructions';
                ToolTip = 'Shipping Instructions';
                ApplicationArea = All;
                Importance = Standard;
                trigger OnValidate()
                begin
                    if (Rec."Shipping Instructions" = '') and (Rec.Status = Rec.Status::Released) then
                        Error('Cannot delete if order released');
                end;
            }
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
                ApplicationArea = All;
                Importance = Standard;
            }
        }
        moveafter("Shipping Comment"; Status)

        addafter(Status)
        {
            field("No. Printed"; Rec."No. Printed")
            {
                Caption = 'Quantity Printed';
                ToolTip = 'Quantity Printed';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
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

        addfirst("Invoice Details")
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

        moveafter("On Hold"; "Currency Code")

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

        moveafter("Currency Factor"; "Customer Posting Group", "Payment Method Code", "Payment Terms Code", "Due Date", "Pmt. Discount Date", "Payment Discount %", "Tax Liable", "Tax Area Code")

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

        addafter(ShippingOptions)
        {
            field("Ship-to Code1"; Rec."Ship-to Code")
            {
                Caption = 'Ship-to Code';
                ToolTip = 'Ship-to Code';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
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

        moveafter("Freight Zone Code"; "Shipping Advice")

        addafter(BillToOptions)
        {
            field("Bill-to Customer No."; Rec."Bill-to Customer No.")
            {
                Caption = 'Bill-to Customer No.';
                ToolTip = 'Bill-to Customer No.';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        addafter(Control82)
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

        addafter("Shipping and Billing")
        {
            group("Marketing")
            {
                Caption = 'Marketing';
                grid(Section1)
                {
                    group(Details)
                    {
                        field(ShortcutDimCode5; ShortcutDimCode[5])
                        {
                            ApplicationArea = Dimensions;
                            CaptionClass = '1,2,5';
                            ToolTip = 'Global Dimension 5 Code';
                            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                            Visible = true;
                            trigger OnValidate()
                            begin
                                ValidateShortcutDimension(5);
                            end;
                        }
                        field("Club"; Rec."Club")
                        {
                            Caption = 'Club';
                            ToolTip = 'Club';
                            ApplicationArea = All;
                            Importance = Standard;
                        }
                        field("Power Up Level"; Rec."Power Up Level")
                        {
                            Caption = 'Power Up Level';
                            ToolTip = 'Power Up Level';
                            ApplicationArea = All;
                            Importance = Standard;
                        }
                        field("Sample Allowance Exclusion"; Rec."Sample Allowance Exclusion")
                        {
                            Caption = 'Sample Allowance Exclusion';
                            ToolTip = 'Sample Allowance Exclusion';
                            ApplicationArea = All;
                            Importance = Standard;
                        }
                    }
                }
                grid(ManufacturingGrid)
                {
                    group(Manufacturing)
                    {
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
                        field("MK Staged Location"; Rec."MK Staged Location")
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
            }
        }

        modify("Sell-to Customer No.")
        {
            Importance = Standard;
            Visible = true;
        }

        modify("Your Reference")
        {
            Importance = Standard;
        }

        modify("Sell-to")
        {
            Visible = false;
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
            Importance = Standard;
        }

        modify("Requested Delivery Date")
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
        }
        modify("Currency Code")
        {
            Importance = Additional;
        }
        modify("Gen. Bus. Posting Group")
        {
            visible = false;
        }
        modify("Customer Posting Group")
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

        modify("Promised Delivery Date")
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

        modify("Direct Debit Mandate ID")
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
            editable = false;
            Importance = Additional;
        }

        modify("Payment Discount %")
        {
            Importance = Additional;
        }

        modify("Ship-to Country/Region Code")
        {
            Importance = Standard;
        }

        modify("Shipping Advice")
        {
            Importance = Standard;
        }

        modify("External Document No.")
        {
            Importance = Standard;
        }
    }

    actions
    {
        addlast(Action96)
        {
            action("B13 Sales")
            {
                Caption = 'Print B13 Sales';
                Image = Print;
                ApplicationArea = Basic, Suite;
                trigger OnAction()
                var
                    salesline: Record "Sales Line";
                begin
                    salesline.SetFilter("Document No.", Rec."No.");
                    REPORT.RUNMODAL(50023, TRUE, FALSE, SalesLine);
                end;
            }
            action("B13 Purchase")
            {
                Caption = 'Print B13 Purchase';
                Image = Print;
                ApplicationArea = Basic, Suite;
                trigger OnAction()
                var
                    salesline: Record "Sales Line";
                begin
                    salesline.SetFilter("Document No.", Rec."No.");
                    REPORT.RUNMODAL(50020, TRUE, FALSE, SalesLine);
                end;
            }
        }
        addlast(Category_Category11)
        {
            actionref(B13_Sales; "B13 Sales")
            {
            }
            actionref(B13_Purchase; "B13 Purchase")
            {
            }
        }
        addbefore(Category_New)
        {
            group("Credit Hold")
            {
                Visible = true;
                Caption = 'Credit Hold';

                actionref("RemoveCreditHold"; "Remove Credit Hold")
                {
                }

                actionref("PlaceOnCreditHold"; "Place On Credit Hold")
                {
                }
            }
        }

        addafter("Credit Hold")
        {
            actionref("AddFreight"; "Add Freight")
            {
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
                    TorlysCreditHold.RemoveCreditHold(Rec, xRec);
                end;
            }
            action("Place On Credit Hold")
            {
                ToolTip = 'Places selected Order(s) on Credit Hold.';
                Caption = 'Place On Credit Hold';
                Image = Report;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    TorlysCreditHold.PlaceOnCreditHold(Rec, xRec);
                end;
            }
            action("Add Freight")
            {
                ToolTip = 'Add Freight';
                Caption = 'Add Freight';
                Image = PickLines;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    InsertFreightLine.SOscreens(Rec);
                end;
            }
        }
    }

    var
        ShortcutDimCode: array[8] of Code[20];
        MPOCount: Integer;
        MPOSalesHeader: Record "Sales Header";
        MPOVisible: Boolean;
        LookupUserId: Codeunit "TorlysLookupUserID";
        InsertFreightLine: Codeunit "TorlysInsertFreightLine";
        TorlysCreditHold: Codeunit TorlysCreditHold;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);

        MPOCount := 0;
        MPOSalesHeader.Reset();
        MPOSalesHeader.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
        MPOSalesHeader.SetRange("Order Type", 'MASTER PROJECT ORDER');
        MPOCount := MPOSalesHeader.Count;
    end;

    local procedure ValidateShortcutDimension(DimIndex: Integer)
    var
    begin
        Rec.ValidateShortcutDimCode(DimIndex, ShortcutDimCode[DimIndex]);
    end;
}