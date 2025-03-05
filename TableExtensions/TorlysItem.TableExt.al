tableextension 50101 TorlysItem extends Item
{
    fields
    {
        field(50001; "New Item"; Boolean)
        {
            Caption = 'New Item';
            DataClassification = CustomerContent;
        }

        field(50002; "Current Item"; Boolean)
        {
            Caption = 'Current Item';
            DataClassification = CustomerContent;
        }

        field(50003; "Special Item"; Boolean)
        {
            Caption = 'Special Item';
            DataClassification = CustomerContent;
        }

        field(50004; "Clearance Item"; Boolean)
        {
            Caption = 'Clearance Item';
            DataClassification = CustomerContent;
        }

        field(50005; "Discontinued Item"; Boolean)
        {
            Caption = 'Discontinued Item';
            DataClassification = CustomerContent;
        }

        field(50006; "Discontinued Date"; Date)
        {
            Caption = 'Discontinued Date';
            DataClassification = CustomerContent;
        }

        field(50007; "Freigt Item"; Boolean)
        {
            Caption = 'Freigt Item';
            DataClassification = CustomerContent;
        }

        field(50008; "Misc. Item"; Boolean)
        {
            Caption = 'Misc. Item';
            DataClassification = CustomerContent;
        }

        field(50009; "Critical Display Item"; Boolean)
        {
            Caption = 'Critical Display Item';
            DataClassification = CustomerContent;
        }

        field(50010; "SC Review Item"; Boolean)
        {
            Caption = 'sc Review Item';
            DataClassification = CustomerContent;
        }

        field(50011; "SC Review Date"; Date)
        {
            Caption = 'SC Review Date';
            DataClassification = CustomerContent;
        }

        field(50012; "FOC Item"; Boolean)
        {
            Caption = 'FOC Item';
            DataClassification = CustomerContent;
        }

        field(50013; "Phase Out Item"; Boolean)
        {
            Caption = 'Phase Out Item';
            DataClassification = CustomerContent;
        }

        field(50014; "Phase Out Date"; Date)
        {
            Caption = 'Phase Out Date';
            DataClassification = CustomerContent;
        }

        field(50015; "High Shade Variation"; Boolean)
        {
            Caption = 'High Shade Variation';
            DataClassification = CustomerContent;
        }

        field(50016; "Automatically Allocate"; Boolean)
        {
            Caption = 'Automatically Allocate';
            DataClassification = CustomerContent;
        }

        field(50017; "Allow SO Unit Cost Edit"; Boolean)
        {
            Caption = 'Allow SO Unit Cost Edit';
            DataClassification = CustomerContent;
        }

        field(50018; "Focus Item"; Boolean)
        {
            Caption = 'Focus Item';
            DataClassification = CustomerContent;
        }

        field(50019; "In Catalogue"; Boolean)
        {
            Caption = 'In Catalogue';
            DataClassification = CustomerContent;
        }

        field(50020; "Launch Date"; Date)
        {
            Caption = 'Launch Date';
            DataClassification = CustomerContent;
        }

        field(50021; "Qty. to Ship"; Decimal)
        {
            Caption = 'Quantity to Ship';
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Qty. to Ship (Base)");

        }

        field(50022; "Qty. to Ship (Transfer)"; Decimal)
        {
            Caption = 'Quantity to Ship (Transfer)';
            FieldClass = FlowField;
            CalcFormula = Sum("Transfer Line"."Qty. to Ship (Base)");
        }

        field(50023; "Qty. to Receive (Transfer)"; Decimal)
        {
            Caption = 'Quantity to Receive (Transfer)';
            FieldClass = FlowField;
            CalcFormula = Sum("Transfer Line"."Qty. to Receive (Base)");
        }

        field(50024; "Qty. on Hand - TOR"; Decimal)
        {
            Caption = 'Quantity on Hand - TOR';
            DataClassification = CustomerContent;
        }

        field(50025; "Qty. on Sales Order - TOR"; Decimal)
        {
            Caption = 'Quantity on Sales Order - TOR';
            DataClassification = CustomerContent;
        }

        field(50026; "Qty. on Hand - QUATOR"; Decimal)
        {
            Caption = 'Quantity on Hand - QUATOR';
            DataClassification = CustomerContent;
        }

        field(50027; "Qty. on Sales Order - CAL"; Decimal)
        {
            Caption = 'Quantity on Sales Order - CAL';
            DataClassification = CustomerContent;
        }

        field(50028; "Previous Full 3 Months Sales"; Decimal)
        {
            Caption = 'Previous Full 3 Months Sales';
            DataClassification = CustomerContent;
        }

        field(50029; "Previous Full 3 Months Filter"; Date)
        {
            //This one may not be required???
            Caption = 'Previous Full 3 Months Filter';
            DataClassification = CustomerContent;
        }

        field(50030; "Qty. on Hand - CAL"; Decimal)
        {
            Caption = 'Quantity on Hand - CAL';
            DataClassification = CustomerContent;
        }

        field(50031; "Qty. on Hand - QUACAL"; Decimal)
        {
            Caption = 'Quantity on Hand - QUACAL';
            DataClassification = CustomerContent;
        }

        field(50032; "Qty. on Hand - CLAIMSTOR"; Decimal)
        {
            Caption = 'Quantity on Hand - CLAIMSTOR';
            DataClassification = CustomerContent;
        }

        field(50033; "Qty. on Hand - CLAIMSCAL:"; Decimal)
        {
            Caption = 'Quantity on Hand - CLAIMSCAL';
            DataClassification = CustomerContent;
        }

        field(50034; "Qty. on Hand - TRAILER"; Decimal)
        {
            Caption = 'Quantity on Hand - TRAILER';
            DataClassification = CustomerContent;
        }

        field(50035; "Qty. on Hand - XGS"; Decimal)
        {
            Caption = 'Quantity on Hand - XGS';
            DataClassification = CustomerContent;
        }

        field(50036; "Qty. on Hand - Virtual"; Decimal)
        {
            Caption = 'Quantity on Hand - Virtual';
            DataClassification = CustomerContent;
        }

        field(50037; "Qty. on Hand - UWL"; Decimal)
        {
            Caption = 'Quantity on Hand - UWL';
            DataClassification = CustomerContent;
        }

        field(50038; "Qty. on Hand - WSL"; Decimal)
        {
            Caption = 'Quantity on Hand - WSL';
            DataClassification = CustomerContent;
        }

        field(50039; "Qty. on Hand - KESTREL"; Decimal)
        {
            Caption = 'Quantity on Hand - KESTREL';
            DataClassification = CustomerContent;
        }

        field(50040; "Qty. on Hand - SCANGLOBAL"; Decimal)
        {
            Caption = 'Quantity on Hand - SCANGLOBAL';
            DataClassification = CustomerContent;
        }

        field(50041; "Qty. on Hand - KRN"; Decimal)
        {
            Caption = 'Quantity on Hand - KRN';
            DataClassification = CustomerContent;
        }

        field(50042; "Qty. on Hand - SHIPCURVE"; Decimal)
        {
            Caption = 'Quantity on Hand - SHIPCURVE';
            DataClassification = CustomerContent;
        }

        field(50043; "VMI Stock"; Decimal)
        {
            Caption = 'VMI Stock';
            DataClassification = CustomerContent;
        }

        field(50044; "Qty. on Transfer Order"; Decimal)
        {
            Caption = 'Quantity on Transfer Order';
            FieldClass = FlowField;
            CalcFormula = Sum("Transfer Line"."Quantity (Base)");
        }

        field(50045; "Incoming ROs"; Decimal)
        {
            Caption = 'Incoming ROs';
            DataClassification = CustomerContent;
        }

        field(50046; "Compare Unit of Measure"; Code[20])
        {
            Caption = 'Compare Unit of Measure';
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }

        field(50047; "Sales Price Code"; Code[20])
        {
            DataClassification = CustomerContent;

            trigger OnLookup()
            var
                Category: Record "Item Category";
            begin
                Category.Reset();
                if Page.RunModal(Page::"Item Price Category Lookup", Category) = Action::LookupOK then
                    Rec."Sales Price Code" := Category.Code;
            end;
        }

        field(50048; "Replacement Cost (LCY)"; Decimal)
        {
            Caption = 'Replacement Cost (LCY)';
            DataClassification = CustomerContent;
        }

        field(50049; "Replacement Cost (Date)"; Date)
        {
            Caption = 'Replacement Cost (Date)';
            DataClassification = CustomerContent;
        }

        field(50050; "Tariff No. (Sales)"; Code[20])
        {
            Caption = 'Tariff No. (Sales)';
            DataClassification = CustomerContent;
        }

        field(50051; "Tarrif Charge Required"; Boolean)
        {
            Caption = 'Tariff Charge Required';
            DataClassification = CustomerContent;
        }

        field(50052; "Assembly Components on SO"; Boolean)
        {
            Caption = 'Assembly Components on Sales Order';
            DataClassification = CustomerContent;
        }

        field(50053; "Assembly Components on Ship"; Boolean)
        {
            Caption = 'Assembly Components on Shipments';
            DataClassification = CustomerContent;
        }

        field(50054; "Assembly Components on Inv"; Boolean)
        {
            Caption = 'Assembly Components on Invoices';
            DataClassification = CustomerContent;
        }

        field(50055; "Assembly Components on Pick"; Boolean)
        {
            Caption = 'Assembly Components on Pick Tickets';
            DataClassification = CustomerContent;
        }
    }


}


/*

·         Qty. to Receive (transfer) (Decimal, CalcFormula=”Transfer Line”.”Qty. to Receive (Base)”)

*/
