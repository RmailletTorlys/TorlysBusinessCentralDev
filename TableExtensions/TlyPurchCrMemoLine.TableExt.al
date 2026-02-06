tableextension 50125 TlyPurchCrMemoLine extends "Purch. Cr. Memo Line"
{
    fields
    {
        field(50001; "Quantity Case"; Integer)
        {
            Caption = 'Quantity Case';
            DataClassification = CustomerContent;
        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Quantity Pallet';
            DataClassification = CustomerContent;
        }

        field(50003; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Qty. to Receive Case';
            DataClassification = CustomerContent;
        }

        field(50004; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Qty. to Receive Pallet';
            DataClassification = CustomerContent;
        }

        field(50005; "Return Qty. to Ship Case"; Integer)
        {
            Caption = 'Return Qty. to Ship Case';
            DataClassification = CustomerContent;
        }

        field(50006; "Return Qty. to Ship Pallet"; Integer)
        {
            Caption = 'Return Qty. to Ship Pallet';
            DataClassification = CustomerContent;
        }
        field(50007; "Booking No."; Code[20])
        {
            Caption = 'Booking No.';
            DataClassification = CustomerContent;
            TableRelation = TlyBookingInfo;
        }

        field(50008; "SH BOL No."; Code[20])
        {
            Caption = 'SH BOL No.';
            DataClassification = CustomerContent;
        }

        field(50009; "Previous ETA"; Date)
        {
            Caption = 'Previous ETA';
            DataClassification = CustomerContent;
        }

        field(50010; "Possible Loading Date"; Date)
        {
            Caption = 'Possible Loading Date';
            DataClassification = CustomerContent;
        }

        field(50011; "Expected Departure Date"; Date)
        {
            Caption = 'Expected Departure Date';
            DataClassification = CustomerContent;
        }

        field(50012; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
            DataClassification = CustomerContent;
        }

        field(50013; "Production Date"; Date)
        {
            Caption = 'Production Date';
            DataClassification = CustomerContent;
        }
        field(50014; "Confirmation No."; Text[20])
        {
            Caption = 'Confirmation No.';
            DataClassification = CustomerContent;
        }
        field(50015; "Quantity Linked"; Decimal)
        {
            Caption = 'Quantity Linked';
            Editable = false;
            // FieldClass = FlowField;
            // CalcFormula = Sum("Sales Line"."Quantity" where("Linked Purchase Order No." = field("Document No."), "Linked Purch. Order Line No." = field("Line No.")));
        }
        field(50016; "Qty. to Ship Linked"; Decimal)
        {
            Caption = 'Qty. to Ship Linked';
            Editable = false;
            // FieldClass = FlowField;
            // CalcFormula = Sum("Sales Line"."Qty. to Ship" where("Linked Purchase Order No." = field("Document No."), "Linked Purch. Order Line No." = field("Line No.")));
        }
        field(50017; "Container No."; Code[20])
        {
            Caption = 'Container No.';
            Editable = false;
            // FieldClass = FlowField;
            // CalcFormula = lookup("TPS CMG Container Line"."Container No." where("Document No." = field("Document No."), "Document Line No." = field("Line No.")));
        }
        field(50018; "Container No. (NAV)"; Code[25])
        {
            Caption = 'Container No. (NAV)';
            DataClassification = CustomerContent;
        }
        field(50019; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code"';
            DataClassification = CustomerContent;
            TableRelation = "Shipment Method";
        }

        field(50020; "Container No. (TPS)"; Code[20])
        {
            Caption = 'Container No. (TPS)';
            DataClassification = CustomerContent;
            TableRelation = "TPS CMG Container Header";
        }
    }
}