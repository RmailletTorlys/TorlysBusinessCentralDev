pageextension 50011 TorlysTransferOrderSubform extends "Transfer Order Subform"
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
                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityCase(Rec, xRec, 50001, 4);
                end;
            }

            field("Pallet Quantity"; Rec."Quantity Pallet")
            {
                Caption = 'Pallet Quantity';
                ToolTip = 'Pallet Quantity';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityPallet(Rec, xRec, 50002, 4);
                end;
            }

            field("Qty. to Ship Case"; Rec."Qty. to Ship Case")
            {
                Caption = 'Qty. to Ship Case';
                ToolTip = 'Qty. to Ship Case';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityCase(Rec, xRec, 50003, 4)
                end;
            }

            field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
            {
                Caption = 'Qty. to Ship Pallet';
                ToolTip = 'Qty. to Ship Pallet';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityPallet(Rec, xRec, 50004, 6)
                end;
            }

            field("Qty. to Receive Case"; Rec."Qty. to Receive Case")
            {
                Caption = 'Qty. to Receive Case';
                ToolTip = 'Qty. to Receive Case';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityCase(Rec, xRec, 50005, 7)
                end;

            }

            field("Qty. to Receive Pallet"; Rec."Qty. to Receive Pallet")
            {
                Caption = 'Qty. to Receive Pallet';
                ToolTip = 'Qty. to Receive Pallet';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityPallet(Rec, xRec, 50006, 7)
                end;

            }

        }
    }

}