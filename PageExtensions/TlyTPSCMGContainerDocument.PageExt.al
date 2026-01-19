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

        moveafter("Previous ETA"; "Expected Receipt Date", "BOL No.", "Shipment Method Code", "Vessel No.", "Voyage No.", "Shipping Agent From Port", "Port of loading")

        addafter("Port of loading")
        {
            field("Origin Port Date"; Rec."Origin Port Date")
            {
                Caption = 'Origin Port Date';
                ToolTip = 'Origin Port Date';
                ApplicationArea = All;
            }
        }

        moveafter("Origin Port Date"; "Port of discharge")

        addafter("Port of discharge")
        {
            field("Destination Port Date"; Rec."Destination Port Date")
            {
                Caption = 'Destination Port Date';
                ToolTip = 'Destination Port Date';
                ApplicationArea = All;
            }
            field("Inland Terminal Date"; Rec."Inland Terminal Date")
            {
                Caption = 'Inland Terminal Date';
                ToolTip = 'Inland Terminal Date';
                ApplicationArea = All;
            }
        }

        moveafter("Inland Terminal Date"; "Shipping Status")

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
            Visible = false;
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
    }
    var
        LookupUserId: Codeunit TlyLookupUserID;
}
