page 51009 TlyBookingInfo
{
    ApplicationArea = Basic, Suite, Assembly;
    UsageCategory = Lists;
    Caption = 'Booking Info';
    // DataCaptionFields = "No.";
    // Editable = false;
    PageType = List;
    SourceTable = TlyBookingInfo;
    DeleteAllowed = false;
    ModifyAllowed = false;
    // ModifyAllowed = true;
    // InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'No.';
                    ToolTip = 'Booking No.';
                    Editable = false;
                }
                field("Open PO Count"; Rec."Open PO Count")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Open PO Count';
                    ToolTip = 'Open PO Count';
                    Editable = false;
                }
                field("Open Transfer Count"; Rec."Open Transfer Count")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Open Transfer Count';
                    ToolTip = 'Open Transfer Count';
                    Editable = false;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Description';
                    ToolTip = 'Description';
                    Editable = false;
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Appointment Date';
                    ToolTip = 'Appointment Date';
                }

                field("Appointment Time"; Rec."Appointment Time")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Appointment Time';
                    ToolTip = 'Appointment Time';
                }

                field("Received by"; Rec."Received by")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Received by';
                    ToolTip = 'Received by';
                    Editable = false;
                }

                field("Receipt Date"; Rec."Receipt Date")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Receipt Date';
                    ToolTip = 'Receipt Date';
                    Editable = false;
                }

                field("Receipt Time"; Rec."Receipt Time")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Receipt Time';
                    ToolTip = 'Receipt Time';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(BookAppointment; "Book Appointment")
            { }
            actionref(Received; "Warehouse Received")
            { }
            actionref(PrintPreReceivingPurchase; "Pre-Receiving Report (PO)")
            { }
            actionref(PrintPreReceivingTransfer; "Pre-Receiving Report (Transfer)")
            { }
        }
        area(Processing)
        {
            action("Book Appointment")
            {
                Caption = 'Book Appointment';
                ToolTip = 'Book Appointment';
                ApplicationArea = All;
                Image = Calendar;
                trigger OnAction()
                var
                    BookingInfo: Record TlyBookingInfo;
                    DatePage: Page "Date-Time Dialog";
                begin
                    CurrPage.SetSelectionFilter(BookingInfo);
                    if BookingInfo.FindSet() then begin
                        DatePage.LookupMode(true);
                        if DatePage.RunModal() = Action::OK then
                            DatePage.GetRecord(Rec);
                        repeat
                            Rec."Appointment Date" := DatePage.GetDateTime.Date();
                            Rec."Appointment Time" := DatePage.GetDateTime.Time();
                            Rec.Modify(true);
                        // Message('table = %1 popup = %2', Rec."Appointment Date", DatePage.GetDate());
                        until BookingInfo.Next() = 0;
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
                    BookingInfo: Record TlyBookingInfo;
                    ReceiverPage: Page "Salespersons/Purchasers";
                    ReceiverRecord: Record "Salesperson/Purchaser";
                begin
                    CurrPage.SetSelectionFilter(BookingInfo);
                    if BookingInfo.FindSet() then begin
                        ReceiverPage.LookupMode(true);
                        ReceiverRecord.Reset;
                        ReceiverRecord.SetFilter("Job Title", 'Warehouse Associate');
                        // ReceiverRecord.SetFilter("Order Shipping Location", BookingInfo."Location Code");
                        ReceiverRecord.SetFilter("Code", '<>%1', ReceiverRecord.Code);
                        ReceiverPage.SetTableView(ReceiverRecord);
                        ReceiverPage.Caption('Choose RECEIVER below');
                        if ReceiverPage.RunModal() = Action::LookupOK then
                            ReceiverPage.GetRecord(ReceiverRecord);
                        repeat
                            BookingInfo."Received By" := ReceiverRecord.Code;
                            BookingInfo."Receipt Date" := WorkDate();
                            BookingInfo."Receipt Time" := Time;
                            BookingInfo.Modify(true);
                        until BookingInfo.Next() = 0;
                    end;
                    CurrPage.Update(true);
                end;
            }
            action("Pre-Receiving Report (PO)")
            {
                ApplicationArea = All;
                Caption = 'Receiving Report (PO)';
                Image = Print;
                ToolTip = 'Receiving Report (PO)';
                Visible = Rec."Open PO Count" <> 0;
                trigger OnAction()
                var
                    BookingInfo: Record TlyBookingInfo;
                    TorlysDocPrint: Codeunit TlyDocumentPrint;
                begin
                    CurrPage.SetSelectionFilter(BookingInfo);
                    if BookingInfo.Count > 1 then
                        Error('You cannot print multiple pre-receiving reports.')
                    else
                        TorlysDocPrint.PrintReceivingPO(Rec);
                end;
            }
            action("Pre-Receiving Report (Transfer)")
            {
                ApplicationArea = All;
                Caption = 'Receiving Report (Transfer)';
                Image = Print;
                ToolTip = 'Receiving Report (Transfer)';
                Visible = Rec."Open Transfer Count" <> 0;
                trigger OnAction()
                var
                    BookingInfo: Record TlyBookingInfo;
                    TorlysDocPrint: Codeunit TlyDocumentPrint;
                begin
                    CurrPage.SetSelectionFilter(BookingInfo);
                    if BookingInfo.Count > 1 then
                        Error('You cannot print multiple pre-receiving reports.')
                    else
                        TorlysDocPrint.PrintReceivingTransfer(Rec);
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.CalcFields("Open PO Count", "Open Transfer Count");
    end;
}