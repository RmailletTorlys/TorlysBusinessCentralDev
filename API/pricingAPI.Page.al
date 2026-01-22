page 56000 "Pricing API"
{
    PageType = API;
    Caption = 'Pricing';
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'prices';
    EntitySetName = 'priceLists';
    SourceTable = "Price List Line";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }

                field(code; Rec."Price List Code")
                {
                    Caption = 'Price List Code';
                }

                field(customerno; Rec."Assign-to No.")
                {
                    Caption = 'Assign-to No.';
                }

                field(producttype; Rec."Asset Type")
                {
                    Caption = 'Source Type';
                }

                field(productno; Rec."Product No.")
                {
                    Caption = 'Source No.';
                }

                field(unitprice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }

                field(pricestatus; Rec.Status)
                {
                    Caption = 'Price Status';
                }

                field(endDate; Rec."Ending Date")
                {
                    Caption = 'End Date';
                }
            }
        }
    }

}