pageextension 59744 TlyTPSCMGContainerList extends "TPS CMG Container List"
{
    layout
    {
        moveafter("Container No."; Description, "Receipt location", "Posting Date", "Container Type")

        addafter("Container Type")
        {
            field("Previous ETA"; Rec."Previous ETA")
            {
                Caption = 'Previous ETA';
                ToolTip = 'Previous ETA';
                ApplicationArea = All;
            }
        }

        moveafter("Previous ETA"; "Actual Shipment Date", "Expected Receipt Date", "BOL No.", "Shipment Method Code")

        addafter("Shipment Method Code")
        {
            field("Freight Forwarder"; Rec."Freight Forwarder")
            {
                Caption = 'Freight Forwarder';
                ToolTip = 'Freight Forwarder';
                ApplicationArea = All;
            }
            field("Steamship Line"; Rec."Steamship Line")
            {
                Caption = 'Steamship Line';
                ToolTip = 'Steamship Line';
                ApplicationArea = All;
            }
        }

        moveafter("Steamship Line"; "Vessel No.", "Voyage No.", "Port of loading")

        addafter("Port of loading")
        {
            field("Port of Loading Date"; Rec."Port of Loading Date")
            {
                Caption = 'Port of Loading Date';
                ToolTip = 'Port of Loading Date';
                ApplicationArea = All;
            }
        }

        moveafter("Port of Loading Date"; "Port of discharge")

        addafter("Port of discharge")
        {
            field("Port of Discharge Date"; Rec."Port of Discharge Date")
            {
                Caption = 'Port of Discharge Date';
                ToolTip = 'Port of Discharge Date';
                ApplicationArea = All;
            }
            field("Inland Terminal"; Rec."Inland Terminal")
            {
                Caption = 'Inland Terminal';
                ToolTip = 'Inland Terminal';
                ApplicationArea = All;
            }
            field("Inland Terminal Date"; Rec."Inland Terminal Date")
            {
                Caption = 'Inland Terminal Date';
                ToolTip = 'Inland Terminal Date';
                ApplicationArea = All;
            }
            field("Insurance Certificate No."; Rec."Insurance Certificate No.")
            {
                Caption = 'Insurance Certificate No.';
                ToolTip = 'Insurance Certificate No.';
                ApplicationArea = All;
            }
        }

        moveafter("Insurance Certificate No."; "Shipping Status", Status)

        addafter(Status)
        {
            // field(BookingNo; BookingNo)
            // {
            //     Caption = 'Booking No.';
            //     ToolTip = 'Booking No.';
            //     ApplicationArea = All;
            //     Editable = false;
            // }
            // field("Open PO Count"; Rec."Open PO Count")
            // {
            //     Caption = 'Open PO Count';
            //     ToolTip = 'Open PO Count';
            //     ApplicationArea = All;
            //     Editable = false;
            // }
            field("Open Transfer Count"; Rec."Open Transfer Count")
            {
                Caption = 'Open Transfer Count';
                ToolTip = 'Open Transfer Count';
                ApplicationArea = All;
                Editable = false;
            }
            // field(AppointmentDate; AppointmentDate)
            // {
            //     Caption = 'Appointment Date';
            //     ToolTip = 'Appointment Date';
            //     ApplicationArea = All;
            //     Editable = false;
            // }
            // field(AppointmentTime; AppointmentTime)
            // {
            //     Caption = 'Appointment Date';
            //     ToolTip = 'Appointment Date';
            //     ApplicationArea = All;
            //     Editable = false;
            // }
            // field(AppointmentAt; AppointmentAt)
            // {
            //     Caption = 'Appointment At';
            //     ToolTip = 'Appointment At';
            //     ApplicationArea = All;
            //     Editable = false;
            // }
            field("Appointment At"; Rec."Appointment At")
            {
                Caption = 'Appointment At';
                ToolTip = 'Appointment At';
                ApplicationArea = All;
                Editable = false;
            }
            field("Received By"; Rec."Received By")
            {
                Caption = 'Received By';
                ToolTip = 'Received By';
                ApplicationArea = All;
                Editable = false;
            }
            field("Received At"; Rec."Received At")
            {
                Caption = 'Received At';
                ToolTip = 'Received At';
                ApplicationArea = All;
                Editable = false;
            }
            field("Created By"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
                Importance = Additional;
            }
        }

        moveafter("Created By"; SystemCreatedAt)

        addafter(SystemCreatedAt)
        {
            field("Modified By"; LookupUserId.UserId(Rec."SystemModifiedBy"))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
                Importance = Additional;
            }

            field("Modified At"; Rec."SystemModifiedAt")
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
                Importance = Additional;
            }
        }

        modify(Description)
        {
            Importance = Additional;
        }
        modify("Vessel No.")
        {
            Caption = 'Vessel Name';
        }

        modify("SCAC Code")
        {
            Visible = false;
        }
        modify("Shipping Agent To Port")
        {
            Visible = false;
        }
        modify("Booking No.")
        {
            Visible = false;
        }
        modify("In-transit Receiving Required")
        {
            Visible = false;
        }
        modify("Expected Shipment Date")
        {
            Visible = false;
        }
        modify("Actual Shipment Date")
        {
            Caption = 'Shipment Date';
        }
        modify("Original Expected Receipt Date")
        {
            Visible = false;
        }
        modify("Expected at Disscharge Port")
        {
            Visible = false;
        }
        modify("Actual Receipt Date")
        {
            Visible = false;
        }
        modify(SystemCreatedAt)
        {
            Importance = Additional;
        }

        modify("Total Weight")
        {
            Visible = false;
        }

        modify("Total Cube")
        {
            Visible = false;
        }
        modify("FDA Status")
        {
            Visible = false;
        }
        modify("Receipt location")
        {
            ShowMandatory = true;
        }
        modify("Posting Date")
        {
            ShowMandatory = true;
        }
        modify("Expected Receipt Date")
        {
            ShowMandatory = true;
        }
        modify("Shipping Agent From Port")
        {
            Visible = false;
        }
        modify(SystemCreatedBy)
        {
            Visible = false;
        }
    }

    actions
    {
        addafter(Category_New)
        {
            group("Warehouse")
            {
                Caption = 'Warehouse';
                actionref(BookAppointment; "Book Appointment")
                { }
                actionref(Received; "Warehouse Received")
                { }
                actionref(PrintReceivingPurchase; "Receiving Report (PO)")
                { }
                actionref(PrintReceivingTransfer; "Receiving Report (Transfer)")
                { }
            }
        }
        addlast(Purchase)
        {
            action("Book Appointment")
            {
                Caption = 'Book Appointment';
                ToolTip = 'Book Appointment';
                ApplicationArea = All;
                Image = Calendar;
                trigger OnAction()
                var
                    ContainerHeader: Record "TPS CMG Container Header";
                    DatePage: Page "Date-Time Dialog";
                begin
                    CurrPage.SetSelectionFilter(ContainerHeader);
                    if ContainerHeader.FindSet() then begin
                        DatePage.LookupMode(true);
                        if DatePage.RunModal() = Action::OK then
                            DatePage.GetRecord(Rec);
                        repeat
                            Rec."Appointment At" := DatePage.GetDateTime();
                            Rec.Modify(true);
                        until ContainerHeader.Next() = 0;
                    end;
                    CurrPage.Update(true);
                end;
            }
            action("Warehouse Received")
            {
                Caption = 'Warehouse Received';
                ToolTip = 'Warehouse Received';
                ApplicationArea = All;
                Image = Receipt;
                trigger OnAction()
                var
                    ContainerHeader: Record "TPS CMG Container Header";
                    ReceiverPage: Page "Salespersons/Purchasers";
                    ReceiverRecord: Record "Salesperson/Purchaser";
                begin
                    CurrPage.SetSelectionFilter(ContainerHeader);
                    if ContainerHeader.FindSet() then begin
                        ReceiverPage.LookupMode(true);
                        ReceiverRecord.Reset;
                        ReceiverRecord.SetFilter("Job Title", 'Warehouse Associate');
                        ReceiverRecord.SetFilter("Order Shipping Location", ContainerHeader."Location Code");
                        // ReceiverRecord.SetFilter("Code", '<>%1', ReceiverRecord.Code);
                        ReceiverPage.SetTableView(ReceiverRecord);
                        ReceiverPage.Caption('Choose RECEIVER below');
                        if ReceiverPage.RunModal() = Action::LookupOK then
                            ReceiverPage.GetRecord(ReceiverRecord);
                        repeat
                            ContainerHeader."Received By" := ReceiverRecord.Code;
                            ContainerHeader."Received At" := CurrentDateTime;
                            ContainerHeader.Modify(true);
                        until ContainerHeader.Next() = 0;
                    end;
                    CurrPage.Update(true);
                end;
            }
            action("Receiving Report (PO)")
            {
                ApplicationArea = All;
                Caption = 'Receiving Report (PO)';
                Image = Print;
                ToolTip = 'Receiving Report (PO)';
                // Visible = Rec."Open PO Count" <> 0;
                trigger OnAction()
                var
                    ContainerHeader: Record "TPS CMG Container Header";
                    TorlysDocPrint: Codeunit TlyDocumentPrint;
                begin
                    TorlysDocPrint.PrintReceivingPO(Rec);
                end;
            }
            action("Receiving Report (Transfer)")
            {
                ApplicationArea = All;
                Caption = 'Receiving Report (Transfer)';
                Image = Print;
                ToolTip = 'Receiving Report (Transfer)';
                Visible = Rec."Open Transfer Count" <> 0;
                trigger OnAction()
                var
                    ContainerHeader: Record "TPS CMG Container Header";
                    TorlysDocPrint: Codeunit TlyDocumentPrint;
                begin
                    TorlysDocPrint.PrintReceivingTransfer(Rec);
                end;
            }
        }
    }
    views
    {
        addlast
        {
            view(NotComplete)
            {
                Caption = 'Outstanding';
                Filters = where(Status = filter('<>Completely Received'));
                OrderBy = ascending("Expected Receipt Date");
            }
            view(Open)
            {
                Caption = 'Open';
                Filters = where(Status = filter('Open'));
                OrderBy = ascending("Expected Receipt Date");
            }
            view(Released)
            {
                Caption = 'Released';
                Filters = where(Status = filter('Released'));
                OrderBy = ascending("Expected Receipt Date");
            }
            view(CompletlyShipped)
            {
                Caption = 'Completly Shipped';
                Filters = where(Status = filter('Completely Shipped'));
                OrderBy = ascending("Expected Receipt Date");
            }
            view(CompletlyReceived)
            {
                Caption = 'Completly Received';
                Filters = where(Status = filter('Completely Received'));
                OrderBy = ascending("Expected Receipt Date");
            }
            view(TORToday)
            {
                Caption = 'TOR - Today';
                Filters = where("Location Code" = const('TOR'), "Appointment At" = filter('T'));
                OrderBy = ascending("Appointment At");
            }
            // view(TORTomorrow)
            // {
            //     Caption = 'TOR - Tomorrow';
            //     // Filters = where("Location Code" = const('TOR'), "Appointment At" = filter('CreateDateTime(Today + 1, 0T)..CreateDateTime(Today + 1, 24T)'));
            //     Filters = where("Location Code" = const('TOR'), "Appointment At" = field(Display));
            //     OrderBy = ascending("Appointment At");
            // }
            view(TORFuture)
            {
                Caption = 'TOR - Future';
                Filters = where("Location Code" = const('TOR'), "Appointment At" = filter('>T'));
                OrderBy = ascending("Appointment At");
            }
            view(CALToday)
            {
                Caption = 'CAL - Today';
                Filters = where("Location Code" = const('CAL'), "Appointment At" = filter('T'));
                OrderBy = ascending("Appointment At");
            }
            // view(CALTomorrow)
            // {
            //     Caption = 'CAL - Tomorrow';
            //     Filters = where("Location Code" = const('CAL'), "Appointment At" = filter('T+1D'));
            //     OrderBy = ascending("Appointment At");
            // }
            view(CALFuture)
            {
                Caption = 'CAL - Future';
                Filters = where("Location Code" = const('CAL'), "Appointment At" = filter('>T'));
                OrderBy = ascending("Appointment At");
            }
        }
    }
    var
        LookupUserId: Codeunit TlyLookupUserID;
    // BookingNo: Code[20];
    // AppointmentDate: Date;
    // AppointmentTime: Time;
    // AppointmentAt: DateTime;
    // Display: DateTime;

    // trigger OnOpenPage()
    // var
    //     InputDate: Date;
    //     Tomorrow: Date;
    // begin
    //     Rec.SetFilter("Status", '<>Completely Received');
    // end;

    // begin
    //     InputDate := Today();
    //     Tomorrow := CalcDate('<+1D>', InputDate);
    //     // Display := CreateDateTime(Tomorrow, 0T);
    //     Display := CreateDateTime(Today + 1, 0T);
    //     Message('%1', Display);
    // end;

    // trigger OnAfterGetRecord()
    // var
    //     BookingInfo: Record TlyBookingInfo;
    // begin
    //     BookingNo := '';
    //     AppointmentDate := 0D;
    //     AppointmentTime := 0T;
    //     AppointmentAt := 0DT;

    //     BookingInfo.Reset();
    //     if BookingInfo.Get(Rec."No.") then begin
    //         BookingNo := BookingInfo."No.";
    //         AppointmentDate := BookingInfo."Appointment Date";
    //         AppointmentTime := BookingInfo."Appointment Time";
    //         AppointmentAt := BookingInfo."Appointment At";
    //     end;
    // end;
}