pageextension 50002 TorlysItemCard extends "Item Card"
{
    layout
    {
        addafter("Description 2")
        {
            field("Item Category Codee"; Rec."Item Category Code")
            {
                Caption = 'Collection No.';
                ToolTip = 'Specifies the collection that the item belongs to.';
                ApplicationArea = All;
                Visible = true;
                Importance = Standard;

            }
        }
        addafter("Base Unit of Measure")
        {
            field("Compare Unit of Measure"; Rec."Compare Unit of Measure")
            {
                Caption = 'Compare Unit of Measure';
                ToolTip = 'Specifies the unit of measure for rounding in sales and purchase orders.';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;

            }
            field("Created Date"; Rec."SystemCreatedAt")
            {
                Caption = 'Created Date';
                ToolTip = 'Specifies the date the item was created.';
                ApplicationArea = All;
                Visible = true;
                Importance = Additional;

            }

        }
        addafter("Item")
        {

            group("Attributes")
            {
                Caption = 'Attributes';
                Visible = IsInventoriable;

                field("New Item"; Rec."New Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'New Item';
                    ToolTip = 'Specifies if this item is a new item for selling purposes.';
                    Importance = Standard;

                }

                field("Current Item"; Rec."Current Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Current Item';
                    ToolTip = 'Specifies if this item is currently being stocked for selling purposes.';
                    Importance = Standard;

                }
                field("Discontinued"; Rec."Discontinued Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Discontinued';
                    ToolTip = 'Specifies if this item is no longer being replenished and no longer actively marketed.';
                    Importance = Standard;
                }

                field("Discontined Date"; Rec."Discontinued Date")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Discontinued Date';
                    ToolTip = 'Specifies the date when this item was discontinued.';
                    Importance = Additional;
                }
                field("Special Item"; Rec."Special Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Special Item';
                    ToolTip = 'Specifies if this item is a special item and only stocked for specified purposes. Please refer to the notes section for details.';
                    Importance = Additional;

                }

                field("Clearance Item"; Rec."Clearance Item")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Clearance Item';
                    ToolTip = 'Specifies if this item is no longer being actively replenished and no longer marketed but the stock level is above 10,000 Sq. Ft.';
                    Importance = Additional;

                }
                field("Automatic Ext. Textss"; Rec."Automatic Ext. Texts")
                {
                    ApplicationArea = All;
                    Visible = true;
                    Caption = 'Auto Extended Text';
                    ToolTip = 'Specifies that an extended text that you have set up will be added automatically on sales or purchase documents for this item.';
                    Importance = Additional;
                }
                field("Sales Blockedd"; Rec."Sales Blocked")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the item cannot be entered on sales documents, except return orders and credit memos, and journals.';
                    Importance = Additional;
                }
                field("Purchasing Blockedd"; Rec."Purchasing Blocked")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the item cannot be entered on purchase documents, except return orders and credit memos, and journals.';
                    Importance = Additional;
                }
                field(Blockedd; Rec.Blocked)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example an item that is placed in quarantine.';
                    Importance = Additional;
                }
            }

        }
        //"Item" group - start
        modify("Description 2")
        {
            Visible = true;
        }
        modify("Type")
        {
            Visible = false;
        }
        modify("GTIN")
        {
            Visible = false;
        }
        modify("Common Item No.")
        {
            Visible = false;
        }
        modify("Automatic Ext. Texts")
        {
            Visible = false;
        }
        modify("Blocked")
        {
            Visible = false;
        }
        modify(VariantMandatoryDefaultYes)
        {
            Visible = false;
        }
        modify(VariantMandatoryDefaultNo)
        {
            Visible = false;
        }
        modify("item Category Code")
        {
            Visible = false;
        }
        modify("Purchasing Code")
        {
            Visible = false;
        }
        //"Item" group - end

        //"Inventory" group - start
        modify("Shelf No.")
        {
            Visible = false;
        }
        modify("Created From Nonstock Item")
        {
            Visible = false;
        }
        modify("Search Description")
        {
            Visible = false;
        }
        modify("Qty. on Assembly Order")
        {
            Visible = false;
        }
        modify("Qty. on Asm. Component")
        {
            Visible = false;
        }
        modify("Unit Volume")
        {
            Visible = false;
        }
        modify("Over-Receipt Code")
        {
            Visible = false;
        }
        //"Inventory" group - end
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


//On Page section, when clicking Show More...how to order lines when Show More or Show less
//On Page section, how can I customize the previews tabs when collapsed?



//Item Card

//Preview Tab -> Stock Levels TOR and CAL
//Those tabs are called PROMOTED