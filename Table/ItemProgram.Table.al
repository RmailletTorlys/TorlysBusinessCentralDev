table 50334 ItemProgram
{
    DataClassification = CustomerContent;
    TableType = temporary;

    fields
    {


        field(1; RowNo; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Row No.';
        }

        field(2; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }

        field(3; "Description"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK; RowNo)
        {
            Clustered = true;
        }
    }
}