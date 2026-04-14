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
            field(UOM; UOM)
            {
                Caption = 'Unit of Measure Code';
                ApplicationArea = All;
                Editable = false;
            }
            field(Quantity; Quantity)
            {
                Caption = 'Quantity';
                ApplicationArea = All;
                Editable = false;
            }
            field(QuantityCase; QuantityCase)
            {
                Caption = 'Quantity Case';
                ApplicationArea = All;
                Editable = false;
            }
            field(QuantityDamaged; QuantityDamaged)
            {
                Caption = 'Quantity Damaged (Case/Each)';
                ApplicationArea = All;
                Editable = true;
            }
        }
    }

    var
        DocumentNo: Code[20];
        ItemNo: Code[20];
        ItemDescription: Text[100];
        UOM: Code[10];
        Quantity: Decimal;
        QuantityCase: Integer;
        QuantityDamaged: Decimal;

    procedure PresentModal(ReturnDocumentNo: Code[20]; ReturnItemNo: Code[20]; ReturnDescription: Text[50]; ReturnUOM: Code[10]; ReturnQuantity: Decimal; ReturnQuantityCase: Integer)
    begin
        DocumentNo := ReturnDocumentNo;
        ItemNo := ReturnItemNo;
        ItemDescription := ReturnDescription;
        UOM := ReturnUOM;
        Quantity := ReturnQuantity;
        QuantityCase := ReturnQuantityCase;
    end;

    procedure GetQuantity(): Decimal
    begin
        exit(QuantityDamaged)
    end;
}