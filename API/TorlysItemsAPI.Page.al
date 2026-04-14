page 56006 "Torlys Items API"
{
    PageType = API;
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0';
    EntityName = 'item';
    EntitySetName = 'items';
    DelayedInsert = true;
    SourceTable = Item;
    Editable = false;
    Caption = 'ItemsApi';

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field(number; Rec."No.") { }
                field(displayName; Rec.Description) { }
                field(itemCategoryCode; Rec."Item Category Code") { }
                field(salesPriceCode; Rec."Sales Price Code") { }
                field(currentItem; Rec."Current Item") { }
                field(sunsetItem; Rec."Sunset Item") { }
                field(discontinuedItem; Rec."Discontinued Item") { }
                field(newItem; Rec."New Item") { }
                field(unitPrice; Rec."Unit Price") { }
                field(replacementCost; Rec."Replacement Cost") { }
                field(clearanceItem; Rec."Clearance Item") { }
                field(onHandTOR; Rec."Qty. on Hand (TOR)") { }
                field(onHandTMT; Rec."Qty. on Hand (TMT)") { }
                field(onHandCAL; Rec."Qty. on Hand (CAL)") { }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        rec.CalcFields("Replacement Cost");
    end;
}