pageextension 51456 TlyNoSeries extends "No. Series"
{
    layout
    {
        moveafter(EndNo; WarningNo, LastDateUsed, LastNoUsed, "Default Nos.", "Manual Nos.", Implementation, AllowGapsCtrl)

        modify(WarningNo)
        {
            Visible = true;
        }
        modify("Date Order")
        {
            Visible = false;
        }
    }
}