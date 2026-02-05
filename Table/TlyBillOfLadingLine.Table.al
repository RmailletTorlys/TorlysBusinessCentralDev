table 55003 TlyBillOfLadingLine
{
    DataClassification = CustomerContent;
    Caption = 'BOL Line';
    DrillDownPageId = TlyBillOfLadingList;
    LookupPageId = TlyBillOfLadingList;
    Permissions = tabledata "Sales Shipment Header" = rm;

    fields
    {
        field(1; "BOL No."; Code[20])
        {
            Caption = 'BOL No.';
            TableRelation = TlyBillOfLadingHeader;
            DataClassification = CustomerContent;
        }
        field(2; "BOL Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }

        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = "Customer";
            DataClassification = CustomerContent;
        }

        field(4; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            DataClassification = CustomerContent;
        }

        field(5; "Ship-to Name"; Text[100])
        {
            Caption = 'Ship-to Name';
            DataClassification = CustomerContent;
        }

        field(6; "Ship-to Address"; Text[100])
        {
            Caption = 'Ship-to Address';
            DataClassification = CustomerContent;
        }

        field(7; "Ship-to Address 2"; Text[50])
        {
            Caption = 'Ship-to Address 2';
            DataClassification = CustomerContent;
        }

        field(8; "Ship-to City"; Text[30])
        {
            Caption = 'Ship-to City';
            DataClassification = CustomerContent;
        }

        field(9; "Ship-to County"; Text[30])
        {
            Caption = 'Ship-to County';
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

        field(12; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            TableRelation = "Sales Header";
            DataClassification = CustomerContent;
        }

        field(13; "Shipment No."; Code[20])
        {
            Caption = 'Shipment No.';
            TableRelation = "Sales Shipment Header";
            DataClassification = CustomerContent;
        }

        field(14; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
            DataClassification = CustomerContent;
        }

        field(15; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = CustomerContent;
        }

        field(16; "Shipping Agent Code"; Code[20])
        {
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
            DataClassification = CustomerContent;
        }

        // field(17; "Destination Instruction 1"; Text[50])
        // {
        //     Caption = 'Destination Instruction';
        //     DataClassification = CustomerContent;
        // }

        // field(18; "Destination Instruction 2"; Text[50])
        // {
        //     Caption = 'Destination Instruction 2';
        //     DataClassification = CustomerContent;
        // }

        field(19; "Total Cases"; Decimal)
        {
            Caption = 'Total Cases';
            DataClassification = CustomerContent;
        }

        // field(20; "Total Pallet"; Decimal)
        // {
        //     Caption = 'Total Pallet';
        //     DataClassification = CustomerContent;
        // }

        field(21; "Total Weight"; Decimal)
        {
            Caption = 'Total Weight';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 5;
        }

        // field(22; "Shipping Instructions"; Code[30])
        // {
        //     Caption = 'Shipping Instructions';
        //     DataClassification = CustomerContent;
        //     TableRelation = "Torlys Shipping Instructions";
        // }

        field(23; "Shipping Comment"; Text[50])
        {
            Caption = 'Shipping Comment';
            DataClassification = CustomerContent;
        }

        field(24; "Freight Charges"; Option)
        {
            Caption = 'Freight Charges';
            OptionMembers = " ","Prepaid","Collect";
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "BOL No.", "BOL Line No.")
        {
            Clustered = true;
        }
    }

    var
        SalesHeader: Record "Sales Header";
        SalesShipmentHeader: Record "Sales Shipment Header";
        TransferHeader: Record "Transfer Header";
        TransferShipmentHeader: Record "Transfer Shipment Header";
        BOLHeader: Record TlyBillOfLadingHeader;

    trigger OnInsert()
    begin
        BOLHeader.Get("BOL No.");
        if BOLHeader."No. Printed" > 0 then
            Message('Bill of Lading has been printed prior to adding new lines, Print and Replace BOL on floor!');
    end;

    trigger OnDelete()
    begin

        //warn that you are modifying a printed BOL
        BOLHeader.Get("BOL No.");
        if BOLHeader."No. Printed" > 0 then
            Message('BOL has been printed prior to deleting lines, print and replace BOL on floor!');

        // when deleting line on BOL remove BOL # from sales header
        if SalesHeader.Get(1, Rec."Order No.") then begin
            SalesHeader."BOL No." := '';
            SalesHeader.Modify(true);
        end;

        // when deleting line on BOL remove BOL # from sales shipment header
        if SalesShipmentHeader.Get(Rec."Shipment No.") then begin
            SalesShipmentHeader."BOL No." := '';
            SalesShipmentHeader.Modify(true);
        end;

        // when deleting line on BOL remove BOL # from transfer header
        if TransferHeader.Get(Rec."Order No.") then begin
            TransferHeader."BOL No." := '';
            TransferHeader.Modify(true);
        end;

        // when deleting line on BOL remove BOL # from transfer shipment header
        if TransferShipmentHeader.Get(Rec."Shipment No.") then begin
            TransferShipmentHeader."BOL No." := '';
            TransferShipmentHeader.Modify(true);
        end;

    end;

}