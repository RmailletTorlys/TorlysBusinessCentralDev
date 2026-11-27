tableextension 55740 TlyTransferHeader extends "Transfer Header"
{
    DrillDownPageId = "Transfer Orders";

    fields
    {
        field(50001; "Transfer Type"; Enum TlyTransferType)
        {
            Caption = 'Transfer Type';
            DataClassification = CustomerContent;
        }

        field(50002; "Picked By"; Code[20])
        {
            Caption = 'Picked By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Warehouse Associate'));
        }

        field(50003; "Audited By"; Code[20])
        {
            Caption = 'Audited By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Warehouse Associate'));
        }

        field(50004; "Received By"; Code[20])
        {
            Caption = 'Received By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Warehouse Associate'));
        }

        // field(50005; "Put Away By"; Code[20])
        // {
        //     Caption = 'Put Away By';
        //     DataClassification = CustomerContent;
        //     TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Warehouse Associate'));
        // }

        field(50006; "BOL No."; Code[20])
        {
            Caption = 'BOL No.';
            DataClassification = CustomerContent;
        }

        field(50007; "Package Tracking No."; Text[50])
        {
            Caption = 'Package Tracking No.';
            DataClassification = CustomerContent;
        }

        field(50008; "Shipping Comment"; Text[100])
        {
            Caption = 'Shipping Comment';
            DataClassification = CustomerContent;
        }

        field(50009; "Booking No."; Code[20])
        {
            Caption = 'Booking No.';
            DataClassification = CustomerContent;
            // TableRelation = TlyBookingInfo;
            ObsoleteState = Removed;
        }

        field(50010; "Outstanding Quantity"; Decimal)
        {
            Caption = 'Outstanding Quantity';
            FieldClass = FlowField;
            CalcFormula = Sum("Transfer Line"."Outstanding Quantity" where("Document No." = field("No."), "Derived From Line No." = filter(0)));
        }

        field(50011; "Qty. to Ship"; Decimal)
        {
            Caption = 'Qty. to Ship';
            FieldClass = FlowField;
            CalcFormula = Sum("Transfer Line"."Qty. to Ship" where("Document No." = field("No."), "Derived From Line No." = filter(0)));
        }

        field(50012; "Qty. in Transit"; Decimal)
        {
            Caption = 'Qty. in Transit';
            FieldClass = FlowField;
            CalcFormula = Sum("Transfer Line"."Qty. in Transit" where("Document No." = field("No."), "Derived From Line No." = filter(0)));
        }

        // field(50013; "Vendor No."; Code[20])
        // {
        //     Caption = 'Vendor No.';
        //     FieldClass = FlowField;
        //     CalcFormula = lookup("Transfer Line"."Vendor No." where("Document No." = field("No."), "Derived From Line No." = filter(0)));//, "Transfer Type" = filter('Supplier Purchase')));
        //     Description = 'TLY-SD - 11/26/2026';
        // }

        modify("TPS CMG Container No.")
        {
            TableRelation = "TPS CMG Container Header";
            Description = 'TLY-SD - 03/06/2026 - will create a container for transfers, so need to validate against that table';
        }
    }

    trigger OnBeforeDelete()
    var
        TransferLineCount: Record "Transfer Line";
    begin
        // TLY-SD - 03/20/2026 - add this here as an extra check
        // can't delete if there are lines
        TransferLineCount.Reset();
        TransferLineCount.SetRange("Document No.", "No.");
        if TransferLineCount.Find('-') then Error('Must delete lines before deleting header.');
    end;
}