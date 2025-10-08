tableextension 50013 TorlysSalespersonsPurchasers extends "Salesperson/Purchaser"
{
    fields
    {
        field(50001; "Email"; Text[100])
        {
            Caption = 'Email';
            DataClassification = CustomerContent;
        }

        field(50002; "Manager"; Code[20])
        {
            Caption = 'Manager';
            DataClassification = CustomerContent;
        }

        field(50003; "View Margin - Intranet"; Boolean)
        {
            Caption = 'Intranet - View Margin';
            DataClassification = CustomerContent;
        }

        field(50004; "View Mgr Pricing - Intranet"; Boolean)
        {
            Caption = 'Intranet - View Manager Pricing';
            DataClassification = CustomerContent;
        }

        field(50005; "Order Shipping Location"; Code[10])
        {
            Caption = 'Order Shipping Location';
            DataClassification = CustomerContent;
        }
        field(50006; "Commission Guarantee Monthly"; Decimal)
        {
            Caption = 'Commission Guarantee Monthly';
            DataClassification = CustomerContent;
        }
        field(50007; "Commission Percentage Share"; Decimal)
        {
            Caption = 'Commission Percentage Share';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(Key4; "Code", "Name")
        {
        }

    }
}