pageextension 50012 TorlysSalesCrMemoSubForm extends "Sales Cr. Memo Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Case Quantity"; Rec."Quantity Case")
            {
                ToolTip = 'Case Quantity';
                Caption = 'Case Quantity';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityCase(Rec, xRec, 50001, 15);
                end;
            }

            field("Pallet Quantity"; Rec."Quantity Pallet")
            {
                ToolTip = 'Pallet Quantity';
                Caption = 'Pallet Quantity';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    Rec.OnValidateQuantityPallet(Rec, xRec, 50002, 15);
                end;
            }
        }
    }
}
