pageextension 57015 TlySalesPriceLists extends "Sales Price Lists"
{
    views
    {
        addlast
        {
            view(TiersAll)
            {
                Caption = 'Tiers - non QC/US';
                Filters = where("Code" = filter('TIER*&<>*QC&<>*US'));
            }
            view(TiersQC)
            {
                Caption = 'Tiers - QC';
                Filters = where("Code" = filter('TIER*&*QC'));
            }
            view(TiersUS)
            {
                Caption = 'Tiers - US';
                Filters = where("Code" = filter('TIER*&*US'));
            }
            view(Clearance)
            {
                Caption = 'Tiers - US';
                Filters = where("Code" = filter('CLEARANCE'));
            }
            view(Insurance)
            {
                Caption = 'Insurance';
                Filters = where("Code" = filter('INSURANCE*'));
            }
            view(Retail2)
            {
                Caption = 'Retail 2.0';
                Filters = where("Code" = filter('ROOM*'));
            }
            view(Promos)
            {
                Caption = 'Promos';
                Filters = where("Source Type" = filter('All Customers'), "Code" = filter('<>TIER*&<>CLEARANCE&<>INSURANCE*&<>ROOM*&<>CLEARANCE'));
            }
            view(Customers)
            {
                Caption = 'Customers';
                Filters = where("Source Type" = filter('Customer'));
            }
        }
    }
}