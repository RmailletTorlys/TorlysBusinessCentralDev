pageextension 57015 TlySalesPriceLists extends "Sales Price Lists"
{
    layout
    {
        addafter(Description)
        {
            field("Price List Type"; Rec."Price List Type")
            {
                Caption = 'Price List Type';
                ApplicationArea = All;
            }
        }

        addbefore("Starting Date")
        {
            field("National PM"; Rec."National Property Management")
            {
                Caption = 'National PM';
                ApplicationArea = All;
            }
            field("National PM Brand"; Rec."National PM Brand")
            {
                Caption = 'National PM Brand';
                ApplicationArea = All;
            }
        }
    }
    views
    {
        addlast
        {
            view(Tier)
            {
                Caption = 'Tier - non QC/US';
                // Filters = where("Code" = filter('TIER*&<>*QC&<>*US'));
                Filters = where("Price List Type" = filter('Tier'));
            }
            view(TierQC)
            {
                Caption = 'Tier - QC';
                // Filters = where("Code" = filter('TIER*&*QC'));
                Filters = where("Price List Type" = filter('Tier QC'));
            }
            view(TierUS)
            {
                Caption = 'Tier - US';
                // Filters = where("Code" = filter('TIER*&*US'));
                Filters = where("Price List Type" = filter('Tier US'));
            }

            view(Insurance)
            {
                Caption = 'Insurance';
                // Filters = where("Code" = filter('INSURANCE*'));
                Filters = where("Price List Type" = filter('Insurance'));
            }
            view(BuyingGroup)
            {
                Caption = 'Buying Group';
                // Filters = where("Code" = filter('ROOM*'));
                Filters = where("Price List Type" = filter('Buying Group'));
            }
            view(NationalPromo)
            {
                Caption = 'National Promo';
                // Filters = where("Source Type" = filter('All Customers'), "Code" = filter('<>TIER*&<>CLEARANCE&<>INSURANCE*&<>ROOM*&<>CLEARANCE'));
                Filters = where("Price List Type" = filter('National Promo'));
            }
            view(Customer)
            {
                Caption = 'Customer';
                // Filters = where("Source Type" = filter('Customer'));
                Filters = where("Price List Type" = filter('Customer'));
            }
            view(Project)
            {
                Caption = 'Project';
                // Filters = where("Code" = filter('PRJ*'));
                Filters = where("Price List Type" = filter('Project'));
            }
            view(NoType)
            {
                Caption = 'No Type';
                // Filters = where("Code" = filter('PRJ*'));
                Filters = where("Price List Type" = filter(" "));
            }
            view(Clearance)
            {
                Caption = 'Clearance';
                Filters = where("Code" = filter('CLEARANCE'));
            }
            view(NotActive)
            {
                Caption = 'Not Active';
                Filters = where("Status" = filter('<>Active'));
            }
        }
    }
}