tableextension 50027 TorlysItem extends Item
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

        field(50007; "Inactive Current Item"; Boolean)
        {
            Caption = 'Inactive Current Item';
            DataClassification = CustomerContent;
        }

        field(50008; "Production Date Required"; Boolean)
        {
            Caption = 'Production Date Required';
            DataClassification = CustomerContent;
        }

        field(50010; "Sunset Item"; Boolean)
        {
            Caption = 'Sunset Item';
            DataClassification = CustomerContent;
        }

        field(50011; "Sunset Date"; Date)
        {
            Caption = 'Sunset Date';
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
            Caption = 'Qty. to Ship';
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Qty. to Ship (Base)" where("No." = field("No."), "Location Code" = field("Location Filter")));
        }

        field(50022; "Qty. to Ship (Transfer)"; Decimal)
        {
            Caption = 'Quantity to Ship (Transfer)';
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
            CalcFormula = Sum("Transfer Line"."Qty. to Ship (Base)" where("Item No." = field("No."), "Transfer-from Code" = field("Location Filter")));
        }

        field(50023; "Qty. to Receive (Transfer)"; Decimal)
        {
            Caption = 'Quantity to Receive (Transfer)';
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
            CalcFormula = Sum("Transfer Line"."Qty. to Receive (Base)" where("Item No." = field("No."), "Transfer-to Code" = field("Location Filter")));
        }

        field(50024; "Qty. on Hand (TOR)"; Decimal)
        {
            Caption = 'Quantity on Hand (TOR)';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50025; "Qty. on Sales Order (TOR)"; Decimal)
        {
            Caption = 'Quantity on Sales Order - TOR';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50026; "Qty. on Hand (QUATOR)"; Decimal)
        {
            Caption = 'Quantity on Hand - QUATOR';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50027; "Qty. on Sales Order (CAL)"; Decimal)
        {
            Caption = 'Quantity on Sales Order - CAL';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50028; "Previous Full 3 Months Sales"; Decimal)
        {
            Caption = 'Previous Full 3 Months Sales';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50029; "Previous Full 3 Months Filter"; Date)
        {
            //This one may not be required???
            Caption = 'Previous Full 3 Months Filter';
            DataClassification = CustomerContent;
        }

        field(50030; "Qty. on Hand (CAL)"; Decimal)
        {
            Caption = 'Quantity on Hand - CAL';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50031; "Qty. on Hand (QUACAL)"; Decimal)
        {
            Caption = 'Quantity on Hand - QUACAL';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50032; "Qty. on Hand (CLAIMSTOR)"; Decimal)
        {
            Caption = 'Quantity on Hand (CLAIMSTOR))';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50033; "Qty. on Hand (CLAIMSCAL)):"; Decimal)
        {
            Caption = 'Quantity on Hand (CLAIMSCAL)';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50040; "Qty. on Hand (SCANGLOBAL)"; Decimal)
        {
            Caption = 'Quantity on Hand - SCANGLOBAL';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50041; "Qty. on Hand (KRN))"; Decimal)
        {
            Caption = 'Quantity on Hand - KRN';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50043; "VMI Stock"; Decimal)
        {
            Caption = 'VMI Stock';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50044; "Qty. on Transfer Order"; Decimal)
        {
            Caption = 'Quantity on Transfer Order';
            DecimalPlaces = 0 : 5;
            FieldClass = FlowField;
            CalcFormula = Sum("Transfer Line"."Quantity (Base)" where("Item No." = field("No.")));
        }

        field(50045; "Incoming ROs"; Decimal)
        {
            Caption = 'Incoming ROs';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }

        field(50046; "Compare Unit of Measure"; Code[20])
        {
            Caption = 'Compare Unit of Measure';
            DataClassification = CustomerContent;
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."));
        }

        field(50047; "Sales Price Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Torlys Sales Price Code";
            Caption = 'Sales Price Code';
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

        field(50052; "Customs/Tarrif Note"; Text[50])
        {
            Caption = 'Customs/Tarrif Note';
            DataClassification = CustomerContent;
        }

    }

    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    var
        Dimension: Record "Default Dimension";
    begin
        ClearShortcutDimCode(ShortcutDimCode);
        Dimension.Reset();
        Dimension.SetRange("Table ID", 27);
        Dimension.SetRange("No.", Rec."No.");

        if Dimension.FindSet() then
            repeat
                case Dimension."Dimension Code" of
                    'REGION':
                        ShortcutDimCode[1] := Dimension."Dimension Value Code";
                    'DEPARTMENT':
                        ShortcutDimCode[2] := Dimension."Dimension Value Code";
                    'CHANNEL':
                        ShortcutDimCode[3] := Dimension."Dimension Value Code";
                    'PRODUCT':
                        ShortcutDimCode[4] := Dimension."Dimension Value Code";
                    'BUYING GROUP':
                        ShortcutDimCode[5] := Dimension."Dimension Value Code";
                    'PROJECT':
                        ShortcutDimCode[6] := Dimension."Dimension Value Code";
                    'AUTOMOTIVE':
                        ShortcutDimCode[7] := Dimension."Dimension Value Code";
                    'REBATE GROUP':
                        ShortcutDimCode[8] := Dimension."Dimension Value Code";
                end;
            until Dimension.Next() = 0;

    end;

    // procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    // var
    //     DimMgt: Codeunit "DimensionManagement";
    // begin
    //     DimMgt.defa("")("Dimension Set ID", ShortcutDimCode);
    // end;

    local procedure ClearShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    var
        i: Integer;
    begin
        for i := 1 to 8 do
            ShortcutDimCode[i] := '';
    end;


}


/*

·         Qty. to Receive (transfer) (Decimal, CalcFormula=”Transfer Line”.”Qty. to Receive (Base)”)

*/
