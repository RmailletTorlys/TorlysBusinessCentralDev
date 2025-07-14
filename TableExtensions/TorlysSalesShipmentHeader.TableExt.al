tableextension 50043 TorlysSalesShipmentHeader extends "Sales Shipment Header"
{
    fields
    {
        field(50001; "Salesperson Commission"; Decimal)
        {
            Caption = 'Salesperson Commission';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50002; "Salesperson Code 2"; code[20])
        {
            Caption = 'Salesperson Code 2';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }

        field(50003; "Salesperson Commission 2"; Decimal)
        {
            Caption = 'Salesperson Commission 2';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50004; "Salesperson Code 3"; code[20])
        {
            Caption = 'Salesperson Code 3';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }

        field(50005; "Salesperson Commission 3"; Decimal)
        {
            Caption = 'Salesperson Commission 3';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50006; "Order Time"; Time)
        {
            Caption = 'Order Time';
            DataClassification = CustomerContent;
        }

        field(50007; "Order Type"; Code[20])
        {
            Caption = 'Order Type';
            TableRelation = "Torlys Lookup Values";
            DataClassification = CustomerContent;
        }

        field(50008; "Tag Name"; code[20])
        {
            Caption = 'Tag Name';
            DataClassification = CustomerContent;
        }

        field(50009; "Temporary Hold"; Boolean)
        {
            Caption = 'Temporary Hold';
            DataClassification = CustomerContent;
        }

        field(50010; "No. Pick Lists Printed"; Integer)
        {
            Caption = 'No. Pick Lists Printed';
            DataClassification = CustomerContent;
        }

        field(50011; "Pick Slip Printed By"; code[20])
        {
            Caption = 'Pick Slip Printed By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50012; "Pick Slip Printed Date"; Date)
        {
            Caption = 'Pick Slip Printed Date';
            DataClassification = CustomerContent;
        }

        field(50013; "Pick Slip Printed Time"; Time)
        {
            Caption = 'Pick Slip Printed Time';
            DataClassification = CustomerContent;
        }

        field(50014; "Popup Modify By"; code[20])
        {
            Caption = 'Popup Modify By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50015; "Popup Modify Date"; Date)
        {
            Caption = 'Popup Modify Date';
            DataClassification = CustomerContent;
        }

        field(50016; "Popup Modify Time"; Time)
        {
            Caption = 'Popup Modify Time';
            DataClassification = CustomerContent;
        }

        field(50017; "Released"; Boolean)
        {
            Caption = 'Released';
            DataClassification = CustomerContent;
        }

        field(50020; "Qty. To ship"; Decimal)
        {
            Caption = 'Qty. To ship';
            CalcFormula = Sum("Sales Line"."Qty. to Ship" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }

        field(50021; "Outstanding Quantity"; Decimal)
        {
            Caption = 'Outstanding Quantity';
            CalcFormula = Sum("Sales Line"."Outstanding Quantity" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }

        field(50022; "Roll out Order"; Boolean)
        {
            Caption = 'Roll out Order';
            DataClassification = CustomerContent;
        }

        field(50023; "CM Accuracy Approval By"; code[20])
        {
            Caption = 'CM Accuracy Approval By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50024; "CM Accuracy Approval Date"; Date)
        {
            Caption = 'CM Accuracy Approval Date';
            DataClassification = CustomerContent;
        }

        field(50025; "Do Not Mail Credit Note"; Boolean)
        {
            Caption = 'Do Not Mail Credit Note';
            DataClassification = CustomerContent;
        }

        field(50026; "Warehouse Associate Picked By"; code[20])
        {
            Caption = 'Warehouse Associate Picked By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50027; "Warehouse Associate Checked By"; code[20])
        {
            Caption = 'Warehouse Associate Checked By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50028; "Freight Zone Code"; Code[20])
        {
            Caption = 'Freight Zone Code';
            DataClassification = CustomerContent;
            TableRelation = "Torlys Freight Zones";

        }

        field(50029; "CM Approved By"; code[20])
        {
            Caption = 'CM Approved By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50030; "CM Approved Date"; Date)
        {
            Caption = 'CM Approved Date';
            DataClassification = CustomerContent;
        }

        field(50031; "Order Method"; Code[20])
        {
            Caption = 'Order Method';
            DataClassification = CustomerContent;
            TableRelation = "Torlys Lookup Values";
        }

        field(50032; "Total Excl. Tax"; Decimal)
        {
            Caption = 'Total Excl. Tax';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }

        field(50033; "Total Tax"; Decimal)
        {
            Caption = 'Total Tax';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }

        field(50034; "Total Incl. Tax"; Decimal)
        {
            Caption = 'Total Incl. Tax';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }

        field(50035; "To ship"; Boolean)
        {
            Caption = 'To ship';
            DataClassification = CustomerContent;
        }

        field(50036; "Region Code"; Code[10])
        {
            Caption = 'Region Code';
            DataClassification = CustomerContent;
        }

        field(50037; "Shipping Advice"; Text[250])
        {
            Caption = 'Shipping Advice';
            DataClassification = CustomerContent;
        }

    }

}