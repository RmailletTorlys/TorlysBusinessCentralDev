page 56003 "Sales Price Code API"
{
    PageType = API;
    Caption = 'Sales Price Codes';
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesPriceCode';
    EntitySetName = 'salesPriceCodes';
    SourceTable = TlySalesPriceCode;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(code; Rec.Code)
                {
                    Caption = 'Program Code';
                }

                field(description; Rec."Description")
                {
                    Caption = 'Description';
                }

            }
        }
    }

}