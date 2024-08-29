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
    }
}
