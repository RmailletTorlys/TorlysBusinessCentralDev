pageextension 59740 TlyTPSCMGContainerDocument extends "TPS CMG Container Document"
{
    layout
    {
        moveafter("No."; Description, "Receipt location", "Posting Date", "Container Type")

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
                Caption = 'Origin Port Departure Date';
                ToolTip = 'Origin Port Departure Date';
                ApplicationArea = All;
            }
        }

        moveafter("Port of Loading Date"; "Port of discharge")

        addafter("Port of discharge")
        {
            field("Port of Discharge Date"; Rec."Port of Discharge Date")
            {
                Caption = 'Destination Port Arrival Date';
                ToolTip = 'Destination Port Arrival Date';
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

                field(AppointmentDate; AppointmentDate)
                {
                    Caption = 'Appointment Date';
                    ToolTip = 'Appointment Date';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(AppointmentTime; AppointmentTime)
                {
                    Caption = 'Appointment Date';
                    ToolTip = 'Appointment Date';
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
        modify("TPS Final Destination Location")
        {
            Visible = false;
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
        modify("Shipping Agent From Port")
        {
            Visible = false;
        }
        modify("Port of loading")
        {
            Caption = 'Origin Port';
        }
        modify("Port of Discharge")
        {
            Caption = 'Destination Port';
        }
    }
    var
        LookupUserId: Codeunit TlyLookupUserID;
        AppointmentDate: Date;
        AppointmentTime: Time;

    trigger OnAfterGetRecord()
    var
        BookingInfo: Record TlyBookingInfo;
    begin
        BookingInfo.Reset();
        if BookingInfo.Get(Rec."No.") then begin
            AppointmentDate := BookingInfo."Appointment Date";
            AppointmentTime := BookingInfo."Appointment Time";
        end;
    end;
}
