pageextension 57015 TlySalesPriceLists extends "Sales Price Lists"
{
    views
    {
        addlast
        {
            view(TiersAll)
            {
                Caption = 'Tiers - non QC/US';
                Filters = where("Code" = filter('*1|*2|*3|*4|*5|*6'));
            }
            view(TiersQC)
            {
                Caption = 'Tiers - QC';
                Filters = where("Code" = filter('*QC'));
            }
            view(TiersUS)
            {
                Caption = 'Tiers - US';
                Filters = where("Code" = filter('*US'));
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
                Filters = where("Source Type" = filter('All Customers'), "Code" = filter('<>TIER*'));
            }
            view(Customers)
            {
                Caption = 'Customers';
                Filters = where("Source Type" = filter('Customer'));
            }
        }
    }
}