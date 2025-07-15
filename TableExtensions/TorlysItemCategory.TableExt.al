tableextension 55722 "TorlysItemCategory" extends "Item Category"
{
    fields
    {
        field(50001; "Dimensions"; Text[150])
        {
            Caption = 'Dimensions';
            DataClassification = CustomerContent;

        }

        field(50002; "Description 2"; Text[100])
        {
            Caption = 'Description 2';
            DataClassification = CustomerContent;
        }


        field(50004; "Description (FR)"; Text[100])
        {
            Caption = 'Description (FR)';
            DataClassification = CustomerContent;
        }

        field(50005; "Description 2 (FR)"; Text[100])
        {
            Caption = 'Description 2 (FR)';
            DataClassification = CustomerContent;
        }

        field(50006; "Price List Order"; Integer)
        {
            Caption = 'Price List Order';
            DataClassification = CustomerContent;
        }

        field(50007; "Not Available in US"; Boolean)
        {
            Caption = 'Not Available in US';
            DataClassification = CustomerContent;
        }

        field(50008; "US Exclusive"; Boolean)
        {
            Caption = 'US Exclusive';
            DataClassification = CustomerContent;
        }
    }

}