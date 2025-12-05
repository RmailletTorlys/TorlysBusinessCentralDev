codeunit 57006 TorlysReleaseSalesDocument
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeTestSellToCustomerNo', '', false, false)]
    local procedure OnBeforeTestSellToCustomerNo(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    var
        // GetShortcutDimensionValues: Codeunit "Get Shortcut Dimension Values";
        // DimMgt: codeunit DimensionManagement;
        // ShortcutDimCode: array[8] of Code[20];
        // ChannelDimension: Code[20];
        // SalesHeaderPage: Page "Sales Order";
        DimensionSetEntry: Record "Dimension Set Entry";
    begin
        IsHandled := true;

        // add additional checks that we need
        SalesHeader.TestField("Sell-to Customer No.");
        SalesHeader.TestField("Ship-to Code");
        SalesHeader.TestField("Order Method");
        SalesHeader.TestField("Your Reference");
        SalesHeader.TestField("External Document No.");
        SalesHeader.TestField("Tag Name");

        DimensionSetEntry.SetRange("Dimension Set ID", SalesHeader."Dimension Set ID");
        DimensionSetEntry.SetFilter("Dimension Code", 'CHANNEL');
        if DimensionSetEntry.IsEmpty then
            Error('Channel must be populated before releasing.');

        SalesHeader.TestField("Order Type");
        SalesHeader.TestField("Temporary Hold", false);
        SalesHeader.TestField("Location Code");
        SalesHeader.TestField("Shipment Date");
        SalesHeader.TestField("Shipping Instructions");
        SalesHeader.TestField("Tax Area Code");
        SalesHeader.TestField("Shortcut Dimension 1 Code");
        SalesHeader.TestField("Shortcut Dimension 2 Code");
        SalesHeader.TestField("Salesperson Code");
    end;

}