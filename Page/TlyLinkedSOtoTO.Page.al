page 50558 TlyLinkedSOtoTO
{
    Caption = 'View and Fill Linked SO';
    PageType = List;
    SourceTable = "Sales Line";
    SourceTableView = sorting(Type, "No.", "Variant Code", "Drop Shipment", "Location Code", "Document Type", "Shipment Date") order(ascending);
    ApplicationArea = Basic, Suite;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'Document No.';
                    ToolTip = 'Document No.';
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Caption = 'Location Code';
                    ToolTip = 'Location Code';
                    Editable = false;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                    ToolTip = 'Type';
                    Editable = false;
                }
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
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Date';
                    ToolTip = 'Shipment Date';
                    Editable = false;
                }
                field("Pick Slip Printed At"; PickSlipPrintedAt)
                {
                    ApplicationArea = All;
                    Caption = 'Pick Slip Printed At';
                    ToolTip = 'Pick Slip Printed At';
                    Editable = false;
                }

                field("Quantity"; Rec."Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Quantity';
                    ToolTip = 'Quantity';
                    Editable = false;
                    // StyleExpr = StyleExprTxt;
                }

                field("Quantity Case"; Rec."Quantity Case")
                {
                    ApplicationArea = All;
                    Caption = 'Quantity Case';
                    ToolTip = 'Quantity Case';
                    Editable = false;
                }
                field("Quantity Pallet"; Rec."Quantity Pallet")
                {
                    ApplicationArea = All;
                    Caption = 'Quantity Pallet';
                    ToolTip = 'Quantity Pallet';
                    Editable = false;
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Outstanding Quantity';
                    ToolTip = 'Outstanding Quantity';
                    Editable = false;
                    StyleExpr = StyleExprTxt;
                }

                field("Qty. to Ship"; Rec."Qty. to Ship")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. to Ship';
                    ToolTip = 'Qty. to Ship';
                    Editable = true;
                    StyleExpr = StyleExprTxt;
                }

                field("Qty. to Ship Case"; Rec."Qty. to Ship Case")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. to Ship Case';
                    ToolTip = 'Qty. to Ship Case';
                    Editable = false;
                }
                field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. to Ship Pallet';
                    ToolTip = 'Qty. to Ship Pallet';
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
                field("Container No."; Rec."Container No.")
                {
                    ApplicationArea = All;
                    Caption = 'Container No.';
                    ToolTip = 'Container No.';
                    Editable = false;
                }
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
            // action(FilterByTR)
            // {
            //     Caption = 'Filter by Transfer Order #';
            //     ToolTip = 'Filter by Transfer Order #';
            //     ApplicationArea = All;
            //     Image = Filter;
            //     trigger OnAction()
            //     begin
            //         Rec.Reset();
            //         Rec.SetRangeFilter("Temporary Hold", '0');
            //         "Linked Transfer Order No." = field("No."), Type = const(Item), "Outstanding Quantity" = filter(<> 0);
            //     end;
            // }
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
                            SelectedSalesLine.Validate(SelectedSalesLine."Qty. to Ship", SelectedSalesLine."Outstanding Quantity");
                            SelectedSalesLine.Modify(true);
                        until SelectedSalesLine.Next() = 0;
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        if Rec."Qty. to Ship" <> Rec."Outstanding Quantity" then
            StyleExprTxt := 'Unfavorable'
        else
            StyleExprTxt := '';

        SalesHeader.Get(Rec."Document Type", Rec."Document No.");
        TagName := SalesHeader."Tag Name";
        OrderDate := SalesHeader."Order Date";
        ShippingInstructions := SalesHeader."Shipping Instructions";
        PickSlipPrintedAt := SalesHeader."Pick Slip Printed At";
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Qty. to Ship" <> Rec."Outstanding Quantity" then
            StyleExprTxt := 'Unfavorable'
        else
            StyleExprTxt := '';
    end;

    var
        StyleExprTxt: Text;
        SalesHeader: Record "Sales Header";
        TagName: Text[30];
        OrderDate: Date;
        ShippingInstructions: Text[20];
        PickSlipPrintedAt: DateTime;
}