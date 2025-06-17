pageextension 59305 TorlysSalesOrderList extends "Sales Order List"
{
    layout
    {
        moveafter("No."; "Shortcut Dimension 1 Code")
        addafter("Shortcut Dimension 1 Code")
        {

            field(ShortcutDimCode4; ShortcutDimCode[4])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,4';
                ToolTip = 'Global Dimension 4 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;

                trigger OnValidate()
                begin
                    ValidateShortcutDimension(3);
                end;
            }
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
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