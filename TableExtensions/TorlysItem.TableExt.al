tableextension 50100 TorlysItem extends Item
{
    fields
    {
        field(50101; "New Item"; Boolean)
        {
            Caption = 'New Item';
            DataClassification = CustomerContent;
        }

        field(50102; "Current Item"; Boolean)
        {
            Caption = 'Current Item';
            DataClassification = CustomerContent;
        }

        field(50103; "Special Item"; Boolean)
        {
            Caption = 'Special Item';
            DataClassification = CustomerContent;
        }

        field(50104; "Clearance Item"; Boolean)
        {
            Caption = 'Clearance Item';
            DataClassification = CustomerContent;
        }

        field(50105; "Discontinued"; Boolean)
        {
            Caption = 'Discontinued';
            DataClassification = CustomerContent;
        }

        field(50106; "Discontinued Date"; Date)
        {
            Caption = 'Discontinued Date';
            DataClassification = CustomerContent;
        }

        field(50127; "Freigt Item"; Boolean)
        {
            Caption = 'Freigt Item';
            DataClassification = ToBeClassified;
        }

        field(50128; "Misc. Item"; Boolean)
        {
            Caption = 'Misc. Item';
            DataClassification = ToBeClassified;
        }

        field(50129; "Critical Display Item"; Boolean)
        {
            Caption = 'Critical Display Item';
            DataClassification = ToBeClassified;
        }

        field(50130; "Sunset Item"; Boolean)
        {
            Caption = 'Sunset Item';
            DataClassification = ToBeClassified;
        }

        field(50165; "Sunset Date"; Date)
        {
            Caption = 'Sunset Date';
            DataClassification = ToBeClassified;
        }

        field(50131; "FOC Item"; Boolean)
        {
            Caption = 'FOC Item';
            DataClassification = ToBeClassified;
        }

        field(50132; "Phase Out Item"; Boolean)
        {
            Caption = 'Phase Out Item';
            DataClassification = ToBeClassified;
        }

        field(50163; "Phase Out Date"; Date)
        {
            Caption = 'Phase Out Date';
            DataClassification = ToBeClassified;
        }

        field(50133; "High Shade Variation"; Boolean)
        {
            Caption = 'High Shade Variation';
            DataClassification = ToBeClassified;
        }

        field(50164; "Automatically Allocate"; Boolean)
        {
            Caption = 'Automatically Allocate';
            DataClassification = ToBeClassified;
        }

        field(50134; "Allow SO Unit Cost Edit"; Boolean)
        {
            Caption = 'Allow SO Unit Cost Edit';
            DataClassification = ToBeClassified;
        }

        field(50135; "Focus Item"; Boolean)
        {
            Caption = 'Focus Item';
            DataClassification = ToBeClassified;
        }

        field(50136; "In Catalogue"; Boolean)
        {
            Caption = 'In Catalogue';
            DataClassification = ToBeClassified;
        }

        field(50137; "Launch Date"; Date)
        {
            Caption = 'Launch Date';
            DataClassification = ToBeClassified;
        }

        field(50138; "Qty. to Ship"; Decimal)
        {
            Caption = 'Quantity to Ship';
            DataClassification = ToBeClassified;
        }

        field(50139; "Qty. to Ship Transfer"; Decimal)
        {
            Caption = 'Quantity to Ship Transfer';
            DataClassification = ToBeClassified;
        }

        field(50140; "Qty. to Receive Transfer"; Decimal)
        {
            Caption = 'Quantity to Receive Transfer';
            DataClassification = ToBeClassified;
        }

        field(50141; "Qty. on Hand - TOR"; Decimal)
        {
            Caption = 'Quantity on Hand - TOR';
            DataClassification = ToBeClassified;
        }

        field(50142; "Qty. on Sales Order - TOR"; Decimal)
        {
            Caption = 'Quantity on Sales Order - TOR';
            DataClassification = ToBeClassified;
        }

        field(50143; "Qty. on Hand - QUATOR"; Decimal)
        {
            Caption = 'Quantity on Hand - QUATOR';
            DataClassification = ToBeClassified;
        }

        field(50144; "Qty. on Sales Order - CAL"; Decimal)
        {
            Caption = 'Quantity on Sales Order - CAL';
            DataClassification = ToBeClassified;
        }

        field(50145; "Previous Full 3 Months Sales"; Decimal)
        {
            Caption = 'Previous Full 3 Months Sales';
            DataClassification = ToBeClassified;
        }

        field(50146; "Previous Full 3 Months Filter"; Date)
        {
            //This one may not be required???
            Caption = 'Previous Full 3 Months Filter';
            DataClassification = ToBeClassified;
        }

        field(50147; "Qty. on Hand - CAL"; Decimal)
        {
            Caption = 'Quantity on Hand - CAL';
            DataClassification = ToBeClassified;
        }

        field(50148; "Qty. on Hand - QUACAL"; Decimal)
        {
            Caption = 'Quantity on Hand - QUACAL';
            DataClassification = ToBeClassified;
        }

        field(50149; "Qty. on Hand - CLAIMSTOR"; Decimal)
        {
            Caption = 'Quantity on Hand - CLAIMSTOR';
            DataClassification = ToBeClassified;
        }

        field(50150; "Qty. on Hand - CLAIMSCAL:"; Decimal)
        {
            Caption = 'Quantity on Hand - CLAIMSCAL';
            DataClassification = ToBeClassified;
        }

        field(50151; "Qty. on Hand - TRAILER"; Decimal)
        {
            Caption = 'Quantity on Hand - TRAILER';
            DataClassification = ToBeClassified;
        }

        field(50152; "Qty. on Hand - XGS"; Decimal)
        {
            Caption = 'Quantity on Hand - XGS';
            DataClassification = ToBeClassified;
        }

        field(50153; "Qty. on Hand - Virtual"; Decimal)
        {
            Caption = 'Quantity on Hand - Virtual';
            DataClassification = ToBeClassified;
        }

        field(50154; "Qty. on Hand - UWL"; Decimal)
        {
            Caption = 'Quantity on Hand - UWL';
            DataClassification = ToBeClassified;
        }

        field(50155; "Qty. on Hand - WSL"; Decimal)
        {
            Caption = 'Quantity on Hand - WSL';
            DataClassification = ToBeClassified;
        }

        field(50156; "Qty. on Hand - KESTREL"; Decimal)
        {
            Caption = 'Quantity on Hand - KESTREL';
            DataClassification = ToBeClassified;
        }

        field(50157; "Qty. on Hand - SCANGLOBAL"; Decimal)
        {
            Caption = 'Quantity on Hand - SCANGLOBAL';
            DataClassification = ToBeClassified;
        }

        field(50158; "Qty. on Hand - KRN"; Decimal)
        {
            Caption = 'Quantity on Hand - KRN';
            DataClassification = ToBeClassified;
        }

        field(50159; "Qty. on Hand - SHIPCURVE"; Decimal)
        {
            Caption = 'Quantity on Hand - SHIPCURVE';
            DataClassification = ToBeClassified;
        }

        field(50160; "VMI Stock"; Decimal)
        {
            Caption = 'VMI Stock';
            DataClassification = ToBeClassified;
        }

        field(50161; "Qty. on Transfer Order"; Decimal)
        {
            Caption = 'Quantity on Transfer Order';
            DataClassification = ToBeClassified;
        }

        field(50166; "Incoming ROs"; Decimal)
        {
            Caption = 'Incoming ROs';
            DataClassification = ToBeClassified;
        }
    }
}
