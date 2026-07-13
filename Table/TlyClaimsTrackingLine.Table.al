table 55008 TlyClaimsTrackingLine
{
    DataClassification = CustomerContent;
    Caption = 'Claims Tracking Line';
    // DrillDownPageId = TlyClaimsTrackingList;
    // LookupPageId = TlyClaimsTrackingList;

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
            // ObsoleteState = Removed;
            // ObsoleteReason = 'TLY-SD - 07/07/2026 - not needed';
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

        field(4; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Item,"G/L Account";
        }

        field(5; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            TableRelation =
            if (Type = const(" ")) "Standard Text"
            else
            if (Type = const(Item)) Item
            else
            if (Type = const("G/L Account")) "G/L Account";
            // else
            // if (Type = const(Resource)) Resource
            // else
            // if (Type = const("Charge (Item)")) "Item Charge";
            ValidateTableRelation = false;
            trigger OnValidate()
            var
                Item: Record Item;
                GLAcct: Record "G/L Account";
            begin
                if Rec.Type = Rec.Type::"G/L Account" then begin
                    GlAcct.Get(Rec."No.");
                    Rec.Description := GlAcct.Name;
                end else if Rec.Type = Rec.Type::Item then begin
                    Item.Get(Rec."No.");
                    Rec.Description := Item.Description;
                    Rec."Description 2" := Item."Description 2";
                    Rec."Unit Cost (LCY)" := Item."Unit Cost"
                end;
            end;
        }

        field(6; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            // TableRelation =
            // if (Type = const("G/L Account")) "G/L Account".Name
            // else
            // if (Type = const(Item)) Item.Description
            // else
            // if (Type = const(Resource)) Resource.Name
            // else
            // if (Type = const("Fixed Asset")) "Fixed Asset".Description
            // else
            // if (Type = const("Charge (Item)")) "Item Charge".Description;
            // ValidateTableRelation = false;
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
            trigger OnValidate()
            begin
                CalcAmount;
            end;
        }

        field(9; "Unit Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Unit Price';
            AutoFormatType = 2;
            DecimalPlaces = 0 : 5;
            trigger OnValidate()
            begin
                CalcAmount;
            end;
        }

        field(10; "Line Amount Excl. Tax"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Line Amount';
            AutoFormatType = 2;
            DecimalPlaces = 0 : 5;
            Editable = false;
        }

        field(11; "Unit Cost (LCY)"; Decimal)
        {
            DataClassification = CustomerContent;
            AutoFormatType = 2;
            Caption = 'Unit Cost';
            DecimalPlaces = 0 : 5;
        }

        field(12; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            Editable = false;
            ObsoleteState = Removed;
            ObsoleteReason = 'TLY-SD - 07/07/2026 - not needed';
        }
        field(13; "Description 2"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Description 2';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Claim No.", "Claim Line No.")
        {
            Clustered = true;
        }
    }

    procedure CalcAmount()
    begin
        Rec.Validate(Rec."Line Amount Excl. Tax", Rec.Quantity * Rec."Unit Price");
    end;
}