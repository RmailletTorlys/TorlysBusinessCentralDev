page 50563 TlyBackOrderFill
{
    Caption = 'Backorder Fill';
    PageType = List;
    SourceTable = "Sales Line";
    SourceTableView = sorting("No.", "Location Code", "Shipment Date") order(ascending);
    ApplicationArea = Basic, Suite;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Order No.';
                    ToolTip = 'Order No.';
                    Editable = false;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description';
                    Editable = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'Document No.';
                    ToolTip = 'Document No.';
                    Editable = false;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Sell-to Customer No.';
                    ToolTip = 'Sell-to Customer No.';
                    Editable = false;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                    Caption = 'Sell-to Customer Name';
                    ToolTip = 'Sell-to Customer Name';
                    Editable = false;
                }
                field(ShortcutDimCode3; ShortcutDimCode[3])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Caption = 'Location Code';
                    ToolTip = 'Location Code';
                    Editable = false;
                }
                field("Tag Name"; TagName)
                {
                    ApplicationArea = All;
                    Caption = 'Tag Name';
                    ToolTip = 'Tag Name';
                    Editable = false;
                }
                field("Order Date"; OrderDate)
                {
                    ApplicationArea = All;
                    Caption = 'Order Date';
                    ToolTip = 'Order Date';
                    Editable = false;
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Date';
                    ToolTip = 'Shipment Date';
                    Editable = false;
                }
                field("Shipping Instructions"; ShippingInstructions)
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Instructions';
                    ToolTip = 'Shipping Instructions';
                    Editable = false;
                }
                field("Pick Slip Printed Date"; PickSlipPrintedDate)
                {
                    ApplicationArea = All;
                    Caption = 'Pick Slip Printed Date';
                    ToolTip = 'Pick Slip Printed Date';
                    Editable = false;
                }
                field("Transfer Order No."; Rec."Transfer Order No.")
                {
                    ApplicationArea = All;
                    Caption = 'Transfer Order No.';
                    ToolTip = 'Transfer Order No.';
                    Editable = false;
                }
                field("Linked Transfer Order No."; Rec."Linked Transfer Order No.")
                {
                    ApplicationArea = All;
                    Caption = 'Linked Transfer Order No.';
                    ToolTip = 'Linked Transfer Order No.';
                    Editable = false;
                }
                field("Linked Purchase Order No."; Rec."Linked Purchase Order No.")
                {
                    ApplicationArea = All;
                    Caption = 'Linked Purchase Order No.';
                    ToolTip = 'Linked Purchase Order No.';
                    Editable = false;
                }
                field("Container No. (NAV)"; Rec."Container No. (NAV)")
                {
                    ApplicationArea = All;
                    Caption = 'Container No. (NAV)';
                    ToolTip = 'Container No. (NAV)';
                    Editable = false;
                }
                field("Quantity"; Rec."Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Quantity';
                    ToolTip = 'Quantity';
                    Editable = false;
                    StyleExpr = StyleExprTxt;
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Outstanding Quantity';
                    ToolTip = 'Outstanding Quantity';
                    Editable = false;
                    StyleExpr = StyleExprTxt;
                }
                // field("Quantity Case"; Rec."Quantity Case")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Quantity Case';
                //     ToolTip = 'Quantity Case';
                //     Editable = false;
                // }
                // field("Quantity Pallet"; Rec."Quantity Pallet")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Quantity Pallet';
                //     ToolTip = 'Quantity Pallet';
                //     Editable = false;
                // }
                field("Qty. to Ship"; Rec."Qty. to Ship")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. to Ship';
                    ToolTip = 'Qty. to Ship';
                    Editable = true;
                    StyleExpr = StyleExprTxt;
                }
                // field("Qty. to Ship Case"; Rec."Qty. to Ship Case")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Qty. to Ship Case';
                //     ToolTip = 'Qty. to Ship Case';
                //     Editable = false;
                // }
                // field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Qty. to Ship Pallet';
                //     ToolTip = 'Qty. to Ship Pallet';
                //     Editable = false;
                // }

            }
        }
    }

    actions
    {
        area(Promoted)
        {
            // actionref("Select All Record"; SelectAllRecords)
            // { }
            actionref("Populate Qty. to Ship"; PopulateQtyToShip)
            { }
        }

        area(Processing)
        {
            group(MainGroup)
            {
                Caption = 'Print';
                Image = Print;
                // action(SelectAllRecords)
                // {
                //     ApplicationArea = Warehouse;
                //     Caption = 'Select All Record';
                //     ToolTip = 'Select All Record';
                //     Image = SelectMore;
                //     trigger OnAction()
                //     var
                //     // SelectedSalesLine: Record "Sales Line";
                //     begin
                //         // CurrPage.SetSelectionFilter(SelectedSalesLine);
                //         // if SelectedSalesLine.FindSet() then
                //         //     repeat
                //         //         SelectedSalesLine."Qty. to Ship" := SelectedSalesLine.Quantity;
                //         //         SelectedSalesLine.Modify(true);
                //         //     until SelectedSalesLine.Next() = 0;
                //     end;
            }
            action(PopulateQtyToShip)
            {
                ApplicationArea = Warehouse;
                Caption = 'Populate Qty. to Ship';
                ToolTip = 'Populate all ticked lines with Qty. to Ship';
                Image = ShipmentLines;
                trigger OnAction()
                var
                    SelectedSalesLine: Record "Sales Line";
                begin
                    CurrPage.SetSelectionFilter(SelectedSalesLine);
                    if SelectedSalesLine.FindSet() then
                        repeat
                            SelectedSalesLine.Validate(SelectedSalesLine."Qty. to Ship", SelectedSalesLine.Quantity);
                            SelectedSalesLine.Modify(true);
                        until SelectedSalesLine.Next() = 0;
                end;
            }
        }
    }

    var
        ShortcutDimCode: array[8] of Code[20];
        StyleExprTxt: Text;
        SalesHeader: Record "Sales Header";
        TagName: Text[30];
        OrderDate: Date;
        ShippingInstructions: Text[20];
        PickSlipPrintedDate: Date;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);

        SalesHeader.Get(Rec."Document Type", Rec."Document No.");
        TagName := SalesHeader."Tag Name";
        OrderDate := SalesHeader."Order Date";
        ShippingInstructions := SalesHeader."Shipping Instructions";
        PickSlipPrintedDate := SalesHeader."Pick Slip Printed Date";

        if Rec."Qty. to Ship" <> Rec.Quantity then
            StyleExprTxt := 'Unfavorable'
        else
            StyleExprTxt := '';
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Qty. to Ship" <> Rec.Quantity then
            StyleExprTxt := 'Unfavorable'
        else
            StyleExprTxt := '';
    end;

}