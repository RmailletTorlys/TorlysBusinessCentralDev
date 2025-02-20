pageextension 50005 TorlysSalesOrderSubform extends "Sales Order Subform"
{
    layout
    {
        movebefore(Quantity; "Unit of Measure")

        addafter(Quantity)
        {
            field("Case Quantity"; Rec."Quantity Case")
            {
                Caption = 'Case Quantity';
                ToolTip = 'Case Quantity';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    OnValidateCase(Rec, Rec);
                end;

            }

            field("Pallet Quantity"; Rec."Quantity Pallet")
            {
                Caption = 'Pallet Quantity';
                ToolTip = 'Pallet Quantity';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    OnValidatePallet(Rec, Rec);
                end;


            }
        }

        moveafter("Pallet Quantity"; "Qty. to Ship")
        addafter("Qty. to Ship")
        {
            field("Qty. to Ship Case"; Rec."Qty. to Ship Case")
            {
                Caption = 'Qty. to Ship Case';
                ToolTip = 'Qty. to Ship Case';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    OnValidateToShipCase(Rec, xRec);
                end;

            }

            field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
            {
                Caption = 'Qty. to Ship Pallet';
                ToolTip = 'Qty. to Ship Pallet';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidateToShipPallet(Rec, xRec);
                end;

            }

        }
        moveafter("Qty. to Ship Pallet"; "Quantity Shipped")
        addafter("Quantity Shipped")
        {
            field("Qty. Shipped Not Invoiced"; Rec."Shipped Not Invoiced")
            {
                Caption = 'Qty. Shipped Not Invoiced';
                ToolTip = 'Qty. Shipped Not Invoiced';
                ApplicationArea = All;
            }
        }

        moveafter("Qty. Shipped Not Invoiced"; "Qty. to Invoice")

        moveafter("Qty. to Invoice"; "Quantity Invoiced")

        moveafter("Quantity Invoiced"; "Total Amount Excl. VAT")

        moveafter("Total Amount Excl. VAT"; "Unit Cost (LCY)")

        moveafter("Unit Cost (LCY)"; "Line Amount")

        moveafter("Line Amount"; "Purchasing Code")

        moveafter("Purchasing Code"; "Drop Shipment")

        addafter("Drop Shipment")
        {
            field("PO No."; Rec."Purchase Order No.")
            {
                Caption = 'PO Number';
                ToolTip = 'Purchase Order No.';
                ApplicationArea = All;

            }
        }

        addafter("PO No.")
        {
            field("PO Line No."; Rec."Purch. Order Line No.")
            {
                Caption = 'PO Line No.';
                ToolTip = 'Purch. Order Line No.';
                ApplicationArea = All;

            }
        }

        moveafter("PO Line No."; "Special Order")

        addafter("Special Order")
        {
            field("Special Order PO No."; Rec."Special Order Purchase No.")
            {
                Caption = 'Special Order PO No.';
                ToolTip = 'Special Order PO No.';
                ApplicationArea = All;

            }
        }

        addafter("Special Order PO No.")
        {
            field("Special Order PO Line No."; Rec."Special Order Purch. Line No.")
            {
                Caption = 'Special Order PO Line No.';
                ToolTip = 'Special Order Line No.';
                ApplicationArea = All;

            }
        }


        modify("Line Discount %")
        {
            Visible = false;
        }

        modify("Unit Cost (LCY)")
        {
            Visible = true;
        }



    }
    [IntegrationEvent(false, false)]
    local procedure OnValidateCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidatePallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateToShipCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateToShipPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    begin
    end;

}


