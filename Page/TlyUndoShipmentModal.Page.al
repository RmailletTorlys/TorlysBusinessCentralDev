page 50898 TlyUndoShipmentModal
{
    PageType = StandardDialog;
    Caption = 'Enter Reason for Undo Shipment';

    layout
    {
        area(Content)
        {
            field(DocumentNo; DocumentNo)
            {
                Caption = 'Order Number';
                ApplicationArea = All;
                Editable = false;
            }
            field(ItemNo; ItemNo)
            {
                Caption = 'Item Number';
                ApplicationArea = All;
                Editable = false;
            }
            field(Quantity; Quantity)
            {
                Caption = 'Quantity';
                ApplicationArea = All;
                Editable = false;
            }
            field(UndoComment; UndoComment)
            {
                Caption = 'Undo Comment';
                ApplicationArea = All;
                Editable = true;
            }
        }
    }

    procedure PresentModal(SHDocumentNo: Code[20]; SHItemNo: Code[20]; SHQuantity: Decimal)
    begin
        DocumentNo := SHDocumentNo;
        ItemNo := SHItemNo;
        Quantity := SHQuantity;
    end;

    procedure GetUndoComment(): Text
    begin
        exit(UndoComment)
    end;

    var
        DocumentNo: Code[20];
        ItemNo: Code[20];
        Quantity: Decimal;
        UndoComment: Text[30];
}