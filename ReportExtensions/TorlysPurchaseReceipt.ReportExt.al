reportextension 50700 "TorlysPurchaseReceipt" extends "Purchase Receipt NA"
{
    dataset
    {
        add("Purch. Rcpt. Line")
        {
            column(Direct_Unit_Cost; "Direct Unit Cost")
            {
                DecimalPlaces = 2 : 2;
            }

            column(TotalCost; TotalCost)
            {
                DecimalPlaces = 2 : 2;
            }
            column(Quantity; Quantity)
            {
                DecimalPlaces = 2 : 2;
            }
            column(TotalDirectUnitCost; TotalDirectUnitCost)
            {
                DecimalPlaces = 2 : 2;
            }
            column(Unit_Cost__LCY_; "Unit Cost (LCY)")
            {

            }
        }

        modify("Purch. Rcpt. Line")
        {
            trigger OnAfterAfterGetRecord()
            begin
                TotalCost := (Quantity * "Direct Unit Cost");
                TotalDirectUnitCost := TotalDirectUnitCost + TotalCost;
            end;
        }
    }

    var

        TotalCost: Decimal;
        Quantity: Decimal;
        TotalDirectUnitCost: Decimal;
}