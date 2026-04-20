pageextension 50461 TlyInventorySetup extends "Inventory Setup"
{
    layout
    {
        addafter("Allow Inventory Adjustment")
        {
            field("Transfer Alert Weight"; Rec."Transfer Order Alert Weight")
            {
                Caption = 'Transfer Alert Weight';
                ToolTip = 'Transfer Alert Weight';
                ApplicationArea = All;
            }
        }
    }
}