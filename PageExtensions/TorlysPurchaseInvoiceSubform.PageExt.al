pageextension 50055 TorlysPurchaseInvoiceSubform extends "Purch. Invoice Subform"
{
    layout
    {
        moveafter("Location Code"; "Unit of Measure Code", "Quantity")

        moveafter("Line Amount"; "Tax Group Code", "Tax Area Code")

        modify("Item Reference No.")
        {
            Visible = false;
        }

        modify("Line Discount %")
        {
            Visible = false;
        }

        modify(AmountBeforeDiscount)
        {
            Visible = false;
        }

        modify(InvoiceDiscountAmount)
        {
            Visible = false;
        }

        modify("Invoice Disc. Pct.")
        {
            Visible = false;
        }

    }
}