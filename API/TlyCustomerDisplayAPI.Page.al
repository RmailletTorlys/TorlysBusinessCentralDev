page 56018 "Tly Customer Display API"
{
    PageType = API;
    Caption = 'Customer Display';
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'customerDisplay';
    EntitySetName = 'customerDisplays';
    EntityCaption = 'Customer Display';
    EntitySetCaption = 'Customer Displays';
    SourceTable = TlyCustomerDisplays;
    DelayedInsert = true;
    ODataKeyFields = "Customer No.", "Ship-to Code", "Display Type", "Item Category Code";
    Extensible = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(customerNo; Rec."Customer No.") { Caption = 'Customer No.'; }
                field(shipToCode; Rec."Ship-to Code") { Caption = 'Ship-to Code'; }
                field(displayType; Rec."Display Type") { Caption = 'Display Type'; }
                field(itemCategoryCode; Rec."Item Category Code") { Caption = 'Item Category Code'; }
                field(club; Rec."Club") { Caption = 'Club'; }
                field(powerUpLevel; Rec."Power Up Level") { Caption = 'Power Up Level'; }
                field(comments; Rec.Comments) { Caption = 'Comments'; }
                field(locationCode; Rec."Location Code") { Caption = 'Location Code'; }

                // Lookup / FlowFields from Customer + Ship-to Address — read-only, auto-calculated by the API page
                field(name; Rec."Name") { Caption = 'Name'; Editable = false; }
                field(name2; Rec."Name 2") { Caption = 'Name 2'; Editable = false; }
                field(address; Rec."Address") { Caption = 'Address'; Editable = false; }
                field(address2; Rec."Address 2") { Caption = 'Address 2'; Editable = false; }
                field(city; Rec."City") { Caption = 'City'; Editable = false; }
                field(county; Rec."County") { Caption = 'County'; Editable = false; }
                field(countryRegionCode; Rec."Country/Region Code") { Caption = 'Country/Region Code'; Editable = false; }
                field(postCode; Rec."Post Code") { Caption = 'Post Code'; Editable = false; }
                field(itemCategoryDescription; Rec."Item Category Description") { Caption = 'Item Category Description'; Editable = false; }

                field(id; Rec.SystemId) { Caption = 'Id'; Editable = false; }
                field(lastModifiedDateTime; Rec.SystemModifiedAt) { Caption = 'Last Modified Date'; Editable = false; }
            }
        }
    }
}
