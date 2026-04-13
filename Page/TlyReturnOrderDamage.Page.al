page 50998 TlyReturnOrderDamage
{
    PageType = StandardDialog;
    Caption = 'How many cases are damaged?';

    layout
    {
        area(Content)
        {
            field(DocumentNo; DocumentNo)
            {
                Caption = 'Return Number';
                ApplicationArea = All;
                Editable = false;
            }
            field(ItemNo; ItemNo)
            {
                Caption = 'Item Number';
                ApplicationArea = All;
                Editable = false;
            }
            field(ItemDescription; ItemDescription)
            {
                Caption = 'Item Description';
                ApplicationArea = All;
                Editable = false;
            }
            field(Quantity; Quantity)
            {
                Caption = 'Quantity Total';
                ApplicationArea = All;
                Editable = false;
            }
            field(DamagedQty; DamagedQty)
            {
                Caption = 'Quantity Damaged';
                ApplicationArea = All;
                Editable = true;
            }
        }
    }

    var
        DocumentNo: Code[20];
        ItemNo: Code[20];
        ItemDescription: Text[100];
        Quantity: Decimal;
        DamagedQty: Decimal;

    procedure PresentModal(ReturnDocumentNo: Code[20]; ReturnItemNo: Code[20]; ReturnDescription: Text[50]; ReturnQuantity: Decimal)
    begin
        DocumentNo := ReturnDocumentNo;
        ItemNo := ReturnItemNo;
        ItemDescription := ReturnDescription;
        Quantity := ReturnQuantity;
    end;

    procedure GetQuantity(): Decimal
    begin
        exit(DamagedQty)
    end;
}