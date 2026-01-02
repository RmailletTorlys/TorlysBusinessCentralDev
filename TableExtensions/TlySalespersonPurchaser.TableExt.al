<<<<<<< HEAD:TableExtensions/TlySalespersonPurchaser.TableExt.al
tableextension 50013 TlySalespersonPurchaser extends "Salesperson/Purchaser"
=======
tableextension 50013 TorlysSalespersonsPurchaser extends "Salesperson/Purchaser"
>>>>>>> 5d97453bc243d6e4cb3019687424c0f4e6bb89a7:TableExtensions/TorlysSalespersonsPurchaser.TableExt.al
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