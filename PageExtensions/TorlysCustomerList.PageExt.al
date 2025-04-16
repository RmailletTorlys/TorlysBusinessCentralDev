pageextension 50028 TorlysCustomerList extends "Customer List"
{
    layout
    {
        addafter("No.")
        {
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