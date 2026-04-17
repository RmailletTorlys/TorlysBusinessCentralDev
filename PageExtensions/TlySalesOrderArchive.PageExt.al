pageextension 55159 TlySalesOrderArchive extends "Sales Order Archive"
{
    layout
    {
        addafter(Status)
        {
            field("No. Pick Slips Printed"; Rec."No. Pick Slips Printed")
            {
                Caption = 'No. Pick Slips Printed';
                ToolTip = 'No. Pick Slips Printed';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }
            field("Pick Slip Printed By"; Rec."Pick Slip Printed By")
            {
                Caption = 'Pick Slip Printed By';
                ToolTip = 'Pick Slip Printed By';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }

            field("Pick Slip Printed At"; Rec."Pick Slip Printed At")
            {
                Caption = 'Pick Slip Printed At';
                ToolTip = 'Pick Slip Printed At';
                ApplicationArea = All;
                Importance = Standard;
                Editable = false;
            }
        }
    }

    actions
    {
        modify(Restore)
        {
            Visible = false;
        }
    }
}