table 55002 TlyBillOfLadingHeader
{
    DataClassification = CustomerContent;
    Caption = 'BOL Header';
    Permissions = tabledata "Sales Shipment Header" = rm;

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
            TableRelation = if ("Transaction Type" = const(Shipment)) Customer else if ("Transaction Type" = const(Transfer)) Location;
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Location: Record Location;
            begin
                if Rec."Transaction Type" = Rec."Transaction Type"::Shipment then begin
                    Rec."Ship-to Code" := '';
                    Rec."Ship-to Name" := '';
                    Rec."Ship-to Address" := '';
                    Rec."Ship-to Address 2" := '';
                    Rec."Ship-to City" := '';
                    Rec."Ship-to County" := '';
                    Rec."Ship-to Post Code" := '';
                    Rec."Ship-to Country/Region Code" := '';
                end else if Rec."Transaction Type" = Rec."Transaction Type"::Transfer then begin
                    Rec.SetFilter("Customer No.", "Customer No.");
                    if Rec.Find('-') then begin
                        Error('%1 already exists for this location.', Rec."No.");
                    end else begin
                        if Location.Get("Customer No.") then begin
                            "Ship-to Name" := Location.Name;
                            "Ship-to Address" := Location.Address;
                            "Ship-to Address 2" := Location."Address 2";
                            "Ship-to City" := Location.City;
                            "Ship-to County" := Location.County;
                            "Ship-to Post Code" := Location."Post Code";
                            "Ship-to Country/Region Code" := Location."Country/Region Code";
                        end;
                    end;
                end;
            end;
        }

        field(5; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code where("Customer No." = field("Customer No."));
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                BOLHeader: Record TlyBillOfLadingHeader;
                ShipTo: Record "Ship-to Address";
            begin
                if ("Transaction Type" = "Transaction Type"::Shipment) then begin
                    BOLHeader.SetFilter("Customer No.", "Customer No.");
                    BOLHeader.SetFilter("Ship-to Code", "Ship-to Code");
                    BOLHeader.SetFilter("Location Code", "Location Code");
                    if BOLHeader.Find('-') then begin
                        Error('%1 already exists for this customer/ship-to.', BOLHeader."No.");
                    end else begin
                        if ShipTo.Get("Customer No.", "Ship-to Code") then begin
                            "Ship-to Name" := ShipTo.Name;
                            "Ship-to Address" := ShipTo.Address;
                            "Ship-to Address 2" := ShipTo."Address 2";
                            "Ship-to City" := ShipTo.City;
                            "Ship-to County" := ShipTo.County;
                            "Ship-to Post Code" := ShipTo."Post Code";
                            "Ship-to Country/Region Code" := ShipTo."Country/Region Code";
                            "Shipping Comment" := ShipTo."Shipping Comment";
                        end;
                    end;
                end;
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

        field(10; "Ship-to County"; Text[30])
        {
            Caption = 'Ship-to County';
            DataClassification = CustomerContent;
        }

        field(11; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = CustomerContent;
        }

        field(12; "Ship-to Country/Region Code"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";
        }

        field(13; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }

        field(14; "Shipping Agent Code"; Code[20])
        {
            Caption = 'Shipping Agent Code';
            DataClassification = CustomerContent;
            // TableRelation = "Shipping Agent"; //this is on the form for Agent No. validation
        }

        // field(15; "Freight Type"; Option)
        // {
        //     Caption = 'Freight Type';
        //     OptionMembers = "Prepaid","Collect";
        //     DataClassification = CustomerContent;
        // }

        field(16; "Pickup Date"; Date)
        {
            Caption = 'Pickup Date';
            DataClassification = CustomerContent;
        }

        field(17; "Shipping Instructions 1"; Text[100])
        {
            Caption = 'Shipping Instructions';
            DataClassification = CustomerContent;
        }

        field(18; "Shipping Instructions 2"; Text[50])
        {
            Caption = 'Shipping Instructions 2';
            DataClassification = CustomerContent;
        }

        field(21; "No. of Skids"; Integer)
        {
            Caption = 'No. of Skids';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                UpdatePieceCount();
            end;
        }
        field(22; "No. of Boxes"; Integer)
        {
            Caption = 'No. of Boxes';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                UpdatePieceCount();
            end;
        }
        field(23; "No. of Tubes"; Integer)
        {
            Caption = 'No. of Tubes';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                UpdatePieceCount();
            end;
        }
        field(24; "No. of Packages"; Integer)
        {
            Caption = 'No. of Packages';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                UpdatePieceCount();
            end;
        }
        field(25; "No. of Rolls"; Integer)
        {
            Caption = 'No. of Rolls';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                UpdatePieceCount();
            end;
        }
        field(26; "Piece Count"; text[260])
        {
            Caption = 'Piece Count';
            DataClassification = CustomerContent;
        }

        field(27; "Loaded by"; Code[20])
        {
            Caption = 'Loaded by';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Warehouse Associate'));
        }
        field(28; "Package Tracking No."; Text[50])
        {
            Caption = 'Package Tracking No.';
            DataClassification = CustomerContent;
        }
        field(29; "Weight - Total"; Decimal)
        {
            Caption = 'Weight - Total';
            DecimalPlaces = 2 : 5;
            FieldClass = FlowField;
            CalcFormula = sum(TlyBillOfLadingLine."Total Weight" where("BOL No." = field("No.")));
        }

        field(30; "Weight - Other"; Decimal)
        {
            Caption = 'Weight - Other';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 5;
        }

        field(31; "Weight - Flooring"; Decimal)
        {
            Caption = 'Weight - Flooring';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 5;
        }

        field(32; "Weight - Underlayment Rolls"; Decimal)
        {
            Caption = 'Weight - Underlayment Rolls';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 5;
        }

        field(33; "Weight - Mouldings"; Decimal)
        {
            Caption = 'Weight - Mouldings';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 5;
        }

        field(34; "Cases - Total"; Decimal)
        {
            Caption = 'Cases - Total';
            FieldClass = FlowField;
            CalcFormula = sum(TlyBillOfLadingLine."Total Cases" where("BOL No." = field("No.")));
        }

        field(35; "Cases - Other"; Decimal)
        {
            Caption = 'Cases - Other';
            DataClassification = CustomerContent;
        }

        field(36; "Cases - Flooring"; Decimal)
        {
            Caption = 'Cases - Flooring';
            DataClassification = CustomerContent;
        }

        field(37; "Cases - Underlayment Rolls"; Decimal)
        {
            Caption = 'Cases - Underlayment Rolls';
            DataClassification = CustomerContent;
        }

        field(38; "Cases - Mouldings"; Decimal)
        {
            Caption = 'Cases - Mouldings';
            DataClassification = CustomerContent;
        }

        // field(39; "Base Quantity - Total"; Decimal)
        // {
        //     Caption = 'Base Quantity - Total';
        //     DataClassification = CustomerContent;
        // }

        // field(40; "Base Quantity - Other"; Decimal)
        // {
        //     Caption = 'Base Quantity - Other';
        //     DataClassification = CustomerContent;
        // }

        // field(41; "Base Quantity - Flooring"; Decimal)
        // {
        //     Caption = 'Base Quantity - Flooring';
        //     DataClassification = CustomerContent;
        // }

        // field(42; "Base Qty. - Underlayment Rolls"; Decimal)
        // {
        //     Caption = 'Base Quantity - Underlayment Rolls';
        //     DataClassification = CustomerContent;
        // }

        // field(43; "Base Quantity - Mouldings"; Decimal)
        // {
        //     Caption = 'Base Quantity - Mouldings';
        //     DataClassification = CustomerContent;
        // }

        field(44; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            DataClassification = CustomerContent;
        }

        // field(45; "Created By"; Code[20])
        // {
        //     Caption = 'Created By';
        //     DataClassification = CustomerContent;
        // }

        // field(46; "Created Date"; DateTime)
        // {
        //     Caption = 'Created Date';
        //     DataClassification = CustomerContent;
        // }

        // field(47; "Created Time"; Time)
        // {
        //     Caption = 'Created Time';
        //     DataClassification = CustomerContent;
        // }

        // field(48; "Last Print By"; Code[20])
        // {
        //     Caption = 'Last Print By';
        //     DataClassification = CustomerContent;
        // }

        field(49; "Last Print Date"; DateTime)
        {
            Caption = 'Last Print Date';
            DataClassification = CustomerContent;
        }

        // field(50; "Last Print Time"; Time)
        // {
        //     Caption = 'Last Print Time';
        //     DataClassification = CustomerContent;
        // }

        field(51; "Shipping Comment"; Text[100])
        {
            Caption = 'Shipping Comment';
            DataClassification = CustomerContent;
        }

        // field(52; "Posted Date"; DateTime)
        // {
        //     Caption = 'Posted Date';
        //     DataClassification = CustomerContent;
        // }

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
        UserSetup: Record "User Setup";
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

        if UserSetup.Get(UserId) then "Location Code" := UserSetup."Default Location Code";
        "Pickup Date" := WorkDate(); //auto-populate todays date when creating BOL
        "Package Tracking No." := Rec."No."; //copy tracking number as BOL # as that is what it is most of the time
    end;

    trigger OnDelete()
    var
        BOLLine: Record TlyBillOfLadingLine;
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesHeader: Record "Sales Header";
    begin
        BOLLine.LockTable();

        BOLLine.SetRange("BOL No.", "No.");
        if BOLLine.Find('-') then begin
            repeat
                if SalesShipmentHeader.Get(BOLLine."Shipment No.") then begin
                    SalesShipmentHeader."BOL No." := '';
                    SalesShipmentHeader.Modify();
                end;
                if SalesHeader.Get(1, BOLLine."Order No.") then begin
                    SalesHeader."BOL No." := '';
                    SalesHeader.Modify();
                end;
            until BOLLine.Next = 0;
        end;

        BOLLine.DeleteAll(true);
    end;

    procedure AssistEdit(OldBoLHeader: Record TlyBillOfLadingHeader) Result: Boolean
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        SalesSetup.FindFirst();
        if not SalesSetup.IsEmpty() then
            Rec."No." := NoSeries.GetNextNo(SalesSetup."Bill of Lading Nos.");
        exit(true);
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

}