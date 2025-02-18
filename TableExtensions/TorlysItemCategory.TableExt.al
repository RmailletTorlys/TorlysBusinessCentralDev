tableextension 51119 "TorlysItemCategory" extends "Item Category"
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

        field(50003; "Display on Price Lists"; Boolean)
        {
            Caption = 'Display on Price Lists';
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

        field(50006; "Price List Order"; Boolean)
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

        field(50009; "Outbound Duty % to US"; Decimal)
        {
            Caption = 'Outbound Duty % to US';
            DataClassification = CustomerContent;
        }
    }

}