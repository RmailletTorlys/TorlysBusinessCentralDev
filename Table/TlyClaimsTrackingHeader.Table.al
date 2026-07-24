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

        field(12; "Original Invoice No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Invoice No.';
            TableRelation = "Sales Invoice Header"."No." where("Sell-to Customer No." = field("Sell-to Customer No."));
            trigger OnValidate()
            var
                SalesInvHead: Record "Sales Invoice Header";
                Salesperson: Record "Salesperson/Purchaser";
            begin
                // SalesInvHead.Reset();
                // SalesInvHead.SetRange("No.", Rec."Original Invoice No.");
                SalesInvHead.Get(Rec."Original Invoice No.");
                // if Find('-') then begin
                Rec."Ship-to Code" := SalesInvHead."Ship-to Code";
                Rec."Original Invoice Date" := SalesInvHead."Posting Date";
                Rec."Original Shipment Date" := SalesInvHead."Shipment Date";
                Rec."Original Order No." := SalesInvHead."Order No.";
                Rec."Original Order Date" := SalesInvHead."Order Date";
                Rec."External Document No." := SalesInvHead."External Document No.";
                Rec."Tag Name" := SalesInvHead."Tag Name";
                Rec."Location Code" := SalesInvHead."Location Code";
                Rec."Salesperson Code" := SalesInvHead."Salesperson Code";

                Salesperson.Reset;
                Salesperson.SetRange(Code, Rec."Salesperson Code");
                if Salesperson.Find('-') then
                    Rec."Sales Manager Code" := Salesperson.Manager;
                // end;
            end;
        }

        field(13; "Original Invoice Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Invoice Date';
            Editable = false;
        }

        field(14; "Original Shipment Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Shipment Date';
            Editable = false;
        }

        field(15; "Original Order Date"; Date)
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
        field(20; "Original Order No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Order No.';
            Editable = false;
        }

        field(21; "Salesperson Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Flooring Consultant'));
            trigger OnValidate()
            var
                Salesperson: Record "Salesperson/Purchaser";
            begin
                Salesperson.Reset;
                Salesperson.SetRange(Code, Rec."Salesperson Code");
                if Salesperson.Find('-') then
                    Rec."Sales Manager Code" := Salesperson.Manager;
            end;
        }

        field(22; "Sales Manager Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Sales Manager Code';
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Flooring Consultant'));
        }
        field(23; "Claim Input Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Claim Input Date';
        }
        field(24; "Consumer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Consumer Name';
        }
        field(25; "Consumer Address"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Consumer Address';
        }
        field(26; "Consumer Address 2"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Consumer Address 2';
        }
        field(27; "Consumer City"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Consumer City';
        }
        field(28; "Consumer County"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Consumer County';
        }
        field(29; "Consumer Country/Region Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Consumer Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(30; "Consumer Contact"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Consumer Contact';
        }
        field(31; "Consumer Phone No."; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Consumer Phone No.';
        }
        field(32; "Status"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
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