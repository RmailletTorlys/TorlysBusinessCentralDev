Query 56012 TlyCustomersAPI
{
    QueryType = API;
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'customer';
    EntitySetName = 'customers';
    DataAccessIntent = ReadOnly;

    elements
    {
        dataitem(customer; "Customer")
        {
            column(number; "No.") { }
            column(displayName; Name) { }
            column(addressLine1; "Address") { }
            column(addressLine2; "Address 2") { }
            column(city; City) { }
            column(state; "County") { }
            column(country; "Country/Region Code") { }
            column(postalCode; "Post Code") { }
            column(phoneNumber; "Phone No.") { }
            column(email; "E-Mail") { }
            column(website; "Home Page") { }
            column(salespersonCode; "Salesperson Code") { }
            column(balanceDue; "Balance Due") { }
            column(creditLimit; "Credit Limit (LCY)") { }
            column(taxLiable; "Tax Liable") { }
            column(currencyCode; "Currency Code") { }
            column(blocked; "Blocked") { }
            column(defaultPriceList; "Default Price List Code") { }


        }
    }
}