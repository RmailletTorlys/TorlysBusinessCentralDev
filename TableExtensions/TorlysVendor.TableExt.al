tableextension 50023 "TorlysVendor" extends Vendor
{
    fields
    {
        field(50001; "Account No."; Text[20])
        {
            Caption = 'Account No.';
            DataClassification = CustomerContent;
        }

        field(50002; "Default G/L Account"; Code[20])
        {
            Caption = 'Default G/L Account';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
        }

        field(50003; "Payer ID"; Code[20])
        {
            Caption = 'Payer ID';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;

        }

        field(50005; "Invoice Unit of Measure"; Code[20])
        {
            Caption = 'Invoice Unit of Measure';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;

        }
    }
}
