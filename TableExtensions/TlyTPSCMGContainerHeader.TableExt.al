tableextension 59743 TlyTPSCMGContainerHeader extends "TPS CMG Container Header"

{
    LookupPageId = "TPS CMG Container List";
    DrillDownPageId = "TPS CMG Container Document";

    fields
    {
        field(50001; "Port of Loading Date"; Date)
        {
            Caption = 'Port of Loading Date';
            DataClassification = CustomerContent;

            trigger OnValidate() //TLY-SD - 08/19/2026 - per KM
            var
                PurchaseLines: Record "Purchase Line";
                POLinesCount: Integer;
                UpdateDate: Boolean;
            begin
                if Rec."Port of Loading Date" <> xRec."Port of Loading Date" then begin
                    PurchaseLines.SetFilter("Document Type", '=%1', PurchaseLines."Document Type"::Order);
                    PurchaseLines.SetFilter("Container No.", "No.");
                    POLinesCount := PurchaseLines.Count;
                    if POLinesCount > 0 then begin
                        UpdateDate := Dialog.Confirm('Do you want to update the Origin Port Departure Date on %1 Purchase Lines?', true, POLinesCount);
                        if UpdateDate then begin
                            if PurchaseLines.Find('-') then begin
                                repeat
                                    PurchaseLines.SetFilter("Document Type", '=%1', PurchaseLines."Document Type"::Order);
                                    PurchaseLines.SetFilter("Container No.", "No.");
                                    PurchaseLines."Expected Departure Date" := "Port of Loading Date";
                                    PurchaseLines.Modify();
                                until PurchaseLines.Next = 0;
                            end;
                        end;
                    end;
                end;
            end;
        }
        field(50002; "Port of Discharge Date"; Date)
        {
            Caption = 'Port of Discharge Date';
            DataClassification = CustomerContent;
        }
        field(50003; "Inland Terminal"; Text[20])
        {
            Caption = 'Inland Terminal';
            DataClassification = CustomerContent;
            TableRelation = TlyInlandTerminal;
        }
        field(50004; "Inland Terminal Date"; Date)
        {
            Caption = 'Inland Terminal Date';
            DataClassification = CustomerContent;
        }
        field(50005; "Previous ETA"; Date)
        {
            Caption = 'Previous ETA';
            DataClassification = CustomerContent;
        }
        field(50006; "Steamship Line"; Text[20])
        {
            Caption = 'Steamship Line';
            DataClassification = CustomerContent;
            TableRelation = TlySteamshipLine;
        }
        field(50007; "Insurance Certificate No."; Text[30])
        {
            Caption = 'Insurance Certificate No.';
            DataClassification = CustomerContent;
        }
        field(50008; "Freight Forwarder"; Code[20])
        {
            Caption = 'Freight Forwarder';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }

        field(50009; "Crossdock"; Boolean)
        {
            Caption = 'Crossdock';
            DataClassification = CustomerContent;
        }

        field(50010; "ERS"; Boolean)
        {
            Caption = 'ERS';
            DataClassification = CustomerContent;
        }

        field(50011; "Urgent"; Boolean)
        {
            Caption = 'Urgent';
            DataClassification = CustomerContent;
        }

        field(50012; "Strike"; Boolean)
        {
            Caption = 'Strike';
            DataClassification = CustomerContent;
        }

        field(50013; "Vendor No."; Text[20])
        {
            Caption = 'Vendor No.';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }

        field(50014; "Delivery Appointment Date"; Date)
        {
            Caption = 'Delivery Appointment Date';
            DataClassification = CustomerContent;
        }

        field(50015; "Freight Cost"; Decimal)
        {
            Caption = 'Freight Cost';
            DataClassification = CustomerContent;
        }

        field(50016; "Premium Cost"; Decimal)
        {
            Caption = 'Premium Cost';
            DataClassification = CustomerContent;
        }
        field(50017; "Manufacturer Code"; Code[10])
        {
            Caption = 'Manufacturer Code';
            DataClassification = CustomerContent;
            TableRelation = Manufacturer;
        }

        field(50018; "Appointment At"; DateTime)
        {
            Caption = 'Appointment At';
            DataClassification = CustomerContent;
            Description = 'TLY-SD - 03/05/2026 - moving from Booking Info to do it all on the container now';
        }
        field(50019; "Received By"; Code[20])
        {
            Caption = 'Received By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Warehouse Associate'));
            Description = 'TLY-SD - 03/05/2026 - moving from Booking Info to do it all on the container now';
        }
        field(50020; "Received At"; DateTime)
        {
            Caption = 'Received At';
            DataClassification = CustomerContent;
            Description = 'TLY-SD - 03/05/2026 - moving from Booking Info to do it all on the container now';
        }
        // field(50021; "Open PO Count"; Integer)
        // {
        //     Caption = 'Open PO Count';
        //     FieldClass = FlowField;
        //     CalcFormula = count("Purchase Line" where("Container No." = field("No.")));
        // }
        field(50022; "Open Transfer Count"; Integer)
        {
            Caption = 'Open Transfer Count';
            FieldClass = FlowField;
            CalcFormula = count("Transfer Header" where("TPS CMG Container No." = field("No.")));
        }

        modify("Actual Shipment Date")
        {

            trigger OnAfterValidate() //TLY-SD - 08/19/2026 - per KM
            var
                PurchaseLines: Record "Purchase Line";
                POLinesCount: Integer;
                UpdateDate: Boolean;
            begin
                if Rec."Actual Shipment Date" <> xRec."Actual Shipment Date" then begin
                    PurchaseLines.SetFilter("Document Type", '=%1', PurchaseLines."Document Type"::Order);
                    PurchaseLines.SetFilter("Container No.", "No.");
                    POLinesCount := PurchaseLines.Count;
                    if POLinesCount > 0 then begin
                        UpdateDate := Dialog.Confirm('Do you want to update the Shipment Date on %1 Purchase Lines?', true, POLinesCount);
                        if UpdateDate then begin
                            if PurchaseLines.Find('-') then begin
                                repeat
                                    PurchaseLines.SetFilter("Document Type", '=%1', PurchaseLines."Document Type"::Order);
                                    PurchaseLines.SetFilter("Container No.", "No.");
                                    PurchaseLines."Shipment Date" := "Actual Shipment Date";
                                    PurchaseLines.Modify();
                                until PurchaseLines.Next = 0;
                            end;
                        end;
                    end;
                end;
            end;
        }

        modify("Expected Receipt Date")
        {
            trigger OnAfterValidate() //TLY-SD - 08/19/2026 - we did this forever on PO lines, lets do here too
            begin
                Rec."Previous ETA" := xRec."Expected Receipt Date";
            end;
        }
    }
}