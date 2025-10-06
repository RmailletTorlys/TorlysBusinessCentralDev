table 55002 "Torlys BOL Header"
{
    DataClassification = CustomerContent;
    Caption = 'Torlys BOL Header';

    fields
    {

        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(2; "Transaction Type"; Option)
        {
            Caption = 'Transaction Type';
            OptionMembers = "Shipment","Transfer";
            DataClassification = CustomerContent;
        }

        field(3; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(4; "Customer No."; Code[10])
        {
            Caption = 'Customer No.';
            TableRelation = "Customer";
            DataClassification = CustomerContent;
        }

        field(5; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code where("Customer No." = field("Customer No."));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                OnAfterLookupOnSetShipToInfo("Ship-to Code");
            end;
        }

        field(6; "Ship-to Name"; Text[100])
        {
            Caption = 'Ship-to Name';
            DataClassification = CustomerContent;
        }

        field(7; "Ship-to Address"; Text[100])
        {
            Caption = 'Ship-to Address';
            DataClassification = CustomerContent;
        }

        field(8; "Ship-to Address 2"; Text[50])
        {
            Caption = 'Ship-to Address 2';
            DataClassification = CustomerContent;
        }

        field(9; "Ship-to City"; Text[30])
        {
            Caption = 'Ship-to City';
            DataClassification = CustomerContent;
        }

        field(10; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = CustomerContent;
        }

        field(11; "Ship-to Country/Region Code"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            DataClassification = CustomerContent;
        }

        field(12; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }

        field(13; "Shipping Agent Code"; Code[20])
        {
            Caption = 'Shipping Agent Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipping Agent";
        }

        field(14; "Freight Type"; Option)
        {
            Caption = 'Freight Type';
            OptionMembers = "Prepaid","Collect";
            DataClassification = CustomerContent;
        }

        field(15; "Pickup Date"; Date)
        {
            Caption = 'Pickup Date';
            DataClassification = CustomerContent;
        }

        field(16; "Shipping Instructions 1"; Text[50])
        {
            Caption = 'Shipping Instructions 1';
            DataClassification = CustomerContent;
        }

        field(17; "Shipping Instructions 2"; Text[50])
        {
            Caption = 'Shipping Instructions 2';
            DataClassification = CustomerContent;
        }
        field(18; "Shipping Instructions 3"; Text[50])
        {
            Caption = 'Shipping Instructions 3';
            DataClassification = CustomerContent;
        }
        field(19; "Shipping Instructions 4"; Text[50])
        {
            Caption = 'Shipping Instructions 4';
            DataClassification = CustomerContent;
        }

        field(20; "No. of Skids"; Integer)
        {
            Caption = 'No. of Skids';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                UpdatePieceCount();
            end;
        }

        field(21; "No. of Boxes"; Integer)
        {
            Caption = 'No. of Boxes';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                UpdatePieceCount();
            end;
        }

        field(22; "No. of Tubes"; Integer)
        {
            Caption = 'No. of Tubes';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                UpdatePieceCount();
            end;
        }

        field(23; "No. of Packages"; Integer)
        {
            Caption = 'No. of Packages';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                UpdatePieceCount();
            end;
        }

        field(24; "No. of Rolls"; Integer)
        {
            Caption = 'No. of Rolls';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                UpdatePieceCount();
            end;
        }

        field(25; "Piece Count"; text[260])
        {
            Caption = 'Piece Count';
            DataClassification = CustomerContent;
        }

        field(26; "Warehouse Associate Loaded by"; Code[20])
        {
            Caption = 'Warehouse Associate Loaded by';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";
        }

        field(27; "Carrier Tracking No."; Code[15])
        {
            Caption = 'Carrier Tracking No.';
            DataClassification = CustomerContent;
        }

        field(28; "Weight - Total"; Decimal)
        {
            Caption = 'Weight-Total';
            DataClassification = CustomerContent;
        }

        field(29; "Weight - Other"; Decimal)
        {
            Caption = 'Weight-Other';
            DataClassification = CustomerContent;
        }

        field(30; "Weight - Flooring"; Decimal)
        {
            Caption = 'Weight - Flooring';
            DataClassification = CustomerContent;
        }

        field(31; "Weight - Underlayment Rolls"; Decimal)
        {
            Caption = 'Weight - Underlayment Rolls';
            DataClassification = CustomerContent;
        }

        field(32; "Weight - Mouldings"; Decimal)
        {
            Caption = 'Weight - Mouldings';
            DataClassification = CustomerContent;
        }

        field(33; "Cases - Total"; Decimal)
        {
            Caption = 'Cases - Total';
            DataClassification = CustomerContent;
        }

        field(34; "Cases - Other"; Decimal)
        {
            Caption = 'Cases - Other';
            DataClassification = CustomerContent;
        }

        field(35; "Cases - Flooring"; Decimal)
        {
            Caption = 'Cases - Flooring';
            DataClassification = CustomerContent;
        }

        field(36; "Cases - Underlayment Rolls"; Decimal)
        {
            Caption = 'Cases - Underlayment Rolls';
            DataClassification = CustomerContent;
        }

        field(37; "Cases - Mouldings"; Decimal)
        {
            Caption = 'Cases - Mouldings';
            DataClassification = CustomerContent;
        }

        field(38; "Base Quantity - Total"; Decimal)
        {
            Caption = 'Base Quantity - Total';
            DataClassification = CustomerContent;
        }

        field(39; "Base Quantity - Other"; Decimal)
        {
            Caption = 'Base Quantity - Other';
            DataClassification = CustomerContent;
        }

        field(40; "Base Quantity - Flooring"; Decimal)
        {
            Caption = 'Base Quantity - Flooring';
            DataClassification = CustomerContent;
        }

        field(41; "Base Qty. - Underlayment Rolls"; Decimal)
        {
            Caption = 'Base Quantity - Underlayment Rolls';
            DataClassification = CustomerContent;
        }

        field(42; "Base Quantity - Mouldings"; Decimal)
        {
            Caption = 'Base Quantity - Mouldings';
            DataClassification = CustomerContent;
        }

        field(43; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            DataClassification = CustomerContent;
        }

        field(44; "Created By"; Code[20])
        {
            Caption = 'Created By';
            DataClassification = CustomerContent;
        }

        field(45; "Created Date"; DateTime)
        {
            Caption = 'Created Date';
            DataClassification = CustomerContent;
        }

        field(46; "Created Time"; Time)
        {
            Caption = 'Created Time';
            DataClassification = CustomerContent;
        }

        field(47; "Last Print By"; Code[20])
        {
            Caption = 'Last Print By';
            DataClassification = CustomerContent;
        }

        field(48; "Last Print Date"; DateTime)
        {
            Caption = 'Last Print Date';
            DataClassification = CustomerContent;
        }

        field(49; "Last Print Time"; Time)
        {
            Caption = 'Last Print Time';
            DataClassification = CustomerContent;
        }

        field(50; "Shipping Comment"; Text[50])
        {
            Caption = 'Shipping Comment';
            DataClassification = CustomerContent;
        }

        field(51; "Posted Date"; DateTime)
        {
            Caption = 'Posted Date';
            DataClassification = CustomerContent;
        }

        field(53; "Freight Charges"; Option)
        {
            Caption = 'Freight Charges';
            OptionMembers = "","Prepaid","Collect";
            DataClassification = CustomerContent;
        }


    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        PieceCount: Text[260];
        SkidCount: Text[50];
        BoxCount: Text[50];
        TubeCount: Text[50];
        PackageCount: Text[50];
        RollCount: Text[50];

    trigger OnInsert()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";

    begin

        SalesSetup.FindFirst();
        if not SalesSetup.IsEmpty() then
            Rec."No." := NoSeries.GetNextNo(SalesSetup."Bill of Lading Nos.");

        "Pickup Date" := WorkDate() //auto-populate todays date when creating BOL
    end;


    procedure AssistEdit(OldBoLHeader: Record "Torlys BoL Header") Result: Boolean
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
        IsHandled: Boolean;

    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, OldBoLHeader, IsHandled, Result);
        if IsHandled then
            exit;

        SalesSetup.FindFirst();
        if not SalesSetup.IsEmpty() then
            Rec."No." := NoSeries.GetNextNo(SalesSetup."Bill of Lading Nos.");

        exit(true);
    end;


    local procedure OnAfterLookupOnSetShipToInfo(ShipToCode: Code[10])
    var
        ShipTo: Record "Ship-to Address";
        IsHandled: Boolean;

    begin
        OnBeforeOnAfterLookupOnSetShipToInfo(ShipToCode, IsHandled);
        if IsHandled then
            exit;

        if Rec."Ship-to Code" = '' then begin
            Rec."Ship-to Name" := '';
            Rec."Ship-to Address" := '';
            Rec."Ship-to Address 2" := '';
            Rec."Ship-to City" := '';
            Rec."Ship-to Post Code" := '';
            exit;
        end;

        ShipTo.Reset();
        ShipTo.SetRange("Customer No.", Rec."Customer No.");
        ShipTo.SetRange(Code, Rec."Ship-to Code");


        if ShipTo.FindFirst() then begin
            Rec."Ship-to Name" := ShipTo."Name";
            Rec."Ship-to Address" := ShipTo."Address";
            Rec."Ship-to Address 2" := ShipTo."Address 2";
            Rec."Ship-to City" := ShipTo."City";
            Rec."Ship-to Post Code" := ShipTo."Post Code";
            //Rec."Destination Instructions" := ShipTo."Destination Instructions"; //Change to come from the order



        end else
            Message('No ship-to address found for the selected Ship-to Code. Please verify and try again');

        OnAfterOnAfterLookupOnSetShipToInfo(ShipToCode);

    end;





    local procedure UpdatePieceCount()
    begin
        //Create a Message that only displays the content item if gt 0


        if Rec."No. of Skids" > 0 then begin
            SkidCount := Rec."No. of Skids".ToText() + ' Skid /';
            if Rec."No. of Skids" > 1 then
                SkidCount := Rec."No. of Skids".ToText() + ' Skids /';
        end;


        if Rec."No. of Boxes" > 0 then begin
            BoxCount := Rec."No. of Boxes".ToText() + ' Box /';
            if Rec."No. of Boxes" > 1 then
                BoxCount := Rec."No. of Boxes".ToText() + ' Boxes /';
        end;

        if Rec."No. of Tubes" > 0 then begin
            TubeCount := Rec."No. of Tubes".ToText() + ' Tube /';
            if Rec."No. of Tubes" > 1 then
                TubeCount := Rec."No. of Tubes".ToText() + ' Tubes /';
        end;

        if Rec."No. of Packages" > 0 then begin
            PackageCount := Rec."No. of Packages".ToText() + ' Package /';
            if Rec."No. of Packages" > 1 then
                PackageCount := Rec."No. of Packages".ToText() + ' Packages /';
        end;

        if Rec."No. of Rolls" > 0 then begin
            RollCount := Rec."No. of Rolls".ToText() + ' Roll';
            if Rec."No. of Rolls" > 1 then
                RollCount := Rec."No. of Rolls".ToText() + ' Rolls';
        end;

        PieceCount := SkidCount + BoxCount + TubeCount + PackageCount + RollCount;

        Rec."Piece Count" := PieceCount;

    end;

    procedure UpdateFreightChartOnShipAgentCode(AgentCode: Code[20])
    var
        ShipAgent: Record "Shipping Agent";
    begin

        ShipAgent.Reset();
        ShipAgent.SetRange("Code", AgentCode);
        ShipAgent.FindFirst();
        Rec."Freight Charges" := ShipAgent."Freight Charges";

    end;

    procedure PrintOpenBOL(BoLNo: Code[20])
    var
        PrintBill: Codeunit "Print Bill of Lading Document";
        Usage: Option "Bill of Lading Report";
    begin
        Rec.SetRange("No.", BoLNo);
        if Rec.FindFirst() then
            PrintBill.PrintBoLOrder(Rec, Usage::"Bill of Lading Report");
    end;



    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnAfterLookupOnSetShipToInfo(ShipToCode: Code[10]; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnAfterLookupOnSetShipToInfo(ShipToCode: Code[10])
    begin
    end;



    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(Rec: Record "Torlys BOL Header"; OldSalesHeader: Record "Torlys BOL Header"; var IsHandled: Boolean; var Result: Boolean)
    begin
    end;

}