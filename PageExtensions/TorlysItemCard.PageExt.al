pageextension 50002 TorlysItemCard extends "Item Card"
{
    layout
    {
        addafter("Item")
        {
            group("Attributes")
            {

                field("Compare Unit of Measure"; Rec."Compare Unit of Measure")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Compare Unit of Measure';
                    ToolTip = 'Specifies the base unit of measure that the item is sold as. For example, a moulding would be "Each" as they are sold by piece. A floor would be set to SqFt as it is sold by the coverage quantity.';

                }
                field("New Item"; Rec."New Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'New Item';
                    ToolTip = 'Specifies if this item is a new item for selling purposes.';

                }

                field("Current Item"; Rec."Current Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Current Item';
                    ToolTip = 'Specifies if this item is currently being stocked for selling purposes.';

                }

                field("Special Item"; Rec."Special Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Special Item';
                    ToolTip = 'Specifies if this item is a special item and only stocked for specified purposes. Please refer to the notes section for details.';

                }

                field("Clearance Item"; Rec."Clearance Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Clearance Item';
                    ToolTip = 'Specifies if this item is no longer being actively replenished and no longer marketed but the stock level is above 10,000 Sq. Ft.';

                }

                field("Discontinued"; Rec.Discontinued)
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Discontinued';
                    ToolTip = 'Specifies if this item is no longer being replenished and no longer actively marketed.';
                }

                field("Discontined Date"; Rec."Discontinued Date")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Discontinued Date';
                    ToolTip = 'Specifies the date when this item was discontinued.';
                }
            }

            group("Stock Levels")
            {
                field("Current Quantity"; QuantityOfItem(Rec))
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Qty. On Sales Orders';
                    ToolTip = 'Quantity on Sales Orders';
                }

                field("Net Available"; QuantityAvailable(Rec))
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Net Available';
                    ToolTip = 'Net amount available after satisfying all current Sales Orders';
                }
            }
        }

    }

    procedure QuantityOfItem(Item: Record Item): Decimal
    begin
        exit(Item."Qty. on Sales Order")
    end;

    procedure QuantityAvailable(Item: Record Item): Decimal
    begin
        exit(Item."Qty. on Purch. Order" - Item."Qty. on Sales Order")
    end;
}

