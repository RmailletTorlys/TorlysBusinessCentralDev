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
          "Status" = Const(Released),
          "Temporary Hold" = Filter(0));

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

                field("Collector ID"; GetCollectorID(Rec."Sell-to Customer No."))
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

                field("Fully Allocated"; FullyAllocated)
                {
                    ApplicationArea = All;
                    Caption = 'Fully Allocated';
                    ToolTip = 'Fully Allocated';
                    Editable = false;
                }

                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Advice';
                    ToolTip = 'Shipping Advice';
                    Editable = false;
                }

                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Outstanding Quantity';
                    ToolTip = 'Outstanding Quantity';
                    Editable = false;
                    Width = 1;
                }
                field("Qty. to Ship."; Rec."Qty. to Ship")
                {
                    ApplicationArea = All;
                    Caption = 'Qty. to Ship';
                    ToolTip = 'Qty. to Ship';
                    Editable = false;
                }

                field("To Ship Weight"; ToShipWeight)
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

                field("Warehouse Associate Picked By"; Rec."Warehouse Associate Picked By")
                {
                    ApplicationArea = All;
                    Caption = 'Warehouse Associate Picked By';
                    ToolTip = 'Warehouse Associate Picked By';
                    Editable = WarehouseAssociateEditable;
                }

                field("Warehouse Associate Checked By"; Rec."Warehouse Associate Checked By")
                {
                    ApplicationArea = All;
                    Caption = 'Warehouse Associate Checked By';
                    ToolTip = 'Warehouse Associate Checked By';
                    Editable = WarehouseAssociateEditable;
                }
                field("Modified By"; LookupUserId.UserId(Rec.SystemModifiedBy))
                {
                    ApplicationArea = All;
                    Caption = 'Modified By';
                    ToolTip = 'Modified By';
                    Editable = false;
                }

                field("Modified At"; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    Caption = 'Modified At';
                    ToolTip = 'Modified At';
                    Editable = false;
                }

                field("Shipment No."; GetShipmentNo(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'Shipment No.';
                    ToolTip = 'Shipment No.';
                    Editable = false;
                }

                field("Shipment Weight"; GetShipmentWeight(GetShipmentNo(Rec."No.")))
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Weight';
                    ToolTip = 'Shipment Weight';
                    Editable = false;
                }

                field("BOL No."; GetBOLNo(GetShipmentNo(Rec."No.")))
                {
                    ApplicationArea = All;
                    Caption = 'BOL No.';
                    ToolTip = 'BOL No.';
                    Editable = false;
                }

                field("BOL Processed Date"; GetBOLProcessedDate(GetBOLNo(GetShipmentNo(Rec."No."))))
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
            group("Change View")
            {
                actionref("Pickups Only"; "PickupOnly")
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
            group("Assign Orders")
            {
                actionref("Assign Picker"; AssignPicker)
                { }

                actionref("Assign Auditor"; AssignAuditor)
                { }
            }

            actionref("Print Pick Slip"; PrintPickSlip)
            { }

            actionref("Print Summary Pick Slip"; PrintSummaryPickSlip)
            { }
            actionref("Print Label"; PrintLabel)
            { }

            actionref("Post and Print"; PostAndPrint)
            { }

            actionref("Remove BOL from SH"; RemoveBOL)
            { }
        }


        area(Processing)
        {
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
                        Rec.SetRange("Shipping Agent Code", 'PICKUP');
                        Message('Filter applied for Shipment Agent Code: %1', 'PICKUP');
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
            group(Assignment)
            {
                action(AssignPicker)
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

                action(AssignAuditor)
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
            group("Post + Print")
            {
                Caption = 'Print';
                Image = Print;

                action(PrintPickSlip)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Print Pick Slip';
                    Image = Print;
                    ToolTip = 'Print a picking list that shows which items to pick and ship for the sales order. If an item is assembled to order, then the report includes rows for the assembly components that must be picked. Use this report as a pick instruction to employees in charge of picking sales items or assembly components for the sales order.';
                    trigger OnAction()
                    begin
                        // TorlysDocPrint.PrintPickSlip(Rec);
                        DocPrint.PrintSalesOrder(Rec, Usage::"Pick Instruction");
                    end;
                }

                action(PrintSummaryPickSlip)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Print Summary Pick Slip';
                    Image = Print;
                    ToolTip = 'Print a summary picking list that shows which items to pick and ship for the sales order.';
                    trigger OnAction()
                    begin
                        TorlysDocPrint.PrintSummaryPickSlip(Rec);
                    end;
                }
                action(PrintLabel)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Print Label';
                    Image = Print;
                    ToolTip = 'Print label for the sales order.';
                    trigger OnAction()
                    begin
                        TorlysDocPrint.PrintSalesOrderLabel(Rec);
                    end;
                }

                action(PostAndPrint)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Post and Print';
                    Image = Post;
                    ToolTip = 'Post the selected sales order(s) as shipped.';

                    trigger OnAction()
                    var
                        SelectedSalesHeader: Record "Sales Header";
                        SalesShpHeader: Record "Sales Shipment Header";
                        ShipPostPrint: Codeunit "Ship-Post + Print";
                    begin
                        IF Rec."No. Pick Slips Printed" = 0 THEN
                            ERROR('You cannot ship this order as no pick slips have been printed!');

                        IF Rec."Warehouse Associate Picked By" = '' THEN
                            ERROR('The Warehouse Associate Picked By field cannot be blank!');

                        IF Rec."Warehouse Associate Checked By" = '' THEN
                            ERROR('The Warehouse Associate Checked By field cannot be blank!');

                        IF Rec."Warehouse Associate Picked By" = Rec."Warehouse Associate Checked By" THEN
                            ERROR('The Picked By and the Checked By Associate cannot be the same!');

                        CurrPage.SetSelectionFilter(SelectedSalesHeader);

                        if SelectedSalesHeader.FindSet() then
                            repeat

                                // PostOrder(CODEUNIT::"Sales-Post (Yes/No)", SelectedSalesHeader);
                                // CODEUNIT.RUN(CODEUNIT::"Ship-Post + Print", SelectedSalesHeader);
                                ShipPostPrint.Run(SelectedSalesHeader);
                                SalesShpHeader.SetRange("Order No.", SelectedSalesHeader."No.");
                                SalesShpHeader.FindLast();
                                Message('Order %1 has been posted as shipped with Shipment No %2.', SelectedSalesHeader."No.", SalesShpHeader."No.");
                                SalesShpHeader.PrintRecords(true);

                            until SelectedSalesHeader.Next() = 0
                    end;
                }

                action(RemoveBOL)
                {
                    ApplicationArea = All;
                    Caption = 'Remove BOL from SH';
                    Image = CheckList;
                    ToolTip = 'Clear the BOL # from the current line.';

                    trigger OnAction()
                    var
                        ShipmentHeader: Record "Sales Shipment Header";
                    begin
                        ShipmentHeader.Reset();
                        ShipmentHeader.SetRange("No.", GetShipmentNo(Rec."No."));
                        if ShipmentHeader.Find('-') then begin
                            MESSAGE('%1', ShipmentHeader."No.");
                            ShipmentHeader."BOL No." := '';
                            ShipmentHeader.Modify();
                        end;
                    end;
                }
            }
        }
    }

    var
        SalesLine: Record "Sales Line";
        LookupUserId: Codeunit "TorlysLookupUserID";
        WarehouseAssociateEditable: Boolean;
        FullyAllocated: Text[3];
        ToShipWeight: Decimal;


    trigger OnOpenPage()
    begin
        UserSetup.GET(USERID);
        IF UserSetup."Default Location Code" = 'TOR' THEN
            Rec.SETFILTER("Location Code", '%1|%2|%3', UserSetup."Default Location Code", 'QUATOR', 'CLAIMS TOR')
        ELSE IF UserSetup."Default Location Code" = 'CAL' THEN
            Rec.SETFILTER("Location Code", '%1|%2|%3', UserSetup."Default Location Code", 'QUACAL', 'CLAIMS CAL');

        Rec.SetFilter("Shipment Date", '%1', WorkDate());
    end;

    trigger OnAfterGetRecord()
    begin

        IF Rec."Qty. to Ship" = 0 THEN
            WarehouseAssociateEditable := false
        ELSE
            WarehouseAssociateEditable := true;


        IF Rec."Outstanding Quantity" <> Rec."Qty. to Ship" THEN FullyAllocated := 'No' ELSE FullyAllocated := 'Yes';

        CLEAR(ToShipWeight);
        SalesLine.SETRANGE("Document Type", Rec."Document Type");
        SalesLine.SETRANGE("Document No.", Rec."No.");
        SalesLine.SETFILTER("Qty. to Ship", '>0');
        IF SalesLine.FIND('-') THEN
            REPEAT
                ToShipWeight := ToShipWeight + (SalesLine."Qty. to Ship" * SalesLine."Net Weight")
            UNTIL SalesLine.NEXT() = 0;

    end;

    local procedure GetCollectorID(CustomerNo: Code[20]) returnVar: Code[20]
    var
        CustomerRec: Record Customer;
        CollectorID: Code[20];
        IsHandled: Boolean;
    begin
        OnBeforeGetCollectorID(CustomerNo, returnVar, IsHandled);
        if IsHandled then
            exit;
        if (CustomerRec.Get(CustomerNo)) then
            CollectorID := CustomerRec."Collector ID"
        else
            CollectorID := '';
        OnAfterGetCollectorID(CustomerNo, returnVar);
        exit(CollectorID);
    end;

    local procedure GetShipmentNo(OrderNo: Code[20]) returnVar: Code[20]
    var
        ShipmentHeader: Record "Sales Shipment Header";
        ShipmentNo: Code[20];
        IsHandled: Boolean;
    begin
        OnBeforeGetShipmentNo(OrderNo, returnVar, IsHandled);

        if IsHandled then
            exit;

        ShipmentHeader.RESET();
        ShipmentHeader.SETRANGE("Order No.", Rec."No.");
        ShipmentHeader.SETRANGE("Shipment Date", Rec."Shipment Date");
        IF ShipmentHeader.FindLast() THEN
            ShipmentNo := ShipmentHeader."No."
        ELSE
            ShipmentNo := '';


        OnAfterGetShipmentNo(OrderNo, returnVar);

        exit(ShipmentNo);
    end;

    local procedure GetShipmentWeight(ShipmentNo: Code[20]) returnVar: Decimal
    var
        ShipmentLine: Record "Sales Shipment Line";
        ShipmentWeight: Decimal;
        IsHandled: Boolean;
    begin
        OnBeforeGetShipmentWeight(ShipmentNo, returnVar, IsHandled);

        if IsHandled then
            exit;

        ShipmentLine.RESET();
        ShipmentLine.SETRANGE("Document No.", GetShipmentNo(Rec."No."));
        IF ShipmentLine.FIND('-') THEN
            REPEAT
                ShipmentWeight := ShipmentWeight + (ShipmentLine."Quantity" * ShipmentLine."Net Weight");
            UNTIL ShipmentLine.NEXT() = 0;


        OnAfterGetShipmentWeight(ShipmentNo, returnVar);

        exit(ShipmentWeight);
    end;

    local procedure GetBOLNo(ShipmentNo: Code[20]) returnvar: Code[20]
    var
        ShipmentHeader: Record "Sales Shipment Header";
        BOLNo: Code[20];
        IsHandled: Boolean;
    begin
        OnBeforeGetBOLNo(ShipmentNo, returnVar, IsHandled);

        if IsHandled then
            exit;

        ShipmentHeader.RESET();
        ShipmentHeader.SETRANGE("No.", GetShipmentNo(Rec."No."));
        IF ShipmentHeader.FindFirst() THEN
            BOLNo := ShipmentHeader."BOL No."
        ELSE
            BOLNo := '';


        OnAfterGetBOLNo(ShipmentNo, returnVar);

        exit(BOLNo);
    end;

    local procedure GetBOLProcessedDate(BOLNo: Code[20]) returnvar: DateTime
    var
        ProcessedBOLHeader: Record "Torlys Processed BOL Header";
        BOLProcessedDate: DateTime;
        IsHandled: Boolean;
    begin
        OnBeforeGetBOLProcessedDate(BOLNo, returnvar, IsHandled);
        if IsHandled then
            exit;

        ProcessedBOLHeader.RESET();
        ProcessedBOLHeader.SETRANGE("No.", GetBOLNo(GetShipmentNo(Rec."No.")));
        IF ProcessedBOLHeader.FindFirst() THEN
            BOLProcessedDate := ProcessedBOLHeader.SystemCreatedAt
        ELSE
            BOLProcessedDate := 0DT;


        OnAfterGetBOLProcessedDate(BOLNo, returnVar);

        exit(BOLProcessedDate);
    end;

    local procedure GetNoOfSkids(No: Code[20]) returnVar: Integer
    var
        CurrSalesLine: Record "Sales Line";
        IsHandled: Boolean;
        NoOfSkids: Integer;

    begin
        OnBeforeGetNoOfSkids(No, returnVar, IsHandled);
        if IsHandled then
            exit;

        CurrSalesLine.SetRange("Document No.", No);
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
        CurrSalesLine: Record "Sales Line";
        IsHandled: Boolean;
        NoOfCases: Integer;

    begin
        OnBeforeGetNoOfCases(No, returnVar, IsHandled);
        if IsHandled then
            exit;

        CurrSalesLine.SetRange("Document No.", No);
        NoOfCases := 0;

        if SalesLine.FindSet() then
            repeat
                NoOfCases += SalesLine."Qty. to Ship Case";
            until SalesLine.Next() = 0;

        OnAfterGetNoOfCases(No, returnVar);

        exit(NoOfCases);

    end;

    // procedure SumSalesLines(No: Code[20]) returnVar: Decimal
    // var
    //     SalesLines: Record "Sales Line";
    //     TotalQuantity: Decimal;
    //     IsHandled: Boolean;
    // begin
    //     OnBeforeSumSalesLines(No, returnVar, IsHandled);
    //     if IsHandled then
    //         exit;
    //     TotalQuantity := 0;

    //     SalesLines.SetRange("Document Type", SalesLines."Document Type"::Order);
    //     SalesLines.SetRange("Document No.", No);

    //     if SalesLines.FindSet() then
    //         repeat
    //             TotalQuantity += SalesLines.Quantity;
    //         until SalesLines.Next() = 0;

    //     OnAfterSumSalesLines(No, returnVar);

    //     exit(TotalQuantity);
    // end;





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

    var
        UserSetup: Record "User Setup";
        DocPrint: Codeunit "Document-Print";
        TorlysDocPrint: Codeunit "TorlysDocumentPrint";
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
    local procedure OnBeforeGetShipmentNo(OrderNo: Code[20]; var returnVar: Code[20]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetShipmentNo(OrderNo: Code[20]; var returnVar: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetShipmentWeight(ShipmentNo: Code[20]; var returnVar: Decimal; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetShipmentWeight(ShipmentNo: Code[20]; var returnVar: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetBOLNo(ShipmentNo: Code[20]; var returnVar: Code[20]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetBOLNo(ShipmentNo: Code[20]; var returnVar: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetBOLProcessedDate(BOLNo: Code[20]; var returnVar: DateTime; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetBOLProcessedDate(BOLNo: Code[20]; var returnVar: DateTime)
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
    local procedure OnBeforeGetBoLDate(No: Code[20]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetBoLDate(No: Code[20])
    begin
    end;
}