codeunit 50019 TlyCopyFieldsSales
{
    // Customer --> Ship-to Address
    [EventSubscriber(ObjectType::Page, Page::"Ship-to Address", 'OnAfterOnNewRecord', '', false, false)]
    local procedure OnAfterOnNewRecord(var Customer: Record Customer; var ShipToAddress: Record "Ship-to Address")
    begin
        ShipToAddress.Validate("Location Code", Customer."Location Code");
        // ShipToAddress.Validate("Shipment Method Code", Customer."Shipment Method Code");
        // ShipToAddress.Validate("Shipping Agent Code", Customer."Shipping Agent Code");
        // ShipToAddress.Validate("Freight Zone Code", Customer."Freight Zone Code");
        // ShipToAddress.Validate("Shipping Instructions", Customer."Shipping Instructions");
        // ShipToAddress.Validate("Shipping Comment", Customer."Shipping Comment");
        ShipToAddress.Validate("Tax Liable", Customer."Tax Liable");
        ShipToAddress.Validate("Tax Area Code", Customer."Tax Area Code");
    end;

    // Customer --> Sales Header
    // [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterCopySellToCustomerAddressFieldsFromCustomer', '', false, false)]
    // local procedure OnAfterCopySellToCustomerAddressFieldsFromCustomer(var SalesHeader: Record "Sales Header"; SellToCustomer: Record Customer; CurrentFieldNo: Integer; var SkipBillToContact: Boolean; var SkipSellToContact: Boolean)
    // begin
    //     SalesHeader."Salesperson Commission" := SellToCustomer."Salesperson Commission";
    //     SalesHeader."Salesperson Code 2" := SellToCustomer."Salesperson Code 2";
    //     SalesHeader."Salesperson Commission 2" := SellToCustomer."Salesperson Commission 2";
    //     SalesHeader."Salesperson Code 3" := SellToCustomer."Salesperson Code 3";
    //     SalesHeader."Salesperson Commission 3" := SellToCustomer."Salesperson Commission 3";
    //     // SalesHeader."Shipping Agent Code" := SellToCustomer."Shipping Agent Code";
    //     // SalesHeader."Freight Zone Code" := SellToCustomer."Freight Zone Code";
    //     // SalesHeader."Shipping Instructions" := SellToCustomer."Shipping Instructions";
    //     // SalesHeader."Shipping Comment" := SellToCustomer."Shipping Comment";
    // end;

    // Customer --> Sales Header
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeUpdateShipToSalespersonCode', '', false, false)]
    local procedure OnBeforeUpdateShipToSalespersonCode(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    var
        SellToCust: Record Customer;
    begin
        IsHandled := true;

        SellToCust.Get(SalesHeader."Sell-to Customer No.");
        SalesHeader."Salesperson Code" := SellToCust."Salesperson Code";
        SalesHeader."Salesperson Commission" := SellToCust."Salesperson Commission";
        SalesHeader."Salesperson Code 2" := SellToCust."Salesperson Code 2";
        SalesHeader."Salesperson Commission 2" := SellToCust."Salesperson Commission 2";
        SalesHeader."Salesperson Code 3" := SellToCust."Salesperson Code 3";
        SalesHeader."Salesperson Commission 3" := SellToCust."Salesperson Commission 3";
    end;

    // Ship-to Address --> Sales Header
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterCopyShipToCustomerAddressFieldsFromShipToAddr', '', false, false)]
    local procedure OnAfterCopyShipToCustomerAddressFieldsFromShipToAddr(var SalesHeader: Record "Sales Header"; ShipToAddress: Record "Ship-to Address"; xSalesHeader: Record "Sales Header")
    begin
        SalesHeader."Shipping Agent Code" := ShipToAddress."Shipping Agent Code";
        SalesHeader."Freight Zone Code" := ShipToAddress."Freight Zone Code";
        // SalesHeader."Shipping Instructions" := ShipToAddress."Shipping Instructions";
        SalesHeader."Shipping Comment" := ShipToAddress."Shipping Comment";
    end;

    // Item --> Sales Line
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterCopyFromItem', '', false, false)]
    local procedure OnAfterCopyFromItem(var SalesLine: Record "Sales Line"; Item: Record Item; CurrentFieldNo: Integer; xSalesLine: Record "Sales Line")
    begin
        SalesLine."Discontinued Item" := Item."Discontinued Item";
        SalesLine."Clearance Item" := Item."Clearance Item";
        SalesLine."Sales Price Code" := Item."Sales Price Code"; //TLY-SD - 03/11/2026 - makes more sense to be here
    end;

    // Sales Header (and Customer)  --> Sales Line
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInitHeaderDefaults', '', false, false)]
    local procedure OnAfterInitHeaderDefaults(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header"; xSalesLine: Record "Sales Line")
    var
        Cust: Record Customer;
    begin
        SalesLine."Ship-to Code" := SalesHeader."Ship-to Code";
        Cust.Get(SalesLine."Sell-to Customer No."); //TLY-SD - 03/11/2026 - makes more sense to be here
        SalesLine."Default Price List" := Cust."Default Price List Code"; //TLY-SD - 03/11/2026 - makes more sense to be here
        SalesLine."Price List" := Cust."Default Price List Code"; //TLY-SD - 03/11/2026 - makes more sense to be here
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnValidateShipToCodeOnBeforeCopyShipToAddress', '', false, false)]
    local procedure OnValidateShipToCodeOnBeforeCopyShipToAddress(var SalesHeader: Record "Sales Header"; var xSalesHeader: Record "Sales Header"; var CopyShipToAddress: Boolean)
    begin
        SalesHeader.UpdateSalesLinesByFieldNo(SalesHeader.FieldNo("Ship-to Code"), false)
    end;
}