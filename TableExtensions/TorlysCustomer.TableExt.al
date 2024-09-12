tableextension 50117 TorlysCustomer extends Customer
{
    fields
    {
        field(50118; "Collector ID"; code[20])
        {
            Caption = 'Collector ID';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;

        }

        field(50119; "DBA"; text[20])
        {
            Caption = 'Does Business As';
            DataClassification = ToBeClassified;
        }

        field(50120; "Credit Limit Modified Date"; Date)
        {
            Caption = 'Credit Limit Modified Date';
            DataClassification = ToBeClassified;
        }

        field(50121; "Credit Limit Modified By"; code[20])
        {
            Caption = 'Credit Limit Modified By';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;
        }

        field(50122; "Previous Credit Limit (LCY)"; Decimal)
        {
            Caption = 'Previous Credit Limit (LCY)';
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }

        field(50123; "Credit Warnings"; Option)
        {
            Caption = 'Credit Warnings';
            OptionMembers = "No","Yes";
            DataClassification = ToBeClassified;
        }

        field(50124; "Close Account"; Boolean)
        {
            Caption = 'Close Account';
            DataClassification = ToBeClassified;
        }

        field(50125; "Date Closed"; Date)
        {
            Caption = 'Date Closed';
            DataClassification = ToBeClassified;
        }

        field(50126; "Closed By"; code[20])
        {
            Caption = 'Closed By';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;
        }

        field(50167; "Invoice (Mail/Fax)"; Option)
        {
            //Check on if this field is still needed
            Caption = 'Invoice (Mail/Fax)';
            OptionMembers = "Mail","Fax";
            DataClassification = ToBeClassified;
        }

        field(50168; "Statements"; Option)
        {
            //Check on if this field is still needed
            Caption = 'Statements';
            OptionMembers = "Mail","Fax";
            DataClassification = ToBeClassified;
        }

    }

}