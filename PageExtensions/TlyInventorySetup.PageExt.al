pageextension 50461 TlyInventorySetup extends "Inventory Setup"
{
    layout
    {
        addafter("Allow Inventory Adjustment")
        {
            field("Transfer Order Alert Weight"; Rec."Transfer Order Alert Weight")
            {
                Caption = 'Transfer Order Alert Weight';
                ToolTip = 'Transfer Order Alert Weight';
                ApplicationArea = All;
            }
        }
    }
}