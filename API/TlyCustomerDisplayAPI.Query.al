Query 56017 TlyCustomerDisplayAPI
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'customerDisplay';
    EntitySetName = 'customerDisplays';
    DataAccessIntent = ReadWrite;

    elements
    {
        dataitem(customerDisplay; TlyCustomerDisplays)
        {
            column(customerNo; "Customer No.") { }
            column(shipToCode; "Ship-to Code") { }
            column(name; "Name") { }
            column(name2; "Name 2") { }
            column(address; "Address") { }
            column(address2; "Address 2") { }
            column(city; "City") { }
            column(county; "County") { }
            column(countryRegionCode; "Country/Region Code") { }
            column(postCode; "Post Code") { }
            column(club; "Club") { }
            column(powerUpLevel; "Power Up Level") { }
            column(displayType; "Display Type") { }
            column(itemCategoryCode; "Item Category Code") { }
            column(itemCategoryDescription; "Item Category Description") { }
            column(comments; Comments) { }
            column(locationCode; "Location Code") { }
        }
    }
}