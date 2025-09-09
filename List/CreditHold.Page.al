page 52002 "Credit Hold"
{
    Caption = 'Credit Holds';
    PageType = List;
    InsertAllowed = false;
    DeleteAllowed = false;
    QueryCategory = 'Orders on Credit Hold';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Header";
    SourceTableView = SORTING("No.", "Document Type") ORDER(Ascending)
    WHERE("Document Type" = CONST(Order),
          "Status" = Const(Released),
          "On Hold" = Filter(<> '')
 );



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
                    ToolTip = 'Order Number';
                }

                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Date';
                    ToolTip = 'Shipment Date';
                }

                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Caption = 'Location Code';
                    ToolTip = 'Location Code';
                }

                field("Collector ID"; GetCollectorID(Rec."Bill-to Customer No."))
                {
                    ApplicationArea = All;
                    Caption = 'Collector ID';
                    ToolTip = 'Collector ID';
                }

                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Number';
                    ToolTip = 'Customer Number';
                }

                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                    ToolTip = 'Customer Name';
                }

                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                    Caption = 'Ship-to Code';
                    ToolTip = 'Ship-to Code';
                }

                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Advice';
                    ToolTip = 'Shipping Advice';
                }

                // field("SO Count"; Rec."SO Count")
                // {
                //     ApplicationArea = All;
                //     Caption = 'SO Count';
                //     ToolTip = 'SO Count';
                // }

                // field("Reprint Requested"; Rec."Reprint Required")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Reprint Requested';
                //     ToolTip = 'Reprint Requested';
                // }

                field("Fully Allocated"; isFullyAllocated(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'Fully Allocated';
                    ToolTip = 'Fully Allocated';
                }

                // field("Transfer Order No."; getTransferOrderNo(Rec."No."))
                // {
                //     ApplicationArea = All;
                //     Caption = 'Transfer Order No.';
                //     ToolTip = 'Transfer Order No.';
                // }

                field("To Ship Qty."; SumSalesLines(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'To Ship Qty.';
                    ToolTip = 'To Ship Quantity';
                }

                field("To Ship Weight"; getOrderWeight(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'To Ship Weight';
                    ToolTip = 'To Ship Weight';
                }

                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Agent Code';
                    ToolTip = 'Shipping Agent Code';
                }

                field("Ship-to Country/Region"; Rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = All;
                    Caption = 'Ship-to Country/Region';
                    ToolTip = 'Ship-to Country/Region';
                }

                field("On Hold"; Rec."On Hold")
                {
                    ApplicationArea = All;
                    Caption = 'On Hold';
                    ToolTip = 'On Hold';
                }

                field("Pick Slip Printed By"; Rec."Pick Slip Printed By")
                {
                    ApplicationArea = All;
                    Caption = 'Pick Slip Printed By';
                    ToolTip = 'Pick Slip Printed By';
                }

                field("Pick Sli Printed Date"; Rec."Pick Slip Printed Date")
                {
                    ApplicationArea = All;
                    Caption = 'Pick Slip Printed Date';
                    ToolTip = 'Pick Slip Printed Date';
                }

                field("Pick Slip Printed Time"; Rec."Pick Slip Printed Time")
                {
                    ApplicationArea = All;
                    Caption = 'Pick Slip Printed Time';
                    ToolTip = 'Pick Slip Printed Time';
                }

                field("No. Pick Lists Printed"; Rec."No. Pick Lists Printed")
                {
                    ApplicationArea = All;
                    Caption = 'No. Pick Lists Printed';
                    ToolTip = 'No. Pick Lists Printed';
                }

                field("Whse Associate Picked By"; Rec."Warehouse Associate Picked By")
                {
                    ApplicationArea = All;
                    Caption = 'Whse Associate Picked By';
                    ToolTip = 'Whse Associate Picked By';
                }

                field("Whse Associate Checked By"; Rec."Warehouse Associate Checked By")
                {
                    ApplicationArea = All;
                    Caption = 'Whse Associate Checked By';
                    ToolTip = 'Whse Associate Checked By';

                }

                field("Last Modified By"; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    Caption = 'Last Modified By';
                    ToolTip = 'Last Modified By';

                }

                field("Last Modified Date"; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    Caption = 'Last Modified Date';
                    ToolTip = 'Last Modified Date';
                }

                field("Shipment No."; Rec."Shipping No.")
                {
                    ApplicationArea = All;
                    Caption = 'Shipment No.';
                    ToolTip = 'Shipment No.';
                }

                field("Shipment Weight"; GetShipmentWeight(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Weight';
                    ToolTip = 'Shipment Weight';
                }

                // field("BOL No."; Rec."BOL No.")
                // {
                //     ApplicationArea = All;
                //     Caption = 'BOL No.';
                //     ToolTip = 'BOL No.';
                // }

                // field("BOL Processed Date"; Rec."BOL Processed Date")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Processed Date';
                //     ToolTip = 'Processed Date';
                // }

                field("No. of Skids"; GetNoOfSkids(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'No. of Skids';
                    ToolTip = 'No. of Skids';
                }

                field("No. of Packages"; GetNoOfCases(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'No. of Packages';
                    ToolTip = 'No. of Packages';
                }

            }
        }
    }


    actions
    {
        area(Navigation)
        {
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("Pick Instruction")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Pick Instruction';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Print a picking list that shows which items to pick and ship for the sales order. If an item is assembled to order, then the report includes rows for the assembly components that must be picked. Use this report as a pick instruction to employees in charge of picking sales items or assembly components for the sales order.';

                    trigger OnAction()
                    var
                        SelectedSalesHeader: Record "Sales Header";

                    begin
                        CurrPage.SetSelectionFilter(SelectedSalesHeader);

                        if SelectedSalesHeader.FindSet() then
                            repeat
                                DocPrint.PrintSalesOrder(SelectedSalesHeader, Usage::"Pick Instruction");
                            until SelectedSalesHeader.Next() = 0
                        else
                            DocPrint.PrintSalesOrder(Rec, Usage::"Pick Instruction");
                    end;
                }
            }

            group(Process)
            {
                Caption = 'Process';
                Image = Process;
                action("Release Credit Hold")
                {
                    ApplicationArea = All;
                    Caption = 'Release Credit Hold';
                    Image = Process;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Release the credit hold on the selected order.';

                    trigger OnAction()
                    var
                        SelectedSalesHeader: Record "Sales Header";
                    begin
                        CurrPage.SetSelectionFilter(SelectedSalesHeader);

                        if SelectedSalesHeader.FindSet() then
                            repeat
                                SelectedSalesHeader."On Hold" := '';
                                SelectedSalesHeader.Modify();
                            until SelectedSalesHeader.Next() = 0
                        else begin
                            Rec."On Hold" := '';
                            Rec.Modify();
                        end;
                        Message('Credit Hold Released');
                    end;
                }
            }
            group(Views)
            {
                Caption = 'Views';
                Image = View;

                action("PicupOnly")
                {
                    Caption = 'Show only Pickup Shipments';
                    ToolTip = 'Filters the list to show only pickup shipments.';
                    ApplicationArea = All;
                    Image = Filter;

                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetRange("Document Type", Rec."Document Type"::Order);
                        Rec.SetRange("Status", Rec.Status::Released);
                        Rec.SetFilter("On Hold", '<>%1', '');
                        Rec.SetRange("Shipment Method Code", 'PICKUP');
                        Message('Filter applied for Shipment Method Code: %1', 'PICKUP');
                    end;
                }

                action("OnlyShipments")
                {
                    Caption = 'Show only Shipments';
                    ToolTip = 'Filters the list to show only shipments.';
                    ApplicationArea = All;
                    Image = Filter;

                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetRange("Document Type", Rec."Document Type"::Order);
                        Rec.SetRange("Status", Rec.Status::Released);
                        Rec.SetFilter("On Hold", '<>%1', '');
                        Rec.SetRange("Shipment Method Code", '<>%1', 'PICKUP');
                        Message('Filter applied for Shipment Method Code: %1', 'SHIPMENT');
                    end;

                }
                action("TomorrowOnly")
                {
                    Caption = 'Show Shipments for Tomorrow';
                    ToolTip = 'Filters the list to show sales orders with a shipment date of tomorrow.';
                    ApplicationArea = All;
                    Image = Filter;

                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetRange("Document Type", Rec."Document Type"::Order);
                        Rec.SetRange("Status", Rec.Status::Released);
                        Rec.SetFilter("On Hold", '<>%1', '');
                        Rec.SetRange("Shipment Date", CalcDate('<+1D>', WorkDate()));
                        Message('Filter applied for Shipment Date: %1', CalcDate('<+1D>', WorkDate()));
                    end;
                }

                action("TomorrowRockCity")
                {
                    Caption = 'Show Shipments for Tomorrow in Rock City';
                    ToolTip = 'Filter the list to show sales orders with a shipment date of tomorrow and use ROCKCITY.';
                    ApplicationArea = All;
                    Image = Filter;

                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetRange("Document Type", Rec."Document Type"::Order);
                        Rec.SetRange("Status", Rec.Status::Released);
                        Rec.SetFilter("On Hold", '<>%1', '');
                        Rec.SetRange("Shipment Date", CalcDate('<+1D>', WorkDate()));
                        Rec.SetRange("Shipment Method Code", 'ROCKCITY');

                        Message('Filter appled for Shipment Date: %1, and Shipment Method Code: %2', CalcDate('<+1D>', WorkDate()), 'ROCKCITY');
                    end;
                }

                action("NotShippedOnly")
                {
                    Caption = 'Show Shipments that have not yet been shipped';
                    ToolTip = 'Filters the list to show shipments that have not yet been shipped.';
                    ApplicationArea = All;
                    Image = Filter;

                    trigger OnAction()
                    var
                        SalesHeader: Record "Sales Header";
                        SalesLine: Record "Sales Line";
                        OrdersToExclude: List of [Code[20]];
                        OrderNo: Code[20];
                        FilterText: Text;
                    begin
                        if SalesHeader.findSet() then
                            repeat
                                SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                                SalesLine.SetRange("Document No.", SalesHeader."No.");
                                SalesLine.CalcSums(Quantity);
                                if SalesLine.Quantity < 1 then
                                    OrdersToExclude.Add(SalesHeader."No.");
                            until SalesHeader.Next() = 0;

                        if OrdersToExclude.Count > 0 then begin
                            foreach OrderNo in OrdersToExclude do
                                if FilterText <> '' then
                                    FilterText += '&';
                            FilterText += '<>' + OrderNo;
                        end;
                        Rec.Reset();
                        Rec.SetRange("Document Type", Rec."Document Type"::Order);
                        Rec.SetRange("Status", Rec.Status::Released);
                        Rec.SetFilter("On Hold", '<>%1', '');
                        Rec.SetFilter("No.", FilterText);
                        Message('Filter applied for only Orders to be Shipped');
                    end;
                }
                action("PickNotPrinted")
                {
                    Caption = 'Orders where the Pickslip was not printed.';
                    ToolTip = 'Orders where the Pickslip was not printed.';
                    ApplicationArea = All;
                    Image = Filter;

                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetRange("Document Type", Rec."Document Type"::Order);
                        Rec.SetRange("Status", Rec.Status::Released);
                        Rec.SetFilter("On Hold", '<>%1', '');
                        Rec.SetFilter("No. Pick Lists Printed", '=0');
                        Message('Filter applied for Orders where the Pickslip was not printed.');
                    end;
                }

                action("PickPrintedButNotPosted")
                {
                    Caption = 'Orders where the Pickslip was printed but not posted.';
                    ToolTip = 'Orders where the Pickslip was printed';
                    ApplicationArea = All;
                    Image = Filter;

                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetRange("Document Type", Rec."Document Type"::Order);
                        Rec.SetRange("Status", Rec.Status::Released);
                        Rec.SetFilter("On Hold", '<>%1', '');
                        Rec.SetFilter("No. Pick Lists Printed", '<>0');
                        Rec.SetFilter("Posting Date", '');
                        Message('Filter applied for Orders where the Pickslip was printed but not posted.');
                    end;
                }

                action("PrintedNotAssigned")
                {
                    Caption = 'Orders where the Pickslip was printed but not Assigned.';
                    ToolTip = 'Orders where the Pickslip was printed but not Assigned.';
                    ApplicationArea = All;
                    Image = Filter;

                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetRange("Document Type", Rec."Document Type"::Order);
                        Rec.SetRange("Status", Rec.Status::Released);
                        Rec.SetFilter("On Hold", '<>%1', '');
                        Rec.SetFilter("No. Pick Lists Printed", '<>0');
                        Rec.SetFilter("Warehouse Associate Picked By", '');
                        Message('Filter applied for Orders where the PickSlip was printed but not yet assigned.')
                    end;
                }

                action("AssignedNotPosted")
                {
                    Caption = 'Orders Assigned to A Warehouse associate but not yet posted';
                    ToolTip = 'Orders Assigned to A Warehouse associate but not yet posted';
                    ApplicationArea = All;
                    Image = Filter;

                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetRange("Document Type", Rec."Document Type"::Order);
                        Rec.SetRange("Status", Rec.Status::Released);
                        Rec.SetFilter("On Hold", '<>%1', '');
                        Rec.SetFilter("Warehouse Associate Picked By", '<>%1', '');
                        Rec.SetFilter("Posting Date", '');
                        Message('Filter applied for Orders Assigned to A Warehouse associate but not yet posted.')
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter("Shipment Date", '%1', WorkDate());
    end;

    local procedure GetCollectorID(CustomerNo: Code[20]) returnVar: Code[20]
    var
        CustomerRec: Record Customer;
        CollectorId: Code[20];
        IsHandled: Boolean;

    begin
        OnBeforeGetCollectorID(CustomerNo, returnVar, IsHandled);
        if IsHandled then
            exit;

        if (CustomerRec.Get(CustomerNo)) then
            CollectorId := CustomerRec."Collector ID"
        else
            CollectorId := '';

        OnAfterGetCollectorID(CustomerNo, returnVar);

        exit(CollectorId);
    end;

    procedure SumSalesLines(No: Code[20]) returnVar: Decimal
    var
        SalesLines: Record "Sales Line";
        TotalQuantity: Decimal;
        IsHandled: Boolean;
    begin
        OnBeforeSumSalesLines(No, returnVar, IsHandled);
        if IsHandled then
            exit;
        TotalQuantity := 0;

        SalesLines.SetRange("Document Type", SalesLines."Document Type"::Order);
        SalesLines.SetRange("Document No.", No);

        if SalesLines.FindSet() then
            repeat
                TotalQuantity += SalesLines.Quantity;
            until SalesLines.Next() = 0;

        OnAfterSumSalesLines(No, returnVar);

        exit(TotalQuantity);
    end;

    local procedure GetShipmentWeight(No: Code[20]) returnVar: Decimal
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TotalWeight: Decimal;
        IsHandled: Boolean;
    begin
        OnBeforeGetShipmentWeight(No, returnVar, IsHandled);
        if IsHandled then
            exit;

        TotalWeight := 0;
        SalesHeader.Reset();
        SalesHeader.SetRange("No.", No);
        if SalesHeader.FindSet() then begin
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange("Document No.", SalesHeader."No.");

            if not SalesLine.IsEmpty() then
                repeat
                    TotalWeight += SalesLine."Net Weight" * SalesLine.Quantity;

                until SalesHeader.Next() = 0;

            OnAfterGetShipmentWeight(No, returnVar);
            exit(TotalWeight);
        end;
    end;


    local procedure GetNoOfSkids(No: Code[20]) returnVar: Integer
    var
        SalesLine: Record "Sales Line";
        IsHandled: Boolean;
        NoOfSkids: Integer;

    begin
        OnBeforeGetNoOfSkids(No, returnVar, IsHandled);
        if IsHandled then
            exit;

        SalesLine.SetRange("Document No.", No);
        NoOfSkids := 0;

        if SalesLine.FindSet() then
            repeat
                NoOfSkids += SalesLine."Qty. to Ship Pallet";
            until SalesLine.Next() = 0;

        OnAfterGetNoOfSkids(No, returnVar);

        exit(NoOfSkids);

    end;

    local procedure GetNoOfCases(No: Code[20]) returnVar: Integer
    var
        SalesLine: Record "Sales Line";
        IsHandled: Boolean;
        NoOfCases: Integer;

    begin
        OnBeforeGetNoOfCases(No, returnVar, IsHandled);
        if IsHandled then
            exit;

        SalesLine.SetRange("Document No.", No);
        NoOfCases := 0;

        if SalesLine.FindSet() then
            repeat
                NoOfCases += SalesLine."Qty. to Ship Case";
            until SalesLine.Next() = 0;

        OnAfterGetNoOfCases(No, returnVar);

        exit(NoOfCases);

    end;

    local procedure isFullyAllocated(No: Code[20]) isComplete: Boolean
    var
        SalesLines: Record "Sales Line";
        QtyAllocated: Decimal;
        IsHandled: Boolean;


    begin
        OnBeforeIsFullyAllocated(No, isComplete, IsHandled);
        if IsHandled then
            exit;

        isComplete := False;

        SalesLines.SetRange("Document No.", No);

        if (SalesLines.FindSet()) then begin
            QtyAllocated := 0;
            repeat
                QtyAllocated += SalesLines.Quantity;
            until SalesLines.Next() = 0;

            if (QtyAllocated = SalesLines.Quantity) then isComplete := True;

        end;

        OnAfterIsFullyAllocated(No, isComplete);

        exit(isComplete);




    end;



    local procedure getOrderWeight(No: Code[20]) returnVar: Decimal
    var
        SalesHeader: Record "Sales Header";
        IsHandled: Boolean;
        TotalWeight: Decimal;

    begin
        OnBeforeGetOrderWeight(No, returnVar, IsHandled);
        if IsHandled then
            exit;

        SalesHeader.SetFilter("No.", No);
        TotalWeight := 0;

        if SalesHeader.Find() then
            repeat
            // TotalWeight += SalesHeader."To Ship Weight";
            until SalesHeader.Next() = 0;

        OnAfterGetOrderWeight(No, returnVar);

        exit(TotalWeight);

    end;



    var
        DocPrint: Codeunit "Document-Print";
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";


    [IntegrationEvent(false, false)]
    local procedure OnBeforeSumSalesLines(No: Code[20]; var returnVar: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSumSalesLines(No: Code[20]; var returnVar: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetCollectorID(SelltoCustomerNo: Code[20]; var returnVar: Code[20]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetCollectorID(SelltoCustomerNo: Code[20]; var returnVar: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetShipmentWeight(No: Code[20]; var returnVar: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetShipmentWeight(No: Code[20]; var returnVar: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetNoOfSkids(No: Code[20]; var returnVar: Integer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetNoOfSkids(No: Code[20]; var returnVar: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetNoOfCases(No: Code[20]; var returnVar: Integer; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetNoOfCases(No: Code[20]; var returnVar: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeIsFullyAllocated(No: Code[20]; var returnVar: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterIsFullyAllocated(No: Code[20]; var returnVar: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetOrderWeight(No: Code[20]; var returnVar: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetOrderWeight(No: Code[20]; var returnVar: Decimal)
    begin
    end;
}