pageextension 59305 TorlysSalesOrderList extends "Sales Order List"
{
    layout
    {
        moveafter("No."; "Sell-to Customer No.", "Ship-to Code", "Sell-to Customer Name")

        addafter("Sell-to Customer Name")
        {
            field("Ship-to Address"; Rec."Ship-to Address")
            {
                Caption = 'Ship-to Address';
                ToolTip = 'Ship-to Address';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Ship-to City"; Rec."Ship-to City")
            {
                Caption = 'Ship-to City';
                ToolTip = 'Ship-to City';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }

        }

        moveafter("Ship-to City"; "Shortcut Dimension 1 Code")

        addafter("Shortcut Dimension 1 Code")
        {

            field(ShortcutDimCode3; ShortcutDimCode[3])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,3';
                ToolTip = 'Global Dimension 3 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimension(3);
                end;
            }
        }

        addafter(Status)
        {
            field("On Hold"; Rec."On Hold")
            {
                Caption = 'On Hold';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
                ToolTip = 'Display if an order is currently on Credit Hold';

            }
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
        }


    }

    actions
    {
        addbefore(Category_New)
        {
            group("Credit Hold")
            {
                Visible = true;
                Caption = 'Credit Hold';

                actionref("Remove from Hold"; "Remove Credit Hold")
                {
                }

                actionref("Add to Hold"; "Place Credit Hold")
                {
                }
            }
        }
        addfirst("F&unctions")
        {
            action("Remove Credit Hold")
            {
                ToolTip = 'Removes the Credit hold on an Order.';
                Caption = 'Remove Credit Hold';
                Image = Report;
                ApplicationArea = All;


                trigger OnAction()
                var
                    SelectedOrders: Record "Sales Header";
                begin
                    CurrPage.SetSelectionFilter(SelectedOrders);

                    if SelectedOrders.FindSet() then
                        repeat
                            SelectedOrders."On Hold" := '';
                            SelectedOrders.Modify(true);
                        until SelectedOrders.Next() = 0;

                    Message('Removed Order(s) from Credit Hold');
                end;
            }

            action("Place Credit Hold")
            {
                ToolTip = 'Places selected Order(s) on Credit Hold.';
                Caption = 'Place Credit Hold';
                Image = Report;
                ApplicationArea = All;


                trigger OnAction()
                var
                    SelectedOrders: Record "Sales Header";
                begin
                    CurrPage.SetSelectionFilter(SelectedOrders);

                    if SelectedOrders.FindSet() then
                        repeat
                            SelectedOrders."On Hold" := 'CR';
                            SelectedOrders.Modify(true);
                        until SelectedOrders.Next() = 0;

                    Message('Placed Order(s) on Credit Hold');
                end;
            }
        }
    }




    protected var
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;



    local procedure ValidateShortcutDimension(DimIndex: Integer)
    var
    begin
        Rec.ValidateShortcutDimCode(DimIndex, ShortcutDimCode[DimIndex]);
    end;
}