pageextension 50005 TorlysSalesOrderSubform extends "Sales Order Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Case Quantity"; Rec."Quantity Case")
            {
                Caption = 'Case Quantity';
                ToolTip = 'Case Quantity';
                ApplicationArea = All;

            }

            field("Pallet Quantity"; Rec."Quantity Pallet")
            {
                Caption = 'Pallet Quantity';
                ToolTip = 'Pallet Quantity';
                ApplicationArea = All;

            }
        }
        addafter("Qty. to Ship")
        {
            field("Qty. to Ship Case"; Rec."Qty. to Ship Case")
            {
                Caption = 'Qty. to Ship Case';
                ToolTip = 'Qty. to Ship Case';
                ApplicationArea = All;

            }

            field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
            {
                Caption = 'Qty. to Ship Pallet';
                ToolTip = 'Qty. to Ship Pallet';
                ApplicationArea = All;

            }

        }
    }
}


//Unit of measure
//Quantity
//Outstanding Quantity
//Qty. to Ship
//Qty. to Ship Case
//Qty. to Ship Pallet
//Quantity Shipped
//Quantity Shipped Not Invoiced
//Quantity to Invoice
//Quantity Invoiced


//Line Discount % -> HIDE
//Line Amount Excl. Tax
//Unit Cost -> Change Visible = True
//Line Cost (Is it a flowfield? or calculated field on subform?)

//Purchasing Code
//Drop Shipment
//Purchase Order Number
//Purch. Order Line Number
//Special Order
//Special Order Purchase Number
//Special Order Purch. Line Number


