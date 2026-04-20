tableextension 50313 TlyInventorySetup extends "Inventory Setup"
{
    fields
    {
        field(50001; "Transfer Alert Weight"; Decimal)
        {
            Caption = 'Transfer Order Alert Weight';
            ToolTip = 'Transfer Order Alert Weight';
            DataClassification = CustomerContent;
            ObsoleteState = Removed;
            ObsoleteReason = 'Name change, day after first loaded.';
        }

        field(50002; "Transfer Order Alert Weight"; Decimal)
        {
            Caption = 'Transfer Order Alert Weight';
            ToolTip = 'Transfer Order Alert Weight';
            DataClassification = CustomerContent;
        }
    }
}