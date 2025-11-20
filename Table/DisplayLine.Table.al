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
        field(5; "Program No."; Code[20])
        {
            Caption = 'Program No.';
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
        key(Key1; "Display Type", "Program No.")
        {
            Clustered = true;
        }
    }

    procedure PopulateDescription(DisplayRec: Record "Display Line")
    var
        ItemCategory: Record "Item Category";
    begin
        if ItemCategory.Get(DisplayRec."Program No.") then
            DisplayRec.Description := ItemCategory.Description;
    end;
}