pageextension 51643 TlyNTNWebRelatedItems extends "NTN Web Related Items"
{
    layout
    {
        addbefore(Type)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'No.';
                ToolTip = 'No.';
                Editable = false;
            }
        }

        addafter(Type)
        {
            field("Rank"; Rec."Rank")
            {
                ApplicationArea = All;
                Caption = 'Rank';
                ToolTip = 'Rank';
                Editable = true;
            }
            field("Sell Order Rank"; Rec."Sell Order Rank")
            {
                ApplicationArea = All;
                Caption = 'Sell Order Rank';
                ToolTip = 'Sell Order Rank';
                Editable = true;
            }
        }

        addafter("Related Item Description")
        {
            field("Inventory - TOR"; Rec."Inventory - TOR")
            {
                ApplicationArea = All;
                Caption = 'Inventory - TOR';
                ToolTip = 'Inventory - TOR';
                Editable = false;
            }
            field("Inventory - CAL"; Rec."Inventory - CAL")
            {
                ApplicationArea = All;
                Caption = 'Inventory - CAL';
                ToolTip = 'Inventory - CAL';
                Editable = false;
            }
            field("Item - In Catalogue"; Rec."Item - In Catalogue")
            {
                ApplicationArea = All;
                Caption = 'Item - In Catalogue';
                ToolTip = 'Item - In Catalogue';
                Editable = false;
            }
            field("Item - Web Enabled"; Rec."Item - Web Enabled")
            {
                ApplicationArea = All;
                Caption = 'Item - Web Enabled';
                ToolTip = 'Item - Web Enabled';
                Editable = false;
            }
            field("Related - In Catalogue"; Rec."Related - In Catalogue")
            {
                ApplicationArea = All;
                Caption = 'Related - In Catalogue';
                ToolTip = 'Related - In Catalogue';
                Editable = false;
            }
            field("Related - Web Enabled"; Rec."Related - Web Enabled")
            {
                ApplicationArea = All;
                Caption = 'Related - Web Enabled';
                ToolTip = 'Related - Web Enabled';
                Editable = false;
            }
        }

        modify("Prediction Override")
        {
            Visible = false;
        }

        modify("Prediction Exclusion")
        {
            Visible = false;
        }
    }

    actions
    {
        addlast(Category_Process)
        {
            actionref("Update Item Description"; UpdateItemDescription)
            { }
        }

        addlast(Processing)
        {
            action(UpdateItemDescription)
            {
                Caption = 'Update Item Description';
                ToolTip = 'Update Item Description';
                ApplicationArea = All;
                Image = CopyItem;
                trigger OnAction()
                var
                    RelatedItems: Record "NTN Related Item";
                    Item: Record Item;
                begin
                    CurrPage.SetSelectionFilter(RelatedItems);
                    if RelatedItems.FindSet() then begin
                        repeat
                            if Item.Get(Rec."Related Item No.") then begin
                                RelatedItems."Related Item Description" := Item.Description;
                                RelatedItems.Modify(true);
                            end;
                        until RelatedItems.Next() = 0;
                    end;
                    CurrPage.Update(true);
                end;
            }
        }
    }
}