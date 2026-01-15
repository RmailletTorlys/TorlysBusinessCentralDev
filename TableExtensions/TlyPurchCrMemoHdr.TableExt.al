tableextension 50124 TlyPurchCrMemoHdr extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(50001; "Manufacturer Code"; Code[10])
        {
            Caption = 'Manufacturer Code';
            DataClassification = CustomerContent;
            TableRelation = Manufacturer;
        }

        field(50010; "Last Archived Date"; Date)
        {
            Caption = 'Last Archived Date';
            DataClassification = CustomerContent;
        }


    }

}