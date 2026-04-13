pageextension 59740 TlyTPSCMGContainerDocument extends "TPS CMG Container Document"
{
    layout
    {
        moveafter("No."; Description, "Receipt location", "Container Type")

        addafter("Container Type")
        {
            field("Previous ETA"; Rec."Previous ETA")
            {
                Caption = 'Previous ETA';
                ToolTip = 'Previous ETA';
                ApplicationArea = All;
            }
        }

        moveafter("Previous ETA"; "BOL No.", "Shipment Method Code")

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

        moveafter("Steamship Line"; "Vessel No.", "Voyage No.", "Port of loading", "Port of discharge")

        addafter("Port of discharge")
        {

            field("Inland Terminal"; Rec."Inland Terminal")
            {
                Caption = 'Inland Terminal';
                ToolTip = 'Inland Terminal';
                ApplicationArea = All;
            }
            field("Insurance Certificate No."; Rec."Insurance Certificate No.")
            {
                Caption = 'Insurance Certificate No.';
                ToolTip = 'Insurance Certificate No.';
                ApplicationArea = All;
            }
        }

        moveafter("Insurance Certificate No."; "Shipping Status", Status, "Posting Date", "Actual Shipment Date")

        addafter("Actual Shipment Date")
        {
            field("Port of Loading Date"; Rec."Port of Loading Date")
            {
                Caption = 'Origin Port Departure Date';
                ToolTip = 'Origin Port Departure Date';
                ApplicationArea = All;
            }
            field("Port of Discharge Date"; Rec."Port of Discharge Date")
            {
                Caption = 'Destination Port Arrival Date';
                ToolTip = 'Destination Port Arrival Date';
                ApplicationArea = All;
            }
            field("Inland Terminal Date"; Rec."Inland Terminal Date")
            {
                Caption = 'Inland Terminal Date';
                ToolTip = 'Inland Terminal Date';
                ApplicationArea = All;
            }
        }
        moveafter("Inland Terminal Date"; "Expected Receipt Date")

        addafter("Expected Receipt Date")
        {
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

        addafter(ContanierLine)
        {
            group(Freight)
            {
                Caption = 'Freight';

                field("Vendor No."; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ToolTip = 'Vendor No.';
                    ApplicationArea = All;
                }
                field("Manufacturer Code"; Rec."Manufacturer Code")
                {
                    Caption = 'Manufacturer Code';
                    ToolTip = 'Manufacturer Code';
                    ApplicationArea = All;
                }
                field("Crossdock"; Rec."Crossdock")
                {
                    Caption = 'Crossdock';
                    ToolTip = 'Crossdock';
                    ApplicationArea = All;
                }
                field("ERS"; Rec."ERS")
                {
                    Caption = 'ERS';
                    ToolTip = 'ERS';
                    ApplicationArea = All;
                }
                field("Urgent"; Rec."Urgent")
                {
                    Caption = 'Urgent';
                    ToolTip = 'Urgent';
                    ApplicationArea = All;
                }
                field("Strike"; Rec."Strike")
                {
                    Caption = 'Strike';
                    ToolTip = 'Strike';
                    ApplicationArea = All;
                }
                field("Premium Cost"; Rec."Premium Cost")
                {
                    Caption = 'Premium Cost';
                    ToolTip = 'Premium Cost';
                    ApplicationArea = All;
                }
                field("Freight Cost"; Rec."Freight Cost")
                {
                    Caption = 'Freight Cost';
                    ToolTip = 'Freight Cost';
                    ApplicationArea = All;
                }
            }
            group(WarehouseGrp)
            {
                Caption = 'Warehouse';
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
                // field(BookingNo; BookingNo)
                // {
                //     Caption = 'Booking No.';
                //     ToolTip = 'Booking No.';
                //     ApplicationArea = All;
                //     Editable = false;
                //     trigger OnDrillDown()
                //     var
                //         BookingInfo: Record TlyBookingInfo;
                //     begin
                //         BookingInfo.Reset;
                //         BookingInfo.SetRange("No.", BookingNo);
                //         Page.Run(51009, BookingInfo);
                //     end;
                // }
                // field(AppointmentDate; AppointmentDate)
                // {
                //     Caption = 'Appointment Date';
                //     ToolTip = 'Appointment Date';
                //     ApplicationArea = All;
                //     Editable = false;
                // }
                // field(AppointmentTime; AppointmentTime)
                // {
                //     Caption = 'Appointment Time';
                //     ToolTip = 'Appointment Time';
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
        modify("Shipping Agent From Port")
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
        modify("Total Qty.")
        {
            Importance = Standard;
        }
        modify("Total Weight")
        {
            Importance = Standard;
        }
        modify(WeightPercent)
        {
            Importance = Standard;
        }
        modify("Total Cube")
        {
            Importance = Standard;
        }
        modify(CubePercent)
        {
            Importance = Standard;
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
        modify("Port of loading")
        {
            Caption = 'Origin Port';
        }
        modify("Port of Discharge")
        {
            Caption = 'Destination Port';
        }
        modify("TPS Final Destination Location")
        {
            Visible = false;
        }
    }
    actions
    {
        addlast(Category_Category5)
        {
            actionref(ForceClose_Promoted; "Force Close")
            { }
        }

        addlast(Category_Process)
        {
            actionref(Attachments_Promoted; Attachments)
            { }
        }

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
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                trigger OnAction()
                var
                    DocumentAttachmentRecord: Record "Document Attachment";
                    DocumentAttachmentPage: Page "Document Attachment Details";
                    RecRef: RecordRef; //need this to establish record when attaching
                begin
                    RecRef.GetTable(Rec); //need this to establish record when attaching
                    DocumentAttachmentPage.OpenForRecRef(RecRef); //need this to establish record when attaching
                    DocumentAttachmentRecord.Reset;
                    DocumentAttachmentRecord.SetFilter("Table ID", '70909743');
                    DocumentAttachmentRecord.SetFilter("No.", Rec."No.");
                    DocumentAttachmentRecord.SetFilter("Document Type", 'TPS Container');
                    DocumentAttachmentPage.SetTableView(DocumentAttachmentRecord);
                    DocumentAttachmentPage.RunModal();
                end;
            }
            action("Force Close")
            {
                ApplicationArea = All;
                Caption = 'Force Close';
                Image = Close;
                ToolTip = 'Force Close';
                Visible = (UserDepartment = UserDepartment::IT);
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::"Completely Received";
                    Rec.Modify();
                end;
            }
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
                            Rec.Validate(Rec."Expected Receipt Date", DT2Date(DatePage.GetDateTime())); //update Expected Receipt Date when Appotinment booked
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

        modify("Create &Whse. Receipt")
        {
            Visible = false;
        }

        modify("&Whse. Receipts")
        {
            Visible = false;
        }

        modify(ShipContainer)
        {
            Visible = Rec."Location Code" <> 'DIRECT';
        }

        modify(ReceiveContainer)
        {
            Visible = Rec."Location Code" <> 'DIRECT';
        }
        modify(UndoShipContainer)
        {
            Visible = Rec."Location Code" <> 'DIRECT';
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
        UserDepartment: Enum TlyUserDepartment;
    // BookingNo: Code[20];
    // AppointmentDate: Date;
    // AppointmentTime: Time;
    // AppointmentAt: DateTime;

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

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId) then
            UserDepartment := UserSetup.Department;
    end;
}
