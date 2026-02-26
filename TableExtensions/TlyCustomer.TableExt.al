tableextension 50018 TlyCustomer extends Customer
{
    fields
    {
        field(50001; "Collector ID"; code[20])
        {
            Caption = 'Collector ID';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }

        field(50002; "DBA"; text[20])
        {
            Caption = 'Does Business As';
            DataClassification = CustomerContent;
        }

        field(50003; "Credit Limit Modified Date"; Date)
        {
            Caption = 'Credit Limit Modified Date';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50004; "Credit Limit Modified By"; Code[20])
        {
            Caption = 'Credit Limit Modified By';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50005; "Previous Credit Limit (LCY)"; Decimal)
        {
            Caption = 'Previous Credit Limit (LCY)';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50006; "Credit Warnings"; enum TlyCustCreditWarnings)
        {
            Caption = 'Credit Warnings';
            DataClassification = CustomerContent;
        }

        field(50007; "Close Account"; Boolean)
        {
            Caption = 'Close Account';
            DataClassification = CustomerContent;
        }

        field(50009; "Closed By"; code[20])
        {
            Caption = 'Closed By';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }

        field(50010; "Invoice (Mail/Fax)"; Option)
        {
            //Check on if this field is still needed
            Caption = 'Invoice (Mail/Fax)';
            OptionMembers = "Mail","Fax";
            DataClassification = CustomerContent;
        }

        field(50011; "Statements"; Option)
        {
            //Check on if this field is still needed
            Caption = 'Statements';
            OptionMembers = "Mail","Fax";
            DataClassification = CustomerContent;
        }

        field(50012; "Salesperson Commission"; Decimal)
        {
            Caption = 'Salesperson Commission';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50013; "Salesperson Code 2"; code[20])
        {
            Caption = 'Salesperson Code 2';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }

        field(50014; "Salesperson Commission 2"; Decimal)
        {
            Caption = 'Salesperson Commission 2';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50015; "Salesperson Code 3"; code[20])
        {
            Caption = 'Salesperson Code 3';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }

        field(50016; "Salesperson Commission 3"; Decimal)
        {
            Caption = 'Salesperson Commission 3';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50017; "Temp. Credit Limit (LCY)"; Decimal)
        {
            Caption = 'Temp. Credit Limit';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50018; "Temp. Credit Limit Expiry Date"; Date)
        {
            Caption = 'Temp. Credit Limit Expiry Date';
            DataClassification = CustomerContent;
        }

        field(50019; "Date Opened"; Date)
        {
            Caption = 'Date Opened';
            DataClassification = CustomerContent;
        }

        field(50020; "Date Closed"; Date)
        {
            Caption = 'Date Closed';
            DataClassification = CustomerContent;
        }

        field(50021; "Restocking Fee %"; Decimal)
        {
            Caption = 'Restocking Fee %';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50022; "Restocking Fee Minimum"; Decimal)
        {
            Caption = 'Restocking Fee Minimum';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50023; "Power Up Level"; Enum TlyPowerUpLevel)
        {
            Caption = 'Power Up Level';
            // InitValue = " ";
            ToolTip = 'Specifies the Power Up level that the customer is assigned to.';
            DataClassification = CustomerContent;
            // OptionMembers = " ",Premier,Elite,Designer;
        }

        field(50024; "Power Up Start Date"; Date)
        {
            Caption = 'Power Up Start Date';
            DataClassification = CustomerContent;
        }

        field(50025; "Power Up End Date"; Date)
        {
            Caption = 'Power Up End Date';
            DataClassification = CustomerContent;
        }

        field(50026; "Program Fees Amount (LCY)"; Decimal)
        {
            Caption = 'Program Fees Amount';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50027; "Co-op Entitlement %"; Decimal)
        {
            Caption = 'Co-op Entitlement %';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50028; "Sample Allowance %"; Decimal)
        {
            Caption = 'Sample Allowance %';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50029; "A/R Notes"; text[50])
        {
            Caption = 'A/R Notes';
            DataClassification = CustomerContent;
        }

        field(50030; "On Hold Count"; Integer)
        {
            Caption = 'On Hold Count';
            DataClassification = CustomerContent;
        }

        field(50031; "NSF Count"; Integer)
        {
            Caption = 'NSF Count';
            DataClassification = CustomerContent;
        }

        field(50032; "Default Price List Code"; code[20])
        {
            Caption = 'Default Price List Code';
            DataClassification = CustomerContent;
            TableRelation = "Price List Header";

            // trigger OnLookup()
            // var
            //     PriceList: Record "Price List Header";
            // begin
            //     PriceList.Reset();
            //     if Page.RunModal(Page::"Sales Price List", PriceList) = Action::LookupOK then
            //         Rec."Default Price List Code" := PriceList.Code;
            // end;
        }

        field(50033; "Club"; Enum TlyClub)
        {
            Caption = 'Club';
            // InitValue = " ";
            ToolTip = 'Specifies the Club that the customer is assigned to.';
            DataClassification = CustomerContent;
            // OptionMembers = " ","Power Up","Power Up National","Power Up Assurance","Power Up USA";
        }

        field(50034; "Freight Zone Code"; Code[20])
        {
            Caption = 'Freight Zone Code';
            DataClassification = CustomerContent;
            TableRelation = TlyFreightZone;
            ToolTip = 'Specifies the freight zone that the customer is assigned to.';
        }

        field(50035; "Dealer Locator Participant"; Boolean)
        {
            Caption = 'Dealer Locator Participant';
            DataClassification = CustomerContent;
            // Enabled = false;
        }

        field(50036; "Shipping Instructions"; Code[20])
        {
            Caption = 'Shipping Instructions';
            DataClassification = CustomerContent;
            TableRelation = TlyShippingInstructions;
        }

        field(50037; "Website"; text[50])
        {
            Caption = 'Website';
            DataClassification = CustomerContent;
        }

        field(50038; "Add to Dealer Locator"; Boolean)
        {
            Caption = 'Add to Dealer Locator';
            DataClassification = CustomerContent;
            // Enabled = false;
        }

        field(50039; "Shipping Comment"; Text[100])
        {
            Caption = 'Shipping Comment';
            DataClassification = CustomerContent;
        }

        field(50040; "Remove Regular Price On PL"; Boolean)
        {
            Caption = 'Remove Regular Price On PL';
            DataClassification = CustomerContent;
        }

        field(50041; "Marketing Items Zero Charge"; Boolean)
        {
            Caption = 'Marketing Items Zero Charge';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Price List Line" where("Source No." = field("No."), "Product No." = filter('DI-01A')));
        }

        modify("Credit Limit (LCY)")
        {
            trigger OnAfterValidate()
            begin
                if Rec."Credit Limit (LCY)" <> xRec."Credit Limit (LCY)" then begin
                    "Credit Limit Modified By" := UserId;
                    "Credit Limit Modified Date" := WorkDate();
                    "Previous Credit Limit (LCY)" := xRec."Credit Limit (LCY)"
                end;
            end;
        }
    }

    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    var
        Dimension: Record "Default Dimension";
    begin
        ClearShortcutDimCode(ShortcutDimCode);
        Dimension.Reset();
        Dimension.SetRange("Table ID", 18);
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

    local procedure ClearShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    var
        i: Integer;
    begin
        for i := 1 to 8 do
            ShortcutDimCode[i] := '';
    end;

    // procedure GetOptionsTorlysClub(): Text[30]
    // begin
    //     exit(Format(Rec."Club"));
    // end;

    // procedure GetOptionsPowerUpLevel(): Text[30]
    // begin
    //     exit(Format(Rec."Power Up Level"));
    // end;
}



