pageextension 50042 TorlysSalesOrder extends "Sales Order"
{
    layout
    {
        moveafter("Sell-to Customer No."; "Ship-to Code", "Sell-to Customer Name")
        moveafter("Ship-to Name"; "Sell-to", "Order Date", "Posting Date")

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

        moveafter("Tag Name"; "Shipment Date", "Requested Delivery Date", Status, "Your Reference", "Salesperson Code")

        addafter("Salesperson Code")
        {
            field("Salesperson Commission"; Rec."Salesperson Commission")
            {
                Caption = 'Salesperson Commission';
                ToolTip = 'Salesperson Commission';
                ApplicationArea = All;
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
            }
        }

        moveafter("Salesperson Commission 3"; "Shortcut Dimension 2 Code")

        addafter("Shortcut Dimension 2 Code")
        {
            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                Caption = 'System Created By';
                ToolTip = 'System Created By';
                ApplicationArea = All;
                Editable = false;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'System Created Date';
                ToolTip = 'System Created Date';
                ApplicationArea = All;
                Editable = false;
            }

            field(SystemModifiedBy; Rec.SystemModifiedBy)
            {
                Caption = 'System Last Modified By';
                ToolTip = 'System Last Modified By';
                ApplicationArea = All;
                Editable = false;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'System Last Modified Date';
                ToolTip = 'System Last Modified Date';
                ApplicationArea = All;
                Editable = false;
            }

        }


        moveafter(status; "Shortcut Dimension 1 Code")
        addafter("Shortcut Dimension 1 Code")
        {
            field(ShortcutDimCode3; ShortcutDimCode[3])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,3';
                ToolTip = 'Global Dimension 4 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimension(3);
                end;
            }

            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                ApplicationArea = Dimensions;
                ToolTip = 'Freight Zone Code';
                Lookup = true;
                LookupPageId = "Freight Zone List";
            }

        }
        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
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

        modify("Due Date")
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


    }

    protected var
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