tableextension 50032 TlyItemLedgerEntry extends "Item Ledger Entry"
{
    fields
    {
        field(50001; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            ToolTip = 'Reason Code';
            FieldClass = FlowField;
            CalcFormula = lookup("Value Entry"."Reason Code" where("Item Ledger Entry No." = field("Entry No.")));
            Editable = false;
        }

        field(50002; "Container No. (TPS)"; Code[20])
        {
            Caption = 'Container No. (TPS)';
            ToolTip = 'Container No. (TPS)';
            FieldClass = FlowField;
            CalcFormula = lookup("Purch. Rcpt. Line"."Container No. (TPS)" where("Document No." = field("Document No."), "Line No." = field("Document Line No.")));
            Editable = false;
        }

        field(50003; "Container No. (NAV)"; Code[25])
        {
            Caption = 'Container No. (NAV)';
            ToolTip = 'Container No. (NAV)';
            FieldClass = FlowField;
            CalcFormula = lookup("Purch. Rcpt. Line"."Container No. (NAV)" where("Document No." = field("Document No."), "Line No." = field("Document Line No.")));
            Editable = false;
        }
    }
}