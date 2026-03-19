page 56004 "Torlys Items API"
{
    PageType = API;
    Caption = 'Torlys Items';
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'torlysItem';
    EntitySetName = 'torlysItems';
    SourceTable = Item;
    SourceTableView = where("Gen. Prod. Posting Group" = filter('<>MK *'));
    DelayedInsert = true;
    Editable = false;
    DataAccessIntent = ReadOnly;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(number; Rec."No.")
                {
                    Caption = 'Number';
                }
                field(displayName; Rec.Description)
                {
                    Caption = 'Display Name';
                }
                field(displayName2; Rec."Description 2")
                {
                    Caption = 'Display Name 2';
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field(itemCategoryId; Rec."Item Category ID")
                {
                    Caption = 'Item Category ID';
                }
                field(itemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';
                }
                field(gtin; Rec.Gtin)
                {
                    Caption = 'Gtin';
                }
                field(inventory; Rec.Inventory)
                {
                    Caption = 'Inventory';
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(priceIncludesTax; Rec."Price Includes VAT")
                {
                    Caption = 'Price Includes Tax';
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                }
                field(taxGroupId; Rec."Tax Group ID")
                {
                    Caption = 'Tax Group ID';
                }
                field(taxGroupCode; Rec."Tax Group Code")
                {
                    Caption = 'Tax Group Code';
                }
                field(baseUnitOfMeasureId; Rec."Base Unit of Measure")
                {
                    Caption = 'Base Unit Of Measure';
                }
                field(generalProductPostingGroupId; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'General Product Posting Group';
                }
                field(inventoryPostingGroupId; Rec."Inventory Posting Group")
                {
                    Caption = 'Inventory Posting Group';
                }
                field(lastModifiedDateTime; Rec."Last DateTime Modified")
                {
                    Caption = 'Last Modified Date Time';
                }

                field(newItem; Rec."New Item")
                {
                    Caption = 'New Item';

                }

                field(currentItem; Rec."Current Item")
                {
                    Caption = 'Current Item';

                }

                field(discontinuedItem; Rec."Discontinued Item")
                {
                    Caption = 'Discontinued Item';

                }

                field(discontinuedDate; Rec."Discontinued Date")
                {
                    Caption = 'Discontinued Date';

                }

                field(inactiveCurrentItem; Rec."Inactive Current Item")
                {
                    Caption = 'Inactive Current Item';

                }

                field(sunsetItem; Rec."Sunset Item")
                {
                    Caption = 'Sunset Item';

                }

                field(sunsetDate; Rec."Sunset Date")
                {
                    Caption = 'Sunset Date';

                }

                field(inCatalogue; Rec."In Catalogue")
                {
                    Caption = 'In Catalogue';

                }

                field(launchDate; Rec."Launch Date")
                {
                    Caption = 'Launch Date';

                }

                field(salesPriceCode; Rec."Sales Price Code")
                {
                    Caption = 'Sales Price Code';

                }

            }
        }
    }
}