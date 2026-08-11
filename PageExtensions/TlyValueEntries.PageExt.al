pageextension 55802 TlyValueEntries extends "Value Entries"
{
    layout
    {
        moveafter(Description; "Sales Amount (Expected)", "Sales Amount (Actual)", "Cost Amount (Expected)", "Cost Amount (Actual)")

        modify("Sales Amount (Expected)")
        {
            Visible = true;
        }
    }
}