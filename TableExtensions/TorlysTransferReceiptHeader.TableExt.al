tableextension 55746 TorlysTransferReceiptHeader extends "Transfer Receipt Header"
{
    fields
    {
        field(50001; "Transfer Type"; Enum TorlysTransferType)
        {
            Caption = 'Transfer Type';
            DataClassification = CustomerContent;
        }

        field(50002; "Picked By"; Code[20])
        {
            Caption = 'Picked By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";
        }

        field(50003; "Audited By"; Code[20])
        {
            Caption = 'Audited By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";
        }

        field(50004; "Received By"; Code[20])
        {
            Caption = 'Received By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";
        }

        field(50005; "Put Away By"; Code[20])
        {
            Caption = 'Put Away By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";
        }
        field(50006; "BOL No."; Code[20])
        {
            Caption = 'BOL No.';
            DataClassification = CustomerContent;
        }
        field(50007; "Package Tracking No."; Text[50])
        {
            Caption = 'Package Tracking No.';
            DataClassification = CustomerContent;
        }
        field(50008; "Shipping Comment"; Text[50])
        {
            Caption = 'Shipping Comment';
            DataClassification = CustomerContent;
        }
    }
}