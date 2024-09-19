tableextension 50102 "TorlysVendor" extends Vendor
{
    fields
    {
        field(50001; "Account No."; Text[20])
        {
            Caption = 'Account No.';
            DataClassification = ToBeClassified;
        }

        field(50002; "Default G/L Account"; Code[20])
        {
            Caption = 'Default G/L Account';
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }

        field(50003; "Payer ID"; Code[20])
        {
            Caption = 'Payer ID';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;

        }

        field(50004; "Payer ID 2"; Code[20])
        {
            Caption = 'Payer ID 2';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;

        }

        field(50005; "Invoice Unit of Measure"; Code[20])
        {
            Caption = 'Invoice Unit of Measure';
            TableRelation = "Unit of Measure";
            DataClassification = ToBeClassified;

        }
    }
}
