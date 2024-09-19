tableextension 50100 TorlysCustomer extends Customer
{
    fields
    {
        field(50001; "Collector ID"; code[20])
        {
            Caption = 'Collector ID';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;

        }

        field(50002; "DBA"; text[20])
        {
            Caption = 'Does Business As';
            DataClassification = ToBeClassified;
        }

        field(50003; "Credit Limit Modified Date"; Date)
        {
            Caption = 'Credit Limit Modified Date';
            DataClassification = ToBeClassified;
        }

        field(50004; "Credit Limit Modified By"; code[20])
        {
            Caption = 'Credit Limit Modified By';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;
        }

        field(50005; "Previous Credit Limit (LCY)"; Decimal)
        {
            Caption = 'Previous Credit Limit (LCY)';
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }

        field(50006; "Credit Warnings"; Option)
        {
            Caption = 'Credit Warnings';
            OptionMembers = "No","Yes";
            DataClassification = ToBeClassified;
        }

        field(50007; "Close Account"; Boolean)
        {
            Caption = 'Close Account';
            DataClassification = ToBeClassified;
        }

        field(50008; "Date Closed"; Date)
        {
            Caption = 'Date Closed';
            DataClassification = ToBeClassified;
        }

        field(50009; "Closed By"; code[20])
        {
            Caption = 'Closed By';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;
        }

        field(50010; "Invoice (Mail/Fax)"; Option)
        {
            //Check on if this field is still needed
            Caption = 'Invoice (Mail/Fax)';
            OptionMembers = "Mail","Fax";
            DataClassification = ToBeClassified;
        }

        field(50011; "Statements"; Option)
        {
            //Check on if this field is still needed
            Caption = 'Statements';
            OptionMembers = "Mail","Fax";
            DataClassification = ToBeClassified;
        }

    }

}