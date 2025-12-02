page 52001 TorlysOrdersToBeShippedList
{
    Caption = 'Orders To Be Shipped List';
    PageType = List;
    CardPageId = TorlysSalesOrderShipment;
    QueryCategory = 'Orders To Be Shipped List';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Header";
    SourceTableView = sorting("No.", "Document Type") order(ascending)
    where("Document Type" = const(Order), "Status" = const(Released), "Temporary Hold" = filter(0));
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    RefreshOnActivate = true;
    Permissions = tabledata "Sales Shipment Header" = rm;

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
                    Editable = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Caption = 'Location Code';
                    ToolTip = 'Location Code';
                    Editable = false;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Number';
                    ToolTip = 'Customer Number';
                    Editable = false;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                    Caption = 'Ship-to Code';
                    ToolTip = 'Ship-to Code';
                    Editable = false;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                    ToolTip = 'Customer Name';
                    Editable = false;
                }
                field("SO Count"; SOCount)
                {
                    ApplicationArea = All;
                    Caption = 'SO Count';
                    ToolTip = 'SO Count';
                    Editable = false;
                }
                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Advice';
                    ToolTip = 'Shipping Advice';
                    Editable = false;
                }
                field("Fully Allocated"; FullyAllocated)
                {
                    ApplicationArea = All;
                    Caption = 'Fully Allocated';
                    ToolTip = 'Fully Allocated';
                    Editable = false;
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Outstanding Quantity';
                    ToolTip = 'Outstanding Quantity';
                    Editable = false;
                    Width = 0;
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
                field("Transfer Order No."; TransferOrderNo)
                {
                    ApplicationArea = All;
                    Caption = 'Transfer Order No.';
                    ToolTip = 'Transfer Order No.';
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
                field("Collector ID"; CollectorID)
                {
                    ApplicationArea = All;
                    Caption = 'Collector ID';
                    ToolTip = 'Collector ID';
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
                field("Picked By"; Rec."Picked By")
                {
                    ApplicationArea = All;
                    Caption = 'Picked By';
                    ToolTip = 'Picked By';
                    Editable = false;
                }
                field("Audited By"; Rec."Audited By")
                {
                    ApplicationArea = All;
                    Caption = 'Audited By';
                    ToolTip = 'Audited By';
                    Editable = false;
                }
                field("Shipment No."; ShipmentNo)
                {
                    ApplicationArea = All;
                    Caption = 'Shipment No.';
                    ToolTip = 'Shipment No.';
                    Editable = false;
                }
                field("Shipment Weight"; ShipmentWeight)
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Weight';
                    ToolTip = 'Shipment Weight';
                    Editable = false;
                }
                // field("BOL No."; BOLNo)
                field("BOL No."; Rec."BOL No.")
                {
                    ApplicationArea = All;
                    Caption = 'BOL No.';
                    ToolTip = 'BOL No.';
                    Editable = false;
                }
                field("BOL Posted Date"; BOLDate)
                {
                    ApplicationArea = All;
                    Caption = 'BOL Posted Date';
                    ToolTip = 'BOL Posted Date';
                    Editable = false;
                }
                field("No. of Skids"; BOLNoOfSkids)
                {
                    ApplicationArea = All;
                    Caption = 'No. of Skids';
                    ToolTip = 'No. of Skids';
                    Editable = false;
                }
                field("No. of Packages"; BOLNoOfPackages)
                {
                    ApplicationArea = All;
                    Caption = 'No. of Packages';
                    ToolTip = 'No. of Packages';
                    Editable = false;
                }
                field("BOL Weight"; BOLWeight)
                {
                    ApplicationArea = All;
                    Caption = 'BOL Weight';
                    ToolTip = 'BOL Weight';
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
                actionref("Today All"; TodayAll)
                { }
                actionref("Today Pickup"; TodayPickup)
                { }
                actionref("Today Carrier"; TodayCarrier)
                { }
                actionref("Today All Location"; TodayAllLocations)
                { }
                actionref("Orders Not Shipped"; OrdersNotShipped)
                { }
                actionref("Orders Shipped"; OrdersShipped)
                { }
                actionref("Picks Not Printed"; PicksNotPrinted)
                { }
                actionref("Picks Printed Not Shipped"; PicksPrintedNotShipped)
                { }
                actionref("Picks Printed Not Assigned"; PicksPrintedNotAssigned)
                { }
                actionref("Assigned Not Shipped"; AssignedNotShipped)
                { }
                actionref("Not Printed Not Assigned"; NotPrintedNotAssigned)
                { }
                actionref("Tomorrow All"; TomorrowAll)
                { }
                actionref("Tomorrow Pickup"; TomorrowPickup)
                { }
                actionref("Tomorrow Carrier"; TomorrowCarrier)
                { }
                actionref("Tomorrow Rock City"; TomorrowRockCity)
                { }
            }
            actionref("Assign Order(s)"; AssignOrders)
            { }
            group("Change Shipment Date")
            {
                actionref("Today"; ChangeToToday)
                { }
                actionref("Next Business Day"; ChangeToNextBusinessDay)
                { }
                actionref("2 Business Days"; ChangeTo2BusinessDays)
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
            group("Posted Documents")
            {
                actionref("View Shipments"; ViewShipments)
                { }
                actionref("Remove BOL # from SH/OR"; RemoveBOL)
                { }
                actionref("View BOL"; ViewBOL)
                { }
                actionref("View Posted BOL"; ViewPostedBOL)
                { }
                actionref("View Invoices"; ViewInvoices)
                { }
            }
        }

        area(Processing)
        {
            group(Views)
            {
                Caption = 'Views';
                Image = View;
                action(TodayAll)
                {
                    Caption = 'Today All';
                    ToolTip = 'Today All';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        ShipmentDate := WorkDate;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                    end;
                }
                action(TodayPickup)
                {
                    Caption = 'Today Pickup';
                    ToolTip = 'Today Pickup';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        ShipmentDate := WorkDate;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                        Rec.SetFilter("Shipping Agent Code", 'PU');
                    end;
                }
                action(TodayCarrier)
                {
                    Caption = 'Today Carrier';
                    ToolTip = 'Today Carrier';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        ShipmentDate := WorkDate;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                        Rec.SetFilter("Shipping Agent Code", '<>PU');
                    end;
                }
                action(TodayAllLocations)
                {
                    Caption = 'Today All Locations';
                    ToolTip = 'Today All Locations';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        ShipmentDate := WorkDate;

                        Rec.Reset();
                        Rec.SetRange("Shipment Date", ShipmentDate);
                    end;
                }
                action(OrdersNotShipped)
                {
                    Caption = 'Orders Not Shipped';
                    ToolTip = 'Orders Not Shipped';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        ShipmentDate := WorkDate;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                        Rec.SetFilter("Qty. to Ship", '>0');
                    end;
                }
                action(OrdersShipped)
                {
                    Caption = 'Orders Shipped';
                    ToolTip = 'Orders Shipped';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        ShipmentDate := WorkDate;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                        Rec.SetFilter("Qty. to Ship", '0');
                    end;
                }
                action(PicksNotPrinted)
                {
                    Caption = 'Picks Not Printed';
                    ToolTip = 'Picks Not Printed';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        ShipmentDate := WorkDate;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                        Rec.SetFilter("No. Pick Slips Printed", '=0');
                    end;
                }
                action(PicksPrintedNotShipped)
                {
                    Caption = 'Picks Printed Not Shipped';
                    ToolTip = 'Picks Printed Not Shipped';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        ShipmentDate := WorkDate;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                        Rec.SetFilter("No. Pick Slips Printed", '<>0');
                        Rec.SetFilter("Qty. to Ship", '>0');
                    end;
                }
                action(PicksPrintedNotAssigned)
                {
                    Caption = 'Picks Printed Not Assigned';
                    ToolTip = 'Picks Printed Not Assigned';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        ShipmentDate := WorkDate;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                        Rec.SetFilter("No. Pick Slips Printed", '<>0');
                        Rec.SetFilter("Picked By", '=%1', '');
                    end;
                }
                action(AssignedNotShipped)
                {
                    Caption = 'Assigned Not Shipped';
                    ToolTip = 'Assigned Not Shipped';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        ShipmentDate := WorkDate;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                        Rec.SetFilter("Picked By", '<>%1', '');
                        Rec.SetFilter("Qty. to Ship", '<>0');
                    end;
                }
                action(NotPrintedNotAssigned)
                {
                    Caption = 'Not Printed Not Assigned';
                    ToolTip = 'Not Printed Not Assigned';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        ShipmentDate := WorkDate;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                        Rec.SetFilter("No. Pick Slips Printed", '0');
                        Rec.SetFilter("Picked By", '');
                    end;
                }
                action(TomorrowAll)
                {
                    Caption = 'Tomorrow All';
                    ToolTip = 'Tomorrow All';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        if Date2DWY(WorkDate(), 1) = 5 then
                            ShipmentDate := WorkDate() + 3
                        else
                            ShipmentDate := WorkDate() + 1;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                    end;
                }
                action(TomorrowPickup)
                {
                    Caption = 'Tomorrow Pickup';
                    ToolTip = 'Tomorrow Pickup';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        if Date2DWY(WorkDate(), 1) = 5 then
                            ShipmentDate := WorkDate() + 3
                        else
                            ShipmentDate := WorkDate() + 1;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                        Rec.SetFilter("Shipping Agent Code", 'PU');
                    end;
                }
                action(TomorrowCarrier)
                {
                    Caption = 'Tomorrow Carrier';
                    ToolTip = 'Tomorrow Carrier';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        if Date2DWY(WorkDate(), 1) = 5 then
                            ShipmentDate := WorkDate() + 3
                        else
                            ShipmentDate := WorkDate() + 1;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                        Rec.SetFilter("Shipping Agent Code", '<>PU');
                    end;
                }
                action(TomorrowRockCity)
                {
                    Caption = 'Tomorrow Rock City';
                    ToolTip = 'Tomorrow Rock City';
                    ApplicationArea = All;
                    Image = Filter;
                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        LocationCode: Code[25];
                        ShipmentDate: Date;
                    begin
                        UserSetup.Get(UserId);
                        if UserSetup."Default Location Code" = 'TOR' then
                            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                        else if UserSetup."Default Location Code" = 'CAL' then
                            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                        if Date2DWY(WorkDate(), 1) = 5 then
                            ShipmentDate := WorkDate() + 3
                        else
                            ShipmentDate := WorkDate() + 1;

                        Rec.Reset();
                        Rec.SetFilter("Location Code", LocationCode);
                        Rec.SetRange("Shipment Date", ShipmentDate);
                        Rec.SetRange("Shipping Agent Code", 'ROCKCITY');
                    end;
                }
            }
            group(Posting)
            {
                action(AssignOrders)
                {
                    ApplicationArea = All;
                    Caption = 'Assign Order(s)';
                    Image = CheckList;
                    ToolTip = 'Assign warehouse associates to selected order(s).';
                    trigger OnAction()
                    var
                        SalesHeader: Record "Sales Header";
                        PickerPage: Page "Salespersons/Purchasers";
                        PickerRecord: Record "Salesperson/Purchaser";
                        AuditorPage: Page "Salespersons/Purchasers";
                        AuditorRecord: Record "Salesperson/Purchaser";
                    begin
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.FindSet() then begin
                            PickerPage.LookupMode(true);
                            PickerRecord.Reset;
                            PickerRecord.SetFilter("Job Title", 'Warehouse Associate');
                            PickerPage.SetTableView(PickerRecord);
                            if PickerPage.RunModal() = Action::LookupOK then
                                PickerPage.GetRecord(PickerRecord);
                            AuditorPage.LookupMode(true);
                            AuditorRecord.Reset;
                            AuditorRecord.SetFilter("Job Title", 'Warehouse Associate');
                            AuditorRecord.SetFilter("Code", '<>%1', PickerRecord.Code);
                            AuditorPage.SetTableView(AuditorRecord);
                            if AuditorPage.RunModal() = Action::LookupOK then
                                AuditorPage.GetRecord(AuditorRecord);
                            repeat
                                SalesHeader."Picked By" := PickerRecord.Code;
                                SalesHeader."Audited By" := AuditorRecord.Code;
                                SalesHeader.Modify(true);
                            until SalesHeader.Next() = 0;
                        end;
                        CurrPage.Update(true);
                    end;
                }
            }
            group(ShipmentDate)
            {
                action(ChangeToToday)
                {
                    ApplicationArea = All;
                    Caption = 'Change Shipment Date To Today';
                    Image = ChangeDate;
                    ToolTip = 'Change Shipment Date To Today';
                    trigger OnAction()
                    var
                        SalesHeader: Record "Sales Header";
                        TorlysChangeShipmentDate: Codeunit TorlysChangeShipmentDate;
                    begin
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.FindSet() then
                            repeat
                                TorlysChangeShipmentDate.ChangeToToday(SalesHeader, SalesHeader);
                            until SalesHeader.Next() = 0;
                        CurrPage.Update(true);
                    end;
                }
                action(ChangeToNextBusinessDay)
                {
                    ApplicationArea = All;
                    Caption = 'Change To Next Business Day';
                    Image = ChangeDate;
                    ToolTip = 'Change To Next Business Day';
                    trigger OnAction()
                    var
                        SalesHeader: Record "Sales Header";
                        TorlysChangeShipmentDate: Codeunit TorlysChangeShipmentDate;
                    begin
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.FindSet() then
                            repeat
                                TorlysChangeShipmentDate.ChangeToNextBusinessDay(SalesHeader, SalesHeader);
                            until SalesHeader.Next() = 0;
                        CurrPage.Update(true);
                    end;
                }
                action(ChangeTo2BusinessDays)
                {
                    ApplicationArea = All;
                    Caption = 'Change To 2 Business Days Ahead';
                    Image = ChangeDate;
                    ToolTip = 'Change To 2 Business Days Ahead';
                    trigger OnAction()
                    var
                        SalesHeader: Record "Sales Header";
                        TorlysChangeShipmentDate: Codeunit TorlysChangeShipmentDate;
                    begin
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.FindSet() then
                            repeat
                                TorlysChangeShipmentDate.ChangeTo2BusinessDays(SalesHeader, SalesHeader);
                            until SalesHeader.Next() = 0;
                        CurrPage.Update(true);
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
                    var
                        SalesHeader: Record "Sales Header";
                    begin
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.Count > 1 then
                            Error('You cannot print multiple pick slips this way, choose 1 order.')
                        else
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
                    var
                        SalesHeader: Record "Sales Header";
                    begin
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.Count > 1 then
                            Error('You cannot print summary pick slips this way, choose 1 order.')
                        else
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
                    var
                        SalesHeader: Record "Sales Header";
                    begin
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.Count > 1 then
                            Error('You cannot print multiple labels this way, choose 1 order.')
                        else
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
                        SalesHeader: Record "Sales Header";
                        FirstCustomerNo: Code[20];
                        CurrentCustomerNo: Code[20];
                        IsSameCustomer: Boolean;
                        FirstShipTo: Code[10];
                        CurrentShipTo: Code[10];
                        IsSameShipTo: Boolean;
                        FirstShipmentDate: Date;
                        CurrentShipmentDate: Date;
                        IsSameShipmentDate: Boolean;
                        FirstShippingAgent: Code[10];
                        CurrentShippingAgent: Code[10];
                        IsSameShippingAgent: Boolean;
                    begin
                        // check if all selected customers match
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.FindSet() then begin
                            FirstCustomerNo := SalesHeader."Sell-to Customer No.";
                            repeat
                                CurrentCustomerNo := SalesHeader."Sell-to Customer No.";
                                if CurrentCustomerNo <> FirstCustomerNo then begin
                                    IsSameCustomer := false;
                                    Error('When posting multiple orders must be for same customer.')
                                end;
                            until SalesHeader.Next() = 0;
                        end;

                        // check if all selected ship-to match
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.FindSet() then begin
                            FirstShipTo := SalesHeader."Ship-to Code";
                            repeat
                                CurrentShipTo := SalesHeader."Ship-to Code";
                                if CurrentShipTo <> FirstShipTo then begin
                                    IsSameShipTo := false;
                                    Error('When posting multiple orders must be for same ship-to.')
                                end;
                            until SalesHeader.Next() = 0;
                        end;

                        // check if all selected shipment date match
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.FindSet() then begin
                            FirstShipmentDate := SalesHeader."Shipment Date";
                            repeat
                                CurrentShipmentDate := SalesHeader."Shipment Date";
                                if CurrentShipmentDate <> FirstShipmentDate then begin
                                    IsSameShipmentDate := false;
                                    Error('When posting multiple orders must be for same shipment date.')
                                end;
                            until SalesHeader.Next() = 0;
                        end;

                        // check if all selected shipping agent match
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.FindSet() then begin
                            FirstShippingAgent := SalesHeader."Shipping Agent Code";
                            repeat
                                CurrentShippingAgent := SalesHeader."Shipping Agent Code";
                                if CurrentShippingAgent <> FirstShippingAgent then begin
                                    IsSameShippingAgent := false;
                                    Error('When posting multiple orders must be for same shipping agent.')
                                end;
                            until SalesHeader.Next() = 0;
                        end;

                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.FindSet() then
                            repeat
                                // since we can't inject to add freight, we will just call our own codeunit
                                // out of the box codeunit below
                                // CODEUNIT.RUN(CODEUNIT::"Ship-Post + Print", Rec);
                                // our codeunit below
                                CODEUNIT.RUN(CODEUNIT::"TorlysShip-Post+Print", SalesHeader);
                            until SalesHeader.Next() = 0;
                    end;
                }
            }
            group("Documents")
            {
                Caption = 'Posted Documents';
                Image = Documents;
                action(ViewShipments)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'View Shipments';
                    Image = Shipment;
                    RunObject = Page "Posted Sales Shipments";
                    RunPageLink = "Order No." = field("No.");
                    RunPageView = sorting("Order No.");
                    ToolTip = 'View related posted sales shipments.';
                }
                action(RemoveBOL)
                {
                    ApplicationArea = All;
                    Caption = 'Remove BOL # from SH/OR';
                    Image = CheckList;
                    ToolTip = 'Clear the BOL # from the current line.';
                    trigger OnAction()
                    var
                        RemoveBOL: Boolean;
                        ShipmentHeader: Record "Sales Shipment Header";
                        SalesHeader: Record "Sales Header";
                    begin
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.Count > 1 then begin
                            Error('You cannot remove BOL # this way, choose 1 order.')
                        end else begin
                            RemoveBOL := Dialog.Confirm('This will just remove the BOL # from the SH and the OR, the BOL line will still be populated. Proceed?');
                            if RemoveBOL then begin
                                ShipmentHeader.Reset();
                                ShipmentHeader.SetRange("No.", ShipmentNo);
                                if ShipmentHeader.Find('-') then begin
                                    ShipmentHeader."BOL No." := '';
                                    ShipmentHeader.Modify(true);
                                    Message('BOL # removed from %1.', ShipmentNo);
                                end;
                                SalesHeader.Reset();
                                SalesHeader.SetRange("No.", Rec."No.");
                                if SalesHeader.Find('-') then begin
                                    SalesHeader."BOL No." := '';
                                    SalesHeader.Modify(true);
                                    Message('BOL # removed from %1.', Rec."No.");
                                end;
                            end;
                        end;
                    end;
                }

                action(ViewBOL)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'View BOL';
                    Image = SalesShipment;
                    RunObject = Page "Torlys BOL";
                    RunPageLink = "No." = field("BOL No.");
                    // RunPageView = sorting("No.");
                    ToolTip = 'View related BOL.';
                }
                action(ViewPostedBOL)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'View Posted BOL';
                    Image = SalesShipment;
                    RunObject = Page "Torlys Processed BOL";
                    RunPageLink = "No." = field("BOL No.");
                    // RunPageView = sorting("No.");
                    ToolTip = 'View related BOL.';
                }
                action(ViewInvoices)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Invoices';
                    Image = Invoice;
                    ToolTip = 'View a list of ongoing sales invoices for the order.';
                    AboutTitle = 'What has been invoiced?';
                    AboutText = 'Here you can look up what has already been invoiced on an order.';
                    trigger OnAction()
                    var
                        TempSalesInvoiceHeader: Record "Sales Invoice Header" temporary;
                        SalesGetShipment: Codeunit "Sales-Get Shipment";
                    begin
                        SalesGetShipment.GetSalesOrderInvoices(TempSalesInvoiceHeader, Rec."No.");
                        Page.Run(Page::"Posted Sales Invoices", TempSalesInvoiceHeader);
                    end;
                }
            }
        }
    }

    var
        SOCount: Integer;
        SalesHeader: Record "Sales Header";
        FullyAllocated: Text[3];
        CollectorID: Code[20];
        Customer: Record "Customer";
        ToShipWeight: Decimal;
        TransferOrderNo: Code[20];
        ShipmentNo: Code[20];
        // BOLNo: Code[20];
        ShipmentHeader: Record "Sales Shipment Header";
        ShipmentWeight: Decimal;
        ShipmentLine: Record "Sales Shipment Line";
        BOLDate: DateTime;
        PostedBOLHeader: Record "Torlys Processed BOL Header";
        BOLNoOfSkids: Integer;
        BOLNoOfPackages: Integer;
        BOLWeight: Decimal;
        BOLHeader: Record "Torlys BOL Header";
        UserSetup: Record "User Setup";
        DocPrint: Codeunit "Document-Print";
        TorlysDocPrint: Codeunit "TorlysDocumentPrint";
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";
        SalesLine: Record "Sales Line";

    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);
        if UserSetup."Default Location Code" = 'TOR' then
            Rec.SetFilter("Location Code", '%1|%2|%3', UserSetup."Default Location Code", 'QUATOR', 'CLAIMS TOR')
        else if UserSetup."Default Location Code" = 'CAL' then
            Rec.SetFilter("Location Code", '%1|%2|%3', UserSetup."Default Location Code", 'QUACAL', 'CLAIMS CAL');

        Rec.SetFilter("Shipment Date", '%1', WorkDate());
    end;

    trigger OnAfterGetRecord()
    begin

        // Get Sales Order count
        SalesHeader.Reset;
        SalesHeader.SetFilter("Document Type", 'Order');
        SalesHeader.SetRange("Sell-to Customer No.", Rec."Sell-to Customer No.");
        SalesHeader.SetRange("Ship-to Code", Rec."Ship-to Code");
        SalesHeader.SetRange("Shipment Date", Rec."Shipment Date");
        SalesHeader.SetFilter(Status, 'Released');
        SOCount := SalesHeader.Count;

        // Set if order is Fully Allocated or not
        Clear(FullyAllocated);
        if Rec."Outstanding Quantity" <> Rec."Qty. to Ship" then
            FullyAllocated := 'No'
        else
            FullyAllocated := 'Yes';

        // Get Collector ID
        Clear(CollectorID);
        Customer.Reset();
        if Customer.Get(Rec."Sell-to Customer No.") then
            CollectorID := Customer."Collector ID"
        else
            CollectorID := '';

        // Get weight of allocated order
        Clear(ToShipWeight);
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Type", 'Item');
        SalesLine.SetFilter("Qty. to Ship", '>0');
        if SalesLine.Find('-') then
            repeat
                ToShipWeight := ToShipWeight + (SalesLine."Qty. to Ship" * SalesLine."Net Weight")
            until SalesLine.Next() = 0;

        // Get if tied to Transfer Order (Order FulFillment)
        Clear(TransferOrderNo);
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Type", 'Item');
        SalesLine.SetFilter("Qty. to Ship", '>0');
        SalesLine.SetFilter("Transfer Order No.", '<>%1', '');
        if SalesLine.Find('-') then
            TransferOrderNo := SalesLine."Transfer Order No."
        else
            TransferOrderNo := '';

        // Get if tied to Linked Transfer Order (Demand Planning)
        Clear(TransferOrderNo);
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Type", 'Item');
        SalesLine.SetFilter("Qty. to Ship", '>0');
        SalesLine.SetFilter("Linked Transfer Order No.", '<>%1', '');
        if SalesLine.Find('-') then
            TransferOrderNo := SalesLine."Linked Transfer Order No.";

        // Get posted shipment number
        Clear(ShipmentNo);
        ShipmentHeader.Reset();
        ShipmentHeader.SetRange("Order No.", Rec."No.");
        ShipmentHeader.SetRange("Shipment Date", Rec."Shipment Date");
        if ShipmentHeader.FindLast() then
            ShipmentNo := ShipmentHeader."No."
        else
            ShipmentNo := '';

        // Get posted shipment weight
        Clear(ShipmentWeight);
        ShipmentLine.Reset();
        ShipmentLine.SetRange("Document No.", ShipmentNo);
        if ShipmentLine.Find('-') THEN
            repeat
                ShipmentWeight := ShipmentWeight + (ShipmentLine."Quantity" * ShipmentLine."Net Weight");
            until ShipmentLine.Next() = 0;

        // Get Open BOL stats
        Clear(BOLNoOfSkids);
        Clear(BOLNoOfPackages);
        Clear(BOLWeight);
        BOLHeader.Reset();
        BOLHeader.SetRange("No.", Rec."BOL No.");
        if BOLHeader.Find('-') then begin
            BOLNoOfSkids := BOLHeader."No. of Skids";
            BOLNoOfPackages := BOLHeader."No. of Packages";
            BOLWeight := BOLHeader."Weight - Total";
        end else begin
            BOLNoOfSkids := 0;
            BOLNoOfPackages := 0;
            BOLWeight := 0;
        end;

        // Get Posted BOL date and stats
        // Clear(BOLNoOfSkids);
        // Clear(BOLNoOfPackages);
        // Clear(BOLWeight);
        Clear(BOLDate);
        PostedBOLHeader.Reset();
        PostedBOLHeader.SetRange("No.", Rec."BOL No.");
        if PostedBOLHeader.Find('-') then begin
            BOLNoOfSkids := PostedBOLHeader."No. of Skids";
            BOLNoOfPackages := PostedBOLHeader."No. of Packages";
            BOLWeight := PostedBOLHeader."Weight - Total";
            BOLDate := PostedBOLHeader."SystemCreatedAt";
        end;


        // // Get Posted BOL stats
        // Clear(BOLNoOfSkids);
        // Clear(BOLNoOfPackages);
        // Clear(BOLWeight);
        // PostedBOLHeader.Reset();
        // PostedBOLHeader.SetRange("No.", Rec."BOL No.");
        // if PostedBOLHeader.Find('-') then begin
        //     BOLNoOfSkids := PostedBOLHeader."No. of Skids";
        //     BOLNoOfPackages := PostedBOLHeader."No. of Packages";
        //     BOLWeight := PostedBOLHeader."Weight - Total";
        // end;

    end;
}