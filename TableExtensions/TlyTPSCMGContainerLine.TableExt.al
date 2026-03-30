tableextension 59742 TlyTPSCMGContainerLine extends "TPS CMG Container Line"

{
    fields
    {
        field(50001; "Quantity Linked via PO"; Decimal)
        {
            Caption = 'Quantity Linked via PO';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Quantity" where("Linked Purchase Order No." = field("Document No."), "Linked Purch. Order Line No." = field("Document Line No.")));
        }
        field(50002; "Qty. to Ship Linked via PO"; Decimal)
        {
            Caption = 'Qty. to Ship Linked via PO';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Qty. to Ship" where("Linked Purchase Order No." = field("Document No."), "Linked Purch. Order Line No." = field("Document Line No.")));
        }
        field(50003; "Transfer Order No."; Code[20])
        {
            Caption = 'Transfer Order No.';
            Editable = false;
            FieldClass = FlowField;
            // CalcFormula = lookup("Transfer Header"."No." where("TPS CMG Container No." = field("Container No.")));
            CalcFormula = lookup("Transfer Line"."Document No." where("TPS CMG Container No." = field("Container No."), "TPS CMG Container Line No." = field("Line No.")));
        }
        field(50004; "Transfer Order Line No."; Integer)
        {
            Caption = 'Transfer Order No.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Transfer Line"."Line No." where("TPS CMG Container No." = field("Container No."), "TPS CMG Container Line No." = field("Line No.")));
        }
        field(50005; "Quantity Linked via TO"; Decimal)
        {
            Caption = 'Quantity Linked via TO';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Quantity" where("Linked Transfer Order No." = field("Transfer Order No."), "Linked Transfer Order Line No." = field("Transfer Order Line No.")));
        }
        field(50006; "Qty. to Ship Linked via TO"; Decimal)
        {
            Caption = 'Qty. to Ship Linked via TO';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Qty. to Ship" where("Linked Transfer Order No." = field("Transfer Order No."), "Linked Transfer Order Line No." = field("Transfer Order Line No.")));
        }
    }
}