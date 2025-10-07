page 52001 "Orders To Be Shipped List"
{
    Caption = 'Orders to be Shipped';
    PageType = List;
    CardPageId = "Torlys Sales Order Shipment";
    QueryCategory = 'Orders to be Shipped List';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Header";
    SourceTableView = SORTING("No.", "Document Type") ORDER(Ascending)
    WHERE("Document Type" = CONST(Order),
          "Status" = Const(Released)
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
                    Editable = false;
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
                    Editable = false;
                }

                field("Collector ID"; GetCollectorID(Rec."Bill-to Customer No."))
                {
                    ApplicationArea = All;
                    Caption = 'Collector ID';
                    ToolTip = 'Collector ID';
                    Editable = false;
                }

                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Number';
                    ToolTip = 'Customer Number';
                    Editable = false;
                }

                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                    ToolTip = 'Customer Name';
                    Editable = false;
                }

                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                    Caption = 'Ship-to Code';
                    ToolTip = 'Ship-to Code';
                    Editable = false;
                }

                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Advice';
                    ToolTip = 'Shipping Advice';
                    Editable = false;
                }


                field("Fully Allocated"; isFullyAllocated(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'Fully Allocated';
                    ToolTip = 'Fully Allocated';
                    Editable = false;
                }


                field("To Ship Qty."; SumSalesLines(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'To Ship Qty.';
                    ToolTip = 'To Ship Quantity';
                    Editable = false;
                }

                field("To Ship Weight"; getOrderWeight(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'To Ship Weight';
                    ToolTip = 'To Ship Weight';
                    Editable = false;
                }

                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Agent Code';
                    ToolTip = 'Shipping Agent Code';
                    Editable = false;
                }

                field("Ship-to Country/Region"; Rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = All;
                    Caption = 'Ship-to Country/Region';
                    ToolTip = 'Ship-to Country/Region';
                    Editable = false;
                }

                field("On Hold"; Rec."On Hold")
                {
                    ApplicationArea = All;
                    Caption = 'On Hold';
                    ToolTip = 'On Hold';
                    Editable = false;
                }

                field("Pick Slip Printed By"; Rec."Pick Slip Printed By")
                {
                    ApplicationArea = All;
                    Caption = 'Pick Slip Printed By';
                    ToolTip = 'Pick Slip Printed By';
                    Editable = false;
                }

                field("Pick Slip Printed Date"; Rec."Pick Slip Printed Date")
                {
                    ApplicationArea = All;
                    Caption = 'Pick Slip Printed Date';
                    ToolTip = 'Pick Slip Printed Date';
                    Editable = false;
                }

                field("Pick Slip Printed Time"; Rec."Pick Slip Printed Time")
                {
                    ApplicationArea = All;
                    Caption = 'Pick Slip Printed Time';
                    ToolTip = 'Pick Slip Printed Time';
                    Editable = false;
                }

                field("No. Pick Slips Printed"; Rec."No. Pick Slips Printed")
                {
                    ApplicationArea = All;
                    Caption = 'No. Pick Slips Printed';
                    ToolTip = 'No. Pick Slips Printed';
                    Editable = false;
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

                field("Last Modified By"; LookupUser.UserId(Rec.SystemModifiedBy))
                {
                    ApplicationArea = All;
                    Caption = 'Last Modified By';
                    ToolTip = 'Last Modified By';
                    Editable = false;

                }

                field("Last Modified Date"; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    Caption = 'Last Modified Date';
                    ToolTip = 'Last Modified Date';
                    Editable = false;
                }

                field("Shipment No."; Rec."Shipping No.")
                {
                    ApplicationArea = All;
                    Caption = 'Shipment No.';
                    ToolTip = 'Shipment No.';
                    Editable = false;
                }

                field("Shipment Weight"; GetShipmentWeight(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Weight';
                    ToolTip = 'Shipment Weight';
                    Editable = false;
                }

                field("BOL No."; GetBoLNo(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'BOL No.';
                    ToolTip = 'BOL No.';
                    Editable = false;
                }

                field("BOL Processed Date"; GetBoLDate(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'Processed Date';
                    ToolTip = 'Processed Date';
                    Editable = false;
                }

                field("No. of Skids"; GetNoOfSkids(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'No. of Skids';
                    ToolTip = 'No. of Skids';
                    Editable = false;
                }

                field("No. of Packages"; GetNoOfCases(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'No. of Packages';
                    ToolTip = 'No. of Packages';
                    Editable = false;
                }

            }
        }
    }

    actions
    {
        area(Promoted)
        {
            group("Assign Orders")
            {
                actionref("Assign a Picker"; "Assign Picker")
                { }

                actionref("Assign a Checker"; "Assign Checker")
                { }
            }

            actionref("Print Summary Pick Slip"; "Print Summary Pick Instruction")
            { }

            actionref("Remove BoL"; "Clear BoL")
            { }

            group("Posting & Printing")
            {
                actionref("Print Pick Slip"; "Print Pick Instruction")
                { }



                actionref("Post & Print"; "Post and Print Order(s)")
                { }
            }

            group("Default Views")
            {
                actionref("Show Pickups"; "PickupOnly")
                { }

                actionref("Show Shipments"; "OnlyShipments")
                { }

                actionref("Shipments for Tomorrow"; "TomorrowOnly")
                { }

                actionref("Rock City Shipments for Tomorrow"; "TomorrowRockCity")
                { }

                actionref("Orders Not Shipped"; "NotShippedOnly")
                { }

                actionref("Pick Slip not yet Printed"; "PickNotPrinted")
                { }

                actionref("Picked Printed but not Posted"; "PickPrintedButNotPosted")
                { }

                actionref("Pick Slip Printed but Not assigned"; "PrintedNotAssigned")
                { }

                actionref("Assigned to a Picker but not Posted"; "AssignedNotPosted")
                { }

            }

        }


        area(Processing)
        {
            group("Post and Print")
            {
                Caption = 'Print';
                Image = Print;

                action("Print Pick Instruction")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Pick Instruction';
                    Image = Print;
                    ToolTip = 'Print a picking list that shows which items to pick and ship for the sales order. If an item is assembled to order, then the report includes rows for the assembly components that must be picked. Use this report as a pick instruction to employees in charge of picking sales items or assembly components for the sales order.';


                    trigger OnAction()
                    var
                        SelectedSalesHeader: Record "Sales Header";
                        SalesHeader: Record "Sales Header";
                        ReportSelection: Record "Report Selections";
                        FilterDate: Date;

                    begin

                        CurrPage.SetSelectionFilter(SelectedSalesHeader);

                        if SelectedSalesHeader.FindSet() then
                            repeat
                                FilterDate := SelectedSalesHeader."Shipment Date";

                                SalesHeader.SetRange("No.", SelectedSalesHeader."No.");
                                SalesHeader.SetRange("Sell-to Customer No.", SelectedSalesHeader."Sell-to Customer No."); //TLY-SD-03
                                SalesHeader.SetRange("Ship-to Code", SelectedSalesHeader."Ship-to Code"); //TLY-SD-03
                                SalesHeader.SetRange("Shipment Date", FilterDate); //TLY-SD-03
                                SalesHeader.SetRange("Shipping Agent Code", SelectedSalesHeader."Shipping Agent Code"); //TLY-SD-03

                                ReportSelection.SETRANGE(Usage, ReportSelection.Usage::"S.Order Pick Instruction");
                                ReportSelection.FIND('-');
                                REPEAT
                                    ReportSelection.PrintReport(ReportSelection.Usage::"S.Order Pick Instruction", SalesHeader);
                                UNTIL ReportSelection.NEXT() = 0;

                            until SelectedSalesHeader.Next() = 0;
                    end;
                }

                action("Print Summary Pick Instruction")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Summary Pick Instruction';
                    Image = Print;
                    ToolTip = 'Print a summary picking list that shows which items to pick and ship for the sales order.';

                    trigger OnAction()
                    var
                        Usage: Option "Summary Pick";
                    begin

                        TorlysDocPrint.PrintSummaryPick(Usage::"Summary Pick");

                    end;
                }


                action("Post and Print Order(s)")
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Post and Print Order(s)';
                    Image = Post;
                    ToolTip = 'Post the selected sales order(s) as shipped.';

                    trigger OnAction()
                    var
                        SelectedSalesHeader: Record "Sales Header";
                        SalesShpHeader: Record "Sales Shipment Header";
                    begin
                        CurrPage.SetSelectionFilter(SelectedSalesHeader);

                        if SelectedSalesHeader.FindSet() then
                            repeat

                                PostOrder(CODEUNIT::"Sales-Post (Yes/No)", SelectedSalesHeader);
                                SalesShpHeader.SetRange("Order No.", SelectedSalesHeader."No.");
                                SalesShpHeader.FindLast();
                                Message('Order %1 has been posted as shipped with Shipment No %2.', SelectedSalesHeader."No.", SalesShpHeader."No.");
                                SalesShpHeader.PrintRecords(true);

                            until SelectedSalesHeader.Next() = 0

                    end;
                }

                action("Clear BoL")
                {
                    ApplicationArea = All;
                    Caption = 'Clear BoL';
                    Image = CheckList;
                    ToolTip = 'Remove the BoL # from the current line.';


                    trigger OnAction()
                    var
                        SalesShipmentHeader: Record "Sales Shipment Header";
                        SelectedSalesHeader: Record "Sales Header";
                        UpdateBoL: Codeunit UpdateBillOfLadingOnShipHeader;


                    begin
                        CurrPage.SetSelectionFilter(SelectedSalesHeader);

                        if SelectedSalesHeader.FindSet() then
                            repeat
                                SalesShipmentHeader.Reset();
                                SalesShipmentHeader.SetRange("Ship-to Code", SelectedSalesHeader."Ship-to Code");
                                SalesShipmentHeader.SetRange("Shipment Date", SelectedSalesHeader."Shipment Date");
                                if SalesShipmentHeader.FindLast() then
                                    UpdateBoL.DeleteBolNumber(SalesShipmentHeader."No.", SalesShipmentHeader."BoL No.");

                            until SelectedSalesHeader.Next() = 0
                    end;
                }
            }

            group(Assignment)
            {
                action("Assign Picker")
                {
                    ApplicationArea = All;
                    Caption = 'Assign Picker';
                    Image = CheckList;
                    ToolTip = 'Assign a warehouse employee to the Picker field of selected Order(s).';


                    trigger OnAction()
                    var
                        SelectedSalesHeader: Record "Sales Header";
                        WhseAssoc: Record "Salesperson/Purchaser";
                        WarehouseAssignment: Page "Warehouse Assignment";
                    begin
                        CurrPage.SetSelectionFilter(SelectedSalesHeader);

                        if not SelectedSalesHeader.FindSet() then
                            Message('No Orders have been selected. Please check your selection and try again.');

                        WarehouseAssignment.LookupMode(true);
                        if SelectedSalesHeader.FindSet() then begin

                            if WarehouseAssignment.RunModal() = Action::LookupOK then
                                WarehouseAssignment.GetRecord(WhseAssoc);
                            repeat
                                SelectedSalesHeader."Warehouse Associate Picked By" := WhseAssoc.Code;
                                SelectedSalesheader.Modify();
                            until SelectedSalesHeader.Next() = 0;

                        end;
                    end;
                }

                action("Assign Checker")
                {
                    ApplicationArea = All;
                    Caption = 'Assign Auditor';
                    Image = CheckList;
                    ToolTip = 'Assign a warehouse employee to the Auditor field of selected Order(s).';


                    trigger OnAction()
                    var
                        SelectedSalesHeader: Record "Sales Header";
                        WhseAssoc: Record "Salesperson/Purchaser";
                        WarehouseAssignment: Page "Warehouse Assignment";
                    begin
                        CurrPage.SetSelectionFilter(SelectedSalesHeader);
                        WarehouseAssignment.LookupMode(true);

                        if not SelectedSalesHeader.FindSet() then
                            Message('No Orders have been selected. Please check your selection and try again.');

                        if SelectedSalesHeader.FindSet() then begin

                            if WarehouseAssignment.RunModal() = Action::LookupOK then
                                WarehouseAssignment.GetRecord(WhseAssoc);
                            repeat
                                if SelectedSalesHeader."Warehouse Associate Picked By" = '' then begin
                                    Message('You must assign a picker before you can assign a checker on Order %1.', SelectedSalesHeader."No.");
                                    continue;
                                end;

                                if SelectedSalesHeader."Warehouse Associate Picked By" = WhseAssoc."Code" then begin
                                    Message('You cannot assign the same person for picker and checker on an Order. Check Order %1 and retry.', SelectedSalesHeader."No.");
                                    continue;
                                end;

                                SelectedSalesHeader."Warehouse Associate Checked By" := WhseAssoc.Code;
                                SelectedSalesheader.Modify();
                            until SelectedSalesHeader.Next() = 0;
                        end;


                        CurrPage.Update(false);
                    end;
                }
            }
            group(Views)
            {
                Caption = 'Views';
                Image = View;
                action("PickupOnly")
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
                        Rec.SetFilter("No. Pick Slips Printed", '=0');
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
                        Rec.SetFilter("No. Pick Slips Printed", '<>0');
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
                        Rec.SetFilter("No. Pick Slips Printed", '<>0');
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
                        Rec.SetFilter("Warehouse Associate Picked By", '<>%1', '');
                        Rec.SetFilter("Posting Date", '');
                        Message('Filter applied for Orders Assigned to A Warehouse associate but not yet posted.')
                    end;
                }
            }
        }
    }

    var
        LookupUser: Codeunit LookupUserID;

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

    local procedure GetBoLNo(No: Code[20]): Code[20]
    var
        SalesShipment: Record "Sales Shipment Header";
        IsHandled: Boolean;

    begin
        OnBeforeGetBoLNo(No, IsHandled);
        if IsHandled then
            exit;
        SalesShipment.Reset();
        SalesShipment.SetRange("Order No.", No);

        if not SalesShipment.IsEmpty() then begin
            SalesShipment.FindLast();
            exit(SalesShipment."BoL No.");
        end;


        OnAfterGetBoLNo(No);
    end;

    local procedure GetBoLDate(No: Code[20]): DateTime
    var
        BoLRec: Record "Torlys Processed BOL Header";
        IsHandled: Boolean;
        BoLNo: Code[20];



    begin
        OnBeforeGetBoLDate(No, IsHandled);
        if IsHandled then
            exit;

        BoLNo := GetBoLNo(No);
        BoLRec.Reset();
        BoLRec.SetRange("No.", BoLNo);

        if not BoLRec.IsEmpty() then
            exit(BoLRec."Posted Date");

        OnAfterGetBoLDate(No);
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

            if not (SalesLine.IsEmpty()) then
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

    local procedure PostOrder(PostingCodeunitID: Integer; SelectedSalesheader: Record "Sales Header"): Boolean
    var
        SalesHeader: Record "Sales Header";
        LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
        DocumentIsScheduledForPosting: Boolean;
        DocumentIsPosted: Boolean;


    begin
        LinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(SelectedSalesHeader);
        SelectedSalesHeader.SendToPosting(PostingCodeunitID);

        DocumentIsScheduledForPosting := SelectedSalesHeader."Job Queue Status" = SelectedSalesHeader."Job Queue Status"::"Scheduled for Posting";
        DocumentIsPosted := (not SalesHeader.Get(SelectedSalesHeader."Document Type", SelectedSalesHeader."No.")) or DocumentIsScheduledForPosting;

        CurrPage.Update(False);

        exit(DocumentIsPosted);


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
        TorlysDocPrint: Codeunit "Torlys Print Document";

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

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetBoLNo(No: Code[20]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetBoLNo(No: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetBoLDate(No: Code[20]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetBoLDate(No: Code[20])
    begin
    end;
}