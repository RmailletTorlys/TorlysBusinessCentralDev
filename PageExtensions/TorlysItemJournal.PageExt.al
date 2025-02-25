pageextension 50009 TorlysItemJournal extends "Item Journal"
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
                    OnValidateCase(Rec, xRec);
                end;
            }

            field("Pallet Quantity"; Rec."Quantity Pallet")
            {
                Caption = 'Pallet Quantity';
                ToolTip = 'Pallet Quantity';
                ApplicationArea = All;
                trigger OnValidate()
                begin
                    OnValidatePallet(Rec, xRec);
                end;
            }
        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnValidateCase(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidatePallet(var Rec: Record "Item Journal Line"; xRec: Record "Item Journal Line")
    begin
    end;
}