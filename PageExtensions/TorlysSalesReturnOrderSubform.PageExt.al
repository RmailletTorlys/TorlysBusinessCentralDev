pageextension 50007 TorlysSalesReturnOrderSubform extends "Sales Return Order Subform"
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
                    Rec.OnValidateQuantityCase(Rec, xRec, 50001, 15);
                end;
            }

            field("Pallet Quantity"; Rec."Quantity Pallet")
            {
                Caption = 'Pallet Quantity';
                ToolTip = 'Pallet Quantity';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityPallet(Rec, xRec, 50002, 15);
                end;
            }

            field("Qty. To Receive Case"; Rec."Qty. to Receive Case")
            {
                Caption = 'Qty. to Receive Case';
                ToolTip = 'Qty. to Receive Case';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityCase(Rec, xRec, 50005, 5803)
                end;

            }

            field("Qty. to Receive Pallet"; Rec."Qty. to Receive Pallet")
            {
                Caption = 'Qty. to Receive Pallet';
                ToolTip = 'Qty. to Receive Pallet';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityPallet(Rec, xRec, 50006, 5803)
                end;
            }

            field("Qty. Received Case"; Rec."Qty. Received Case")
            {
                Caption = 'Qty. Received Case';
                ToolTip = 'Qty. Received Case';
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityCase(Rec, xRec, 50007, 5809);
                end;


            }

            field("Qty. Received Pallet"; Rec."Qty. Received Pallet")
            {
                Caption = 'Qty. Received Pallet';
                ToolTip = 'Qty. Received Pallet';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityPallet(Rec, xRec, 50008, 5809);
                end;
            }
        }
    }
}