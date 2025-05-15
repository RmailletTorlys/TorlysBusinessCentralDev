pageextension 50021 TorlysCustomerCard extends "Customer Card"
{
    layout
    {
        addafter("No.")
        {
            field("Collector ID"; Rec."Collector ID")
            {
                ApplicationArea = All;
                Caption = 'Collector ID';
                Visible = true;
                ToolTip = 'This field is the Primary Credit Collector assigned to the customer account.';
            }

            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = Dimensions;
                ToolTip = 'Global Dimension 1 Code';
            }

            field(ShortcutDimCode4; ShortcutDimCode[4])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,4';
                ToolTip = 'Global Dimension 4 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4),
                                                                "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimension(4);
                end;
            }

            field(ShortcutDimCode5; ShortcutDimCode[5])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,5';
                ToolTip = 'Global Dimension 5 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5),
                                                                "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimension(5);
                end;
            }

            field("TORLYS Club"; Rec."TORLYS Club")
            {
                ApplicationArea = All;
                CaptionClass = 'TORLYS Club';
                ToolTip = 'TORLYS Club';
                Visible = true;
            }

            field("Power Up Level"; Rec."Power Up Level")
            {
                ApplicationArea = All;
                CaptionClass = 'Power Up Level';
                ToolTip = 'Power Up Level';
                Visible = true;
            }
        }


        addfirst(PricesandDiscounts)
        {
            field("Default Price List"; Rec."Default Price List Code")
            {
                ApplicationArea = All;
                Caption = 'Default Price List';
                Visible = true;
                ToolTip = 'This field is the default price list assigned to the customer account.';

            }
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