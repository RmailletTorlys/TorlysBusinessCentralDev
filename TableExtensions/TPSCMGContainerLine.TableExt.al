tableextension 59742 TlyTPSCMGContainerLine extends "TPS CMG Container Line"

{
    fields
    {
        field(50001; "Quantity Linked"; Decimal)
        {
            Caption = 'Quantity Linked';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Quantity" where("Linked Purchase Order No." = field("Document No."), "Linked Purch. Order Line No." = field("Document Line No.")));
        }
        field(50002; "Qty. to Ship Linked"; Decimal)
        {
            Caption = 'Qty. to Ship Linked';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Qty. to Ship" where("Linked Purchase Order No." = field("Document No."), "Linked Purch. Order Line No." = field("Document Line No.")));
        }
    }
}