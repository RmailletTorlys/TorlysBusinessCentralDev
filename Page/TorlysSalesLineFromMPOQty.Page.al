page 50997 TorlysSalesLineFromMPOQty
{
    PageType = StandardDialog;
    Caption = 'Enter Quantity To Draw';

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
            field(ItemDescription; ItemDescription)
            {
                Caption = 'Item Description';
                ApplicationArea = All;
                Editable = false;
            }
            field(Quantity; Quantity)
            {
                Caption = 'Quantity On MPO';
                ApplicationArea = All;
                Editable = false;
            }
            field(QtyField; QuantityToDraw)
            {
                Caption = 'Quantity To Draw';
                ApplicationArea = All;
                Editable = true;
            }
        }
    }

    procedure PresentModal(MPODocumentNo: Code[20]; MPOItemNo: Code[20]; MPODescription: Text[50]; MPOQuantity: Decimal)
    begin
        DocumentNo := MPODocumentNo;
        ItemNo := MPOItemNo;
        ItemDescription := MPODescription;
        Quantity := MPOQuantity;
    end;

    procedure GetQuantity(): Decimal
    begin
        exit(QuantityToDraw)
    end;

    var
        DocumentNo: Code[20];
        ItemNo: Code[20];
        ItemDescription: Text[100];
        Quantity: Decimal;
        QuantityToDraw: Decimal;
}