page 56001 "Price List Header API"
{
    PageType = API;
    Caption = 'Pricing';
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'priceListHeaders';
    EntitySetName = 'priceListHeaders';
    SourceTable = "Price List Header";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(code; Rec.Code)
                {
                    Caption = 'Price List Code';
                }

                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }

                field(startDate; Rec."Starting Date")
                {
                    Caption = 'Start Date';
                }

                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                }

                field(appliesTo; Rec."Source Type")
                {
                    Caption = 'Applies To';
                }
            }
        }
    }

}