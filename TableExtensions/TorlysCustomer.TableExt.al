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

        field(50012; "Salesperson Commission"; Decimal)
        {
            Caption = 'Salesperson Commission';
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }

        field(50013; "Salesperson Code 2"; code[10])
        {
            Caption = 'Salesperson Code 2';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;
        }

        field(50014; "Salesperson Commission 2"; Decimal)
        {
            Caption = 'Salesperson Commission 2';
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }

        field(50015; "Salesperson Code 3"; code[10])
        {
            Caption = 'Salesperson Code 3';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = ToBeClassified;
        }

        field(50016; "Salesperson Commission 3"; Decimal)
        {
            Caption = 'Salesperson Commission 3';
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }

        field(50017; "Temp. Credit Limit (LCY)"; Decimal)
        {
            Caption = 'Temp. Credit Limit';
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }

        field(50018; "Temp. Credit Limit Expiry Date"; Date)
        {
            Caption = 'Temp. Credit Limit Expiry Date';
            DataClassification = ToBeClassified;
        }

        field(50019; "Date Opened"; Date)
        {
            Caption = 'Date Opened';
            DataClassification = ToBeClassified;
        }

        field(50020; "Date Closed"; Date)
        {
            Caption = 'Date Closed';
            DataClassification = ToBeClassified;
        }

        field(50021; "Restocking Fee %"; Decimal)
        {
            Caption = 'Restocking Fee %';
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }

        field(50022; "Restocking Fee Minimum"; Decimal)
        {
            Caption = 'Restocking Fee Minimum';
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }

        field(50023; "Power Up Level"; Option)
        {
            Caption = 'Power Up Level';
            OptionMembers = "1","2","3","4","5";
            DataClassification = ToBeClassified;
        }

        field(50024; "Power Up Start Date"; Date)
        {
            Caption = 'Power Up Start Date';
            DataClassification = ToBeClassified;
        }

        field(50025; "Power Up End Date"; Date)
        {
            Caption = 'Power Up End Date';
            DataClassification = ToBeClassified;
        }

        field(50026; "Program Fees Amount (LCY)"; Decimal)
        {
            Caption = 'Program Fees Amount';
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }

        field(50027; "Co-op Entitlement %"; Decimal)
        {
            Caption = 'Co-op Entitlement %';
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }

        field(50028; "Sample Allowance %"; Decimal)
        {
            Caption = 'Sample Allowance %';
            DecimalPlaces = 2;
            DataClassification = ToBeClassified;
        }

        field(50029; "A/R Notes"; text[50])
        {
            Caption = 'A/R Notes';
            DataClassification = ToBeClassified;
        }

        field(50030; "On Hold Count"; Integer)
        {
            Caption = 'On Hold Count';
            DataClassification = ToBeClassified;
        }

        field(50031; "NSF Count"; Integer)
        {
            Caption = 'NSF Count';
            DataClassification = ToBeClassified;
        }
    }

}