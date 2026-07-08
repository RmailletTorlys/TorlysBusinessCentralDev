table 55007 TlyClaimsTrackingHeader
{
    DataClassification = CustomerContent;
    Caption = 'Claims Tracking';

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }

        field(2; "Sell-to Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Customer No.';
            TableRelation = Customer;
        }

        field(3; "Sell-to Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Customer Name';
        }

        field(4; "Sell-to Customer Name 2"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Customer Name 2';
        }

        field(5; "Sell-to Address"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Address';
        }

        field(6; "Sell-to Address 2"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Address 2';
        }

        field(7; "Sell-to City"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to City';
        }

        field(8; "Sell-to Post Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Post Code';
        }

        field(9; "Sell-to County"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Country/Region Code';
        }

        field(10; "Sell-to Country/Region Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Sell-to Country/Region Code';
        }

        field(11; "Ship-to Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Ship-to Code';
            Editable = false;
        }

        field(12; "Invoice No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Invoice No.';
            TableRelation = "Sales Invoice Header"."No." where("Sell-to Customer No." = field("Sell-to Customer No."));
            trigger OnValidate()
            var
                SalesInvHead: Record "Sales Invoice Header";
            begin
                // SalesInvHead.Reset();
                // SalesInvHead.SetRange("No.", Rec."Original Invoice No.");
                SalesInvHead.Get(Rec."Invoice No.");
                // if Find('-') then begin
                Rec."Ship-to Code" := SalesInvHead."Ship-to Code";
                Rec."Invoice Date" := SalesInvHead."Posting Date";
                Rec."Shipment Date" := SalesInvHead."Shipment Date";
                Rec."Order No." := SalesInvHead."Order No.";
                Rec."Order Date" := SalesInvHead."Order Date";
                Rec."External Document No." := SalesInvHead."External Document No.";
                Rec."Tag Name" := SalesInvHead."Tag Name";
                Rec."Location Code" := SalesInvHead."Location Code";
                // end;
            end;
        }

        field(13; "Invoice Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Invoice Date';
            Editable = false;
        }

        field(14; "Shipment Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Shipment Date';
            Editable = false;
        }

        field(15; "Order Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Order Date';
            Editable = false;
        }

        field(16; "External Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'External Document No.';
            Editable = false;
        }

        field(17; "Tag Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Tag Name';
            Editable = false;
        }

        field(18; "Location Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Location Code';
            Editable = false;
        }
        field(19; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(20; "Order No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Order No.';
            Editable = false;
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
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        SalesSetup.FindFirst();
        if not SalesSetup.IsEmpty() then
            Rec."No." := NoSeries.GetNextNo(SalesSetup."Claims Tracking Nos.");
    end;

    procedure AssistEdit(OldClaimHeader: Record TlyClaimsTrackingHeader) Result: Boolean
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        SalesSetup.FindFirst();
        if not SalesSetup.IsEmpty() then
            Rec."No." := NoSeries.GetNextNo(SalesSetup."Claims Tracking Nos.");
        exit(true);
    end;
}