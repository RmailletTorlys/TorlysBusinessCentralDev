pageextension 50028 TorlysCustomerList extends "Customer List"
{
    layout
    {
        moveafter("No."; "Name", "Search Name")
        addafter("Search Name")
        {
            field("Collector ID"; Rec."Collector ID")
            {
                ApplicationArea = All;
                Caption = 'Collector ID';
                ToolTip = 'Collector ID';
                Visible = true;
            }
        }

        moveafter("Collector ID"; "Salesperson Code")

        addafter("Salesperson Code")
        {
            field("Salesperson Commission"; Rec."Salesperson Commission")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Commission';
                ToolTip = 'Salesperson Commission';
                DecimalPlaces = 2;
                Visible = false;
            }

            field("Salesperson Code 2"; Rec."Salesperson Code 2")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Code 2';
                ToolTip = 'Salesperson Code 2';
                Visible = false;
            }

            field("Salesperson Commission 2"; Rec."Salesperson Commission 2")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Commission 2';
                ToolTip = 'Salesperson Commission 2';
                DecimalPlaces = 2;
                Visible = false;
            }

            field("Salesperson Code 3"; Rec."Salesperson Code 3")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Code 3';
                ToolTip = 'Salesperson Code 3';
                Visible = false;
            }

            field("Salesperson Commission 3"; Rec."Salesperson Commission 3")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Commission 3';
                ToolTip = 'Salesperson Commission 3';
                DecimalPlaces = 2;
                Visible = false;
            }

            field(ShortcutDimCode4; ShortcutDimCode[3])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,3';
                ToolTip = 'Global Dimension 3 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    ValidateShortcutDimension(3);
                end;
            }

            field("Date Opened"; Rec."Date Opened")
            {
                ApplicationArea = All;
                Caption = 'Date Opened';
                ToolTip = 'Date Opened';
                Visible = false;
            }

            field("Date Closed"; Rec."Date Closed")
            {
                ApplicationArea = All;
                Caption = 'Date Closed';
                ToolTip = 'Date Closed';
                Visible = false;
            }
        }
        moveafter("Date Closed"; "Blocked")

        addafter("Blocked")
        {

            field("Address"; Rec.Address)
            {
                ApplicationArea = All;
                Caption = 'Address';
                ToolTip = 'Address';
                Visible = true;
            }

            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;
                Caption = 'Address 2';
                ToolTip = 'Address 2';
                Visible = false;
            }

            field("City"; Rec.City)
            {
                ApplicationArea = All;
                Caption = 'City';
                ToolTip = 'City';
                Visible = true;
            }

            field("State/Province"; Rec."County")
            {
                ApplicationArea = All;
                Caption = 'State/Province';
                ToolTip = 'State/Province';
                Visible = false;
            }
        }

        moveafter("State/Province"; "Country/Region Code", "Post Code", "Phone No.", "Language Code")

        addafter("Language Code")
        {

            field("Bill-to Customer No."; Rec."Bill-to Customer No.")
            {
                ApplicationArea = All;
                Caption = 'Bill-to Customer No.';
                ToolTip = 'Bill-to Customer No.';
                Visible = true;
            }

            field("Credit Warnings"; Rec."Credit Warnings")
            {
                ApplicationArea = All;
                Caption = 'Credit Warnings';
                ToolTip = 'Credit Warnings';
                Visible = true;
            }

            field("Tax Liable"; Rec."Tax Liable")
            {
                ApplicationArea = All;
                Caption = 'Tax Liable';
                ToolTip = 'Tax Liable';
                Visible = true;
            }

            field("Tax Area Code"; Rec."Tax Area Code")
            {
                ApplicationArea = All;
                Caption = 'Tax Area Code';
                ToolTip = 'Tax Area Code';
                TableRelation = "Tax Area";
                Visible = true;
            }

            field("Default Price List"; Rec."Default Price List Code")
            {
                ApplicationArea = All;
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                Visible = true;
            }
        }

        moveafter("Default Price List"; "Currency Code")

        addafter("Currency Code")
        {
            field(ShortcutDimCode5; ShortcutDimCode[5])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,5';
                ToolTip = 'Global Dimension 5 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5),
                                                                "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    ValidateShortcutDimension(5);
                end;
            }

            field(ShortcutDimCode6; ShortcutDimCode[6])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,6';
                ToolTip = 'Global Dimension 6 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6),
                                                                "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimension(6);
                end;
            }

            field("Power Up Code"; Rec."Power Up Level")
            {
                ApplicationArea = All;
                Caption = 'Power Up Code';
                ToolTip = 'Power Up Code';
                Visible = false;
            }

            field("Program Fees Amount (LCY)"; Rec."Program Fees Amount (LCY)")
            {
                ApplicationArea = All;
                Caption = 'Program Fees Amount';
                DecimalPlaces = 2;
                Editable = false;
                Visible = false;
                ToolTip = 'Specifies the amount of the program fees that you have paid for the customer.';
            }

            field("Co-op Entitlement %"; Rec."Co-op Entitlement %")
            {
                ApplicationArea = All;
                Caption = 'Co-op Entitlement %';
                DecimalPlaces = 2 : 1;
                Editable = false;
                Visible = false;
                ToolTip = 'Specifies the percentage of the customer''s total payment that is allocated to the customer''s co-op.';
            }

            field("Sample Allowance %"; Rec."Sample Allowance %")
            {
                ApplicationArea = All;
                Caption = 'Sample Allowance %';
                DecimalPlaces = 2 : 1;
                Editable = false;
                Visible = false;
                ToolTip = 'Specifies the percentage of the customer''s total payment that is allocated to the customer''s sample.';
            }
        }

        moveafter("Sample Allowance %"; "Payment Terms Code")

        addafter("Payment Terms Code")
        {
            field("Payment Method Code"; Rec."Payment Method Code")
            {
                ApplicationArea = All;
                Caption = 'Payment Method';
                ToolTip = 'Payment Method';
                Visible = false;
            }

            field("A/R Notes"; Rec."A/R Notes")
            {
                ApplicationArea = All;
                Caption = 'A/R Notes';
                ToolTip = 'A/R Notes';
                Visible = false;
            }

            field("On Hold Count"; Rec."On Hold Count")
            {
                ApplicationArea = All;
                Caption = 'On Hold Count';
                ToolTip = 'On Hold Count';
                Visible = true;
            }

            field("NSF Count"; Rec."NSF Count")
            {
                ApplicationArea = All;
                Caption = 'NSF Count';
                ToolTip = 'NSF Count';
                Visible = false;
            }
            field("Credit Limit"; Rec."Credit Limit (LCY)")
            {
                ApplicationArea = All;
                Caption = 'Credit Limit';
                ToolTip = 'Credit Limit';
                Visible = true;
            }
        }
        moveafter("NSF Count"; "Ship-to Code", "Location Code")

        addafter("Location Code")
        {
            field("Shipment Method Code"; Rec."Shipment Method Code")
            {
                ApplicationArea = All;
                Caption = 'Shipping Agent Code';
                ToolTip = 'Shipping Agent Code';
                TableRelation = "Shipment Method";
                Visible = false;
            }
        }

        moveafter("Shipment Method Code"; "Shipping Agent Code")

        addafter("Shipping Agent Code")
        {
            field("Freight Zone"; Rec."Freight Zone")
            {
                ApplicationArea = All;
                Caption = 'Freight Zone';
                ToolTip = 'Freight Zone';
                Visible = false;
            }

        }

        addafter("Balance Due (LCY)")
        {
            field("Outstanding Orders ($)"; Rec."Outstanding Orders (LCY)")
            {
                ApplicationArea = All;
                Caption = 'Outstanding Orders ($)';
                ToolTip = 'Outstanding Orders ($)';
                DecimalPlaces = 2;
                Editable = false;
                Visible = true;
            }
        }

        moveafter("Outstanding Orders ($)"; "Credit Limit (LCY)", "Sales (LCY)")

        addafter("Sales (LCY)")
        {

            field("Profit ($)"; Rec."Profit (LCY)")
            {
                ApplicationArea = All;
                Caption = 'Profit ($)';
                ToolTip = 'Profit ($)';
                DecimalPlaces = 2;
                Editable = false;
                Visible = true;
            }

            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                ApplicationArea = All;
                Caption = 'System Created By';
                ToolTip = 'System Created By';
                Visible = false;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
                Caption = 'System Created At';
                ToolTip = 'System Created At';
                Visible = false;
            }

            field(SystemModifiedBy; Rec.SystemModifiedBy)
            {
                ApplicationArea = All;
                Caption = 'System Modified By';
                ToolTip = 'System Modified By';
                Visible = false;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                ApplicationArea = All;
                Caption = 'System Modified At';
                ToolTip = 'System Modified At';
                Visible = false;
            }

        }



        modify("Salesperson Code")
        {
            Visible = true;
        }

        modify("Phone No.")
        {
            Visible = false;
        }

        modify("Payment Terms Code")
        {
            Visible = true;
        }

        modify("Location Code")
        {
            Visible = false;
        }

        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify(Contact)
        {
            Visible = false;
        }

        modify("Payments (LCY)")
        {
            Visible = false;
        }


    }



    protected var
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;



    local procedure ValidateShortcutDimension(DimIndex: Integer)
    var
    begin
        Rec.ValidateShortcutDimCode(DimIndex, ShortcutDimCode[DimIndex]);
    end;
}