table 50087 TlySalesRepBuffer
{
    Caption = 'Sales Rep Buffer';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer) { Caption = 'Entry No.'; }
        field(2; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionMembers = Invoice,"Credit Memo";
        }
        field(3; "Document No."; Code[20]) { Caption = 'Document No.'; }
        field(4; "Posting Date"; Date) { Caption = 'Posting Date'; }
        field(5; "Customer No."; Code[20]) { Caption = 'Customer No.'; }
        field(6; "Customer Name"; Text[100]) { Caption = 'Customer Name'; }
        field(7; "Customer Type"; Code[20]) { Caption = 'Customer Type'; }
        field(8; "No."; Code[20]) { Caption = 'No.'; }
        field(9; Description; Text[100]) { Caption = 'Description'; }
        field(10; "Gen. Prod. Posting Group"; Code[20]) { Caption = 'Gen. Prod. Posting Group'; }
        field(11; Quantity; Decimal) { Caption = 'Quantity'; DecimalPlaces = 0 : 5; }
        field(12; "Unit Price"; Decimal) { Caption = 'Unit Price'; }
        field(13; "Currency Code"; Code[10]) { Caption = 'Currency Code'; }
        field(14; "Amount (LCY)"; Decimal) { Caption = 'Amount (LCY)'; }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
        key(Sorting; "Posting Date", "Document No.") { }
    }
}
