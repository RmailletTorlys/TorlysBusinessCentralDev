table 55008 TlyClaimsTrackingLine
{
    DataClassification = CustomerContent;
    Caption = 'Claims Tracking Line';

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
        }

        field(2; "Claim No."; Code[20])
        {
            Caption = 'Document No.';

        }

        field(3; "Claim Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }

        field(4; "Type"; Enum "Sales Line Type")
        {

            Caption = 'Type';
        }

        field(5; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if (Type = const(" ")) "Standard Text"
            else
            if (Type = const("G/L Account"), "System-Created Entry" = const(false)) "G/L Account" where("Direct Posting" = const(true), "Account Type" = const(Posting), Blocked = const(false))
            else
            if (Type = const("G/L Account"), "System-Created Entry" = const(true)) "G/L Account"
            else
            if (Type = const(Resource)) Resource
            else
            if (Type = const("Fixed Asset")) "Fixed Asset"
            else
            if (Type = const("Charge (Item)")) "Item Charge"
            else
            if (Type = const("Allocation Account")) "Allocation Account"
            else
            if (Type = const(Item), "Document Type" = filter(<> "Credit Memo" & <> "Return Order")) Item where(Blocked = const(false), "Sales Blocked" = const(false))
            else
            if (Type = const(Item), "Document Type" = filter("Credit Memo" | "Return Order")) Item where(Blocked = const(false));
            ValidateTableRelation = false;
        }

        field(6; "Description"; Text[100])
        {
            Caption = 'Description';
            TableRelation = if (Type = const("G/L Account"),
                                "System-Created Entry" = const(false)) "G/L Account".Name where("Direct Posting" = const(true),
                                "Account Type" = const(Posting),
                                Blocked = const(false))
            else
            if (Type = const("G/L Account"), "System-Created Entry" = const(true)) "G/L Account".Name
            else
            if (Type = const(Item), "Document Type" = filter(<> "Credit Memo" & <> "Return Order")) Item.Description where(Blocked = const(false),
                                                    "Sales Blocked" = const(false))
            else
            if (Type = const(Item), "Document Type" = filter("Credit Memo" | "Return Order")) Item.Description where(Blocked = const(false))
            else
            if (Type = const(Resource)) Resource.Name
            else
            if (Type = const("Fixed Asset")) "Fixed Asset".Description
            else
            if (Type = const("Charge (Item)")) "Item Charge".Description;
            ValidateTableRelation = false;
        }

        field(7; "Batch No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Batch No.';
        }

        field(8; "Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }

        field(9; "Unit Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Unit Price';
            AutoFormatType = 2;
        }

        field(10; "Line Amount Excl. Tax"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Line Amount Excl. Tax';
            DecimalPlaces = 0 : 5;
        }

        field(11; "Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost (LCY)';
        }

        field(12; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Claim No.", "Claim Line No.")
        {
            Clustered = true;
        }
    }
}