tableextension 50101 TorlysItem extends Item
{
    fields
    {
        field(50001; "New Item"; Boolean)
        {
            Caption = 'New Item';
            DataClassification = CustomerContent;
        }

        field(50002; "Current Item"; Boolean)
        {
            Caption = 'Current Item';
            DataClassification = CustomerContent;
        }

        field(50003; "Special Item"; Boolean)
        {
            Caption = 'Special Item';
            DataClassification = CustomerContent;
        }

        field(50004; "Clearance Item"; Boolean)
        {
            Caption = 'Clearance Item';
            DataClassification = CustomerContent;
        }

        field(50005; "Discontinued"; Boolean)
        {
            Caption = 'Discontinued';
            DataClassification = CustomerContent;
        }

        field(50006; "Discontinued Date"; Date)
        {
            Caption = 'Discontinued Date';
            DataClassification = CustomerContent;
        }

        field(50007; "Freigt Item"; Boolean)
        {
            Caption = 'Freigt Item';
            DataClassification = ToBeClassified;
        }

        field(50008; "Misc. Item"; Boolean)
        {
            Caption = 'Misc. Item';
            DataClassification = ToBeClassified;
        }

        field(50009; "Critical Display Item"; Boolean)
        {
            Caption = 'Critical Display Item';
            DataClassification = ToBeClassified;
        }

        field(500010; "Sunset Item"; Boolean)
        {
            Caption = 'Sunset Item';
            DataClassification = ToBeClassified;
        }

        field(50011; "Sunset Date"; Date)
        {
            Caption = 'Sunset Date';
            DataClassification = ToBeClassified;
        }

        field(50012; "FOC Item"; Boolean)
        {
            Caption = 'FOC Item';
            DataClassification = ToBeClassified;
        }

        field(50013; "Phase Out Item"; Boolean)
        {
            Caption = 'Phase Out Item';
            DataClassification = ToBeClassified;
        }

        field(50014; "Phase Out Date"; Date)
        {
            Caption = 'Phase Out Date';
            DataClassification = ToBeClassified;
        }

        field(50015; "High Shade Variation"; Boolean)
        {
            Caption = 'High Shade Variation';
            DataClassification = ToBeClassified;
        }

        field(50016; "Automatically Allocate"; Boolean)
        {
            Caption = 'Automatically Allocate';
            DataClassification = ToBeClassified;
        }

        field(50017; "Allow SO Unit Cost Edit"; Boolean)
        {
            Caption = 'Allow SO Unit Cost Edit';
            DataClassification = ToBeClassified;
        }

        field(50018; "Focus Item"; Boolean)
        {
            Caption = 'Focus Item';
            DataClassification = ToBeClassified;
        }

        field(50019; "In Catalogue"; Boolean)
        {
            Caption = 'In Catalogue';
            DataClassification = ToBeClassified;
        }

        field(50020; "Launch Date"; Date)
        {
            Caption = 'Launch Date';
            DataClassification = ToBeClassified;
        }

        field(50021; "Qty. to Ship"; Decimal)
        {
            Caption = 'Quantity to Ship';
            DataClassification = ToBeClassified;
        }

        field(50022; "Qty. to Ship Transfer"; Decimal)
        {
            Caption = 'Quantity to Ship Transfer';
            DataClassification = ToBeClassified;
        }

        field(50023; "Qty. to Receive Transfer"; Decimal)
        {
            Caption = 'Quantity to Receive Transfer';
            DataClassification = ToBeClassified;
        }

        field(50024; "Qty. on Hand - TOR"; Decimal)
        {
            Caption = 'Quantity on Hand - TOR';
            DataClassification = ToBeClassified;
        }

        field(50025; "Qty. on Sales Order - TOR"; Decimal)
        {
            Caption = 'Quantity on Sales Order - TOR';
            DataClassification = ToBeClassified;
        }

        field(50026; "Qty. on Hand - QUATOR"; Decimal)
        {
            Caption = 'Quantity on Hand - QUATOR';
            DataClassification = ToBeClassified;
        }

        field(50027; "Qty. on Sales Order - CAL"; Decimal)
        {
            Caption = 'Quantity on Sales Order - CAL';
            DataClassification = ToBeClassified;
        }

        field(50028; "Previous Full 3 Months Sales"; Decimal)
        {
            Caption = 'Previous Full 3 Months Sales';
            DataClassification = ToBeClassified;
        }

        field(50029; "Previous Full 3 Months Filter"; Date)
        {
            //This one may not be required???
            Caption = 'Previous Full 3 Months Filter';
            DataClassification = ToBeClassified;
        }

        field(50030; "Qty. on Hand - CAL"; Decimal)
        {
            Caption = 'Quantity on Hand - CAL';
            DataClassification = ToBeClassified;
        }

        field(50031; "Qty. on Hand - QUACAL"; Decimal)
        {
            Caption = 'Quantity on Hand - QUACAL';
            DataClassification = ToBeClassified;
        }

        field(50032; "Qty. on Hand - CLAIMSTOR"; Decimal)
        {
            Caption = 'Quantity on Hand - CLAIMSTOR';
            DataClassification = ToBeClassified;
        }

        field(50033; "Qty. on Hand - CLAIMSCAL:"; Decimal)
        {
            Caption = 'Quantity on Hand - CLAIMSCAL';
            DataClassification = ToBeClassified;
        }

        field(50034; "Qty. on Hand - TRAILER"; Decimal)
        {
            Caption = 'Quantity on Hand - TRAILER';
            DataClassification = ToBeClassified;
        }

        field(50035; "Qty. on Hand - XGS"; Decimal)
        {
            Caption = 'Quantity on Hand - XGS';
            DataClassification = ToBeClassified;
        }

        field(50036; "Qty. on Hand - Virtual"; Decimal)
        {
            Caption = 'Quantity on Hand - Virtual';
            DataClassification = ToBeClassified;
        }

        field(50037; "Qty. on Hand - UWL"; Decimal)
        {
            Caption = 'Quantity on Hand - UWL';
            DataClassification = ToBeClassified;
        }

        field(50038; "Qty. on Hand - WSL"; Decimal)
        {
            Caption = 'Quantity on Hand - WSL';
            DataClassification = ToBeClassified;
        }

        field(50039; "Qty. on Hand - KESTREL"; Decimal)
        {
            Caption = 'Quantity on Hand - KESTREL';
            DataClassification = ToBeClassified;
        }

        field(50040; "Qty. on Hand - SCANGLOBAL"; Decimal)
        {
            Caption = 'Quantity on Hand - SCANGLOBAL';
            DataClassification = ToBeClassified;
        }

        field(50041; "Qty. on Hand - KRN"; Decimal)
        {
            Caption = 'Quantity on Hand - KRN';
            DataClassification = ToBeClassified;
        }

        field(50042; "Qty. on Hand - SHIPCURVE"; Decimal)
        {
            Caption = 'Quantity on Hand - SHIPCURVE';
            DataClassification = ToBeClassified;
        }

        field(50043; "VMI Stock"; Decimal)
        {
            Caption = 'VMI Stock';
            DataClassification = ToBeClassified;
        }

        field(50044; "Qty. on Transfer Order"; Decimal)
        {
            Caption = 'Quantity on Transfer Order';
            DataClassification = ToBeClassified;
        }

        field(50045; "Incoming ROs"; Decimal)
        {
            Caption = 'Incoming ROs';
            DataClassification = ToBeClassified;
        }

        field(50046; "Compare Unit of Measure"; Code[20])
        {
            Caption = 'Compare Unit of Measure';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
    }
}
