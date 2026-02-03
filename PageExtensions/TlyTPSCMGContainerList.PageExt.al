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

        moveafter("Steamship Line"; "Vessel No.", "Voyage No.", "Shipping Agent From Port", "Port of loading")

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

        moveafter("Insurance Certificate No."; "Shipping Status")

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
            Importance = Standard;
        }

        modify("Total Cube")
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
    }
    var
        LookupUserId: Codeunit TlyLookupUserID;
}