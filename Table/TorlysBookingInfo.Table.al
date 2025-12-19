table 55009 TorlysBookingInfo
{
    DataClassification = CustomerContent;
    Caption = 'Booking Info';
    LookupPageId = TorlysBookingInfo;
    DrillDownPageId = TorlysBookingInfo;

    fields
    {

        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }

        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }

        field(3; "Description"; Text[30])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(4; "Appointment Date"; Date)
        {
            Caption = 'Appointment Date';
            DataClassification = CustomerContent;
        }

        field(5; "Appointment Time"; Time)
        {
            Caption = 'Appointment Time';
            DataClassification = CustomerContent;
        }

        field(6; "Received by"; Code[20])
        {
            Caption = 'Received by';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Warehouse Associate'));
        }

        field(7; "Receipt Date"; Date)
        {
            Caption = 'Receipt Date';
            DataClassification = CustomerContent;
        }

        field(8; "Receipt Time"; Time)
        {
            Caption = 'Receipt Time';
            DataClassification = CustomerContent;
        }
        field(9; "Open PO Count"; Integer)
        {
            Caption = 'Open PO Count';
            FieldClass = FlowField;
            CalcFormula = count("Purchase Line" where("Booking No." = field("No.")));
        }
        field(10; "Open Transfer Count"; Integer)
        {
            Caption = 'Open Transfer Count';
            FieldClass = FlowField;
            CalcFormula = count("Transfer Header" where("Booking No." = field("No.")));
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        PurchSetup.FindFirst();
        if not PurchSetup.IsEmpty() then
            Rec."No." := NoSeries.GetNextNo(PurchSetup."Booking Nos.");
    end;

    procedure AssistEdit(OldBookingInfo: Record TorlysBookingInfo) Result: Boolean
    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        PurchSetup.FindFirst();
        if not PurchSetup.IsEmpty() then
            Rec."No." := NoSeries.GetNextNo(PurchSetup."Booking Nos.");
        exit(true);
    end;
}