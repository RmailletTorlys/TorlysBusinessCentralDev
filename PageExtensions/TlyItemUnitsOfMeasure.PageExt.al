pageextension 55404 TlyItemUnitsOfMeasure extends "Item Units of Measure"
{
    layout
    {
        movebefore("Code"; "Item No.")

        addafter("Qty. per Unit of Measure")
        {
            field("Conversion Unit of Measure"; Rec."Conversion Unit of Measure")
            {
                Caption = 'Conversion Unit of Measure';
                ToolTip = 'Conversion Unit of Measure';
                ApplicationArea = All;
            }

            field("Conversion Quantity"; Rec."Conversion Quantity")
            {
                Caption = 'Conversion Quantity';
                ToolTip = 'Conversion Quantity';
                ApplicationArea = All;
            }
        }
        modify("Item No.")
        {
            Visible = true;
            Editable = false;
        }
    }

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        CurrPage.Editable := false;

        if UserSetup.Get(UserId) then begin
            if (UserSetup.Department = UserSetup.Department::IT) or //(UserSetup.Department = UserSetup.Department::Executive) or
                (UserSetup.Department = UserSetup.Department::"Supply Chain") or (UserSetup.Department = UserSetup.Department::PID) or
                (UserSetup.Department = UserSetup.Department::Marketing) then
                CurrPage.Editable := true;
        end;
    end;
}