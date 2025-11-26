Table 51058 "Display Line"
{
    Fields
    {
        field(1; "LineNo."; Integer)
        {
            Caption = 'Line No.';

        }
        field(2; "CustNo."; Code[10])
        {
            Caption = 'Customer No.';

        }
        field(3; "CustLocationCode"; Code[10])
        {
            Caption = 'Customer Location';

        }
        field(4; "Display Type"; Enum "Torlys Display Types")
        {
            Caption = 'Display Type';
        }
        field(5; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category".Code;
        }
        field(6; "Description"; Text[100])
        {
            Caption = 'Program Description';
        }
        field(7; "Comments"; Text[100])
        {
            Caption = 'Comments';
        }
    }

    Keys
    {
        key(Key1; "LineNo.", "CustNo.", CustLocationCode, "Display Type", "Item Category Code")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        LastLineNo: Integer;
    begin
        if "LineNo." = 0 then begin

            if Rec.FindLast() then
                LastLineNo := Rec."LineNo.";


            "LineNo." := LastLineNo + 10000;
        end;
    end;

    procedure PopulateDescription(DisplayRec: Record "Display Line")
    var
        ItemCategory: Record "Item Category";
    begin
        Rec := DisplayRec;
        if ItemCategory.Get(DisplayRec."Item Category Code") then
            Rec.Description := ItemCategory.Description;

    end;
}