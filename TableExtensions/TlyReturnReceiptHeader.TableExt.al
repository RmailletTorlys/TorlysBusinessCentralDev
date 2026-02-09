tableextension 56660 TlyReturnReceiptHeader extends "Return Receipt Header"
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

        field(50007; "Order Type"; Text[20])
        {
            Caption = 'Order Type';
            TableRelation = TlyOrderType;
            DataClassification = CustomerContent;
        }

        field(50008; "Tag Name"; Text[30])
        {
            Caption = 'Tag Name';
            DataClassification = CustomerContent;
        }

        field(50009; "Temporary Hold"; Boolean)
        {
            Caption = 'Temporary Hold';
            DataClassification = CustomerContent;
        }

        field(50010; "No. Pick Slips Printed"; Integer)
        {
            Caption = 'No. Pick Slips Printed';
            DataClassification = CustomerContent;
        }

        field(50011; "Pick Slip Printed By"; Code[50])
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
        field(50017; "Original Invoice No."; Code[20])
        {
            Caption = 'Original Invoice No.';
            // TableRelation = "Sales Invoice Header"."No." where("Sell-to Customer No." = field("Sell-to Customer No."));
            DataClassification = CustomerContent;
        }
        field(50018; "Rebill Invoice No."; Code[20])
        {
            Caption = 'Rebill Invoice No.';
            TableRelation = "Sales Invoice Header"."No." where("Sell-to Customer No." = field("Sell-to Customer No."));
            DataClassification = CustomerContent;
        }

        field(50020; "Qty. to ship"; Decimal)
        {
            Caption = 'Qty. to ship';
            CalcFormula = Sum("Sales Line"."Qty. to Ship" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }

        field(50021; "Outstanding Quantity"; Decimal)
        {
            Caption = 'Outstanding Quantity';
            CalcFormula = Sum("Sales Line"."Outstanding Quantity" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }

        field(50022; "Sample Allowance Exclusion"; Boolean)
        {
            Caption = 'Sample Allowance Exclusion';
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

        field(50026; "Picked By"; code[20])
        {
            Caption = 'Picked By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";
        }

        field(50027; "Audited By"; code[20])
        {
            Caption = 'Audited By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser";
        }

        field(50028; "Freight Zone Code"; Code[20])
        {
            Caption = 'Freight Zone Code';
            DataClassification = CustomerContent;
            TableRelation = TlyFreightZone;
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

        field(50031; "Order Method"; Text[20])
        {
            Caption = 'Order Method';
            DataClassification = CustomerContent;
            TableRelation = TlyOrderMethod;
        }

        field(50037; "Shipping Instructions"; Text[20])
        {
            Caption = 'Shipping Instructions';
            DataClassification = CustomerContent;
            TableRelation = TlyShippingInstructions;
        }

        field(50040; "Shipping Comment"; Text[50])
        {
            Caption = 'Shipping Comment';
            DataClassification = CustomerContent;
        }

        field(50041; "MK Required"; Boolean)
        {
            Caption = 'MK Required';
            DataClassification = CustomerContent;
        }

        field(50042; "MK Required Type"; Enum TlyMKRequiredType)
        {
            Caption = 'MK Required Type';
            DataClassification = CustomerContent;
            // OptionMembers = " ","Plank","Swatch","Chainset","Custom";
        }

        field(50043; "MK Staged"; Boolean)
        {
            Caption = 'MK Staged';
            DataClassification = CustomerContent;
        }
        field(50044; "MK Staged Location"; Code[20])
        {
            Caption = 'MK Staged Location';
            TableRelation = TlyMKStagedLocation;
            DataClassification = CustomerContent;
        }
        field(50045; "MK Intransit"; Boolean)
        {
            Caption = 'MK Intransit';
            DataClassification = CustomerContent;
        }
        field(50046; "MK Received"; Boolean)
        {
            Caption = 'MK Received';
            DataClassification = CustomerContent;
        }

        field(50047; "Club"; Enum TlyClub)
        {
            Caption = 'Club';
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer.Club where("No." = field("Sell-to Customer No.")));
            // OptionMembers = None,"Power Up","Power Up National","Power Up Assurance","Power Up USA";
            Editable = false;
        }

        field(50048; "Powerup Level"; Enum TlyPowerUpLevel)
        {
            Caption = 'Club';
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer."Power Up Level" where("No." = field("Sell-to Customer No.")));
            // OptionMembers = None,"Premier","Elite","Designer";
            Editable = false;
        }

        field(50049; "BOL No."; Code[20])
        {
            Caption = 'BOL No.';
            TableRelation = TlyBillOfLadingHeader;
            DataClassification = CustomerContent;
        }

        field(50050; "MK Staged Quantity"; Integer)
        {
            Caption = 'MK Staged Quantity';
            DataClassification = CustomerContent;
        }
        field(50051; "Received By"; Code[20])
        {
            Caption = 'Received By';
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code where("Job Title" = filter('Warehouse Associate'));
        }

        field(50052; "Put Away Date"; Date)
        {
            Caption = 'Put Away Date';
            DataClassification = CustomerContent;
        }
        field(50053; "Return Claim No."; Code[20])
        {
            Caption = 'Return Claim No.';
            DataClassification = CustomerContent;
        }
    }
    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    var
        DimMgt: Codeunit "DimensionManagement";
    begin
        DimMgt.GetShortcutDimensions(Rec."Dimension Set ID", ShortcutDimCode);
    end;
}
