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
            TableRelation = "Display Header"."CustNo.";
        }
        field(3; "CustLocationCode"; Code[10])
        {
            Caption = 'Customer Location';
            TableRelation = "Display Header"."CustLocationCode";
        }
        field(4; "Display Type"; Code[20])
        {
            Caption = 'Display Type';
        }
        field(5; "Program No."; Code[20])
        {
            Caption = 'Description';
            TableRelation = "Item Category".Code;
        }
        field(6; "Description"; Text[100])
        {
            Caption = 'Description';
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
}