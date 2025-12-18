page 51009 TorlysBookingInfo
{
    ApplicationArea = Basic, Suite, Assembly;
    UsageCategory = Lists;
    Caption = 'Booking Info';
    // DataCaptionFields = "No.";
    // Editable = false;
    PageType = List;
    SourceTable = TorlysBookingInfo;

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
}