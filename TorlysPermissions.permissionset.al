namespace TORLYS;

permissionset 50000 TorlysPermissions
{
    Assignable = true;
    Permissions = tabledata "Torlys BOL Header"=RIMD,
        tabledata "Torlys BOL Line"=RIMD,
        tabledata "Torlys Freight Zones"=RIMD,
        tabledata "Torlys Processed BOL Header"=RIMD,
        tabledata "Torlys Processed BOL Line"=RIMD,
        table "Torlys BOL Header"=X,
        table "Torlys BOL Line"=X,
        table "Torlys Freight Zones"=X,
        table "Torlys Processed BOL Header"=X,
        table "Torlys Processed BOL Line"=X,
        codeunit "Price Asset - Price Code"=X,
        codeunit "Price Source - Price Code"=X,
        codeunit "Quantity Rounding Helper"=X,
        codeunit "SL Price List Triggers"=X,
        codeunit "Torlys IJ Quantity Rounding"=X,
        codeunit "Torlys PO Quantity Rounding"=X,
        codeunit "Torlys Sales Line - Price"=X,
        codeunit "Torlys SL Quantity Rounding"=X,
        codeunit "Torlys TL Quantity Rounding"=X,
        codeunit TorlysPriceCalcBufferMgt=X,
        codeunit TorlysPriceCodeSourcePriceCalc=X,
        page CustomerSalesPriceListsLookup=X,
        page "Freight Zone Card"=X,
        page "Freight Zone List"=X,
        page "Freight Zone Lookup"=X,
        page "Item Price Category Lookup"=X,
        page "Item Sales Category Lookup"=X,
        page "Torlys BOL"=X,
        page "Torlys BOL Subform"=X,
        page "Torlys BOLs"=X,
        page TorlysOrdersToBeShipped=X,
        query CustInfoForTorlysDotCom=X,
        query ItemInfoForTorlysDotCom=X;
}