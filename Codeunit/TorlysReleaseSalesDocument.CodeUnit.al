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
        SalesHeader.TestField("Sell-to Customer No."); //code exists to not allow delete
        SalesHeader.TestField("Ship-to Code"); //code exists to not allow delete if released
        SalesHeader.TestField("Order Method"); //code added on SO screen to not allow delete if released
        SalesHeader.TestField("Your Reference");
        SalesHeader.TestField("External Document No.");
        SalesHeader.TestField("Tag Name"); //code added on SO screen to not allow delete if released

        DimensionSetEntry.SetRange("Dimension Set ID", SalesHeader."Dimension Set ID");
        DimensionSetEntry.SetFilter("Dimension Code", 'CHANNEL');
        if DimensionSetEntry.IsEmpty then
            Error('Channel must be populated before releasing.'); //code added on SO screen to not allow delete if released

        SalesHeader.TestField("Order Type"); //code added on SO screen to not allow delete if released
        SalesHeader.TestField("Temporary Hold", false); //code added on SO screen to not allow delete if released
        SalesHeader.TestField("Location Code"); //code exists to not allow delete if released
        SalesHeader.TestField("Shipment Date"); //code exists to not allow delete if released
        SalesHeader.TestField("Shipping Instructions"); //code added on SO screen to not allow delete if released
        SalesHeader.TestField("Tax Area Code"); //code exists to not allow delete if released
        SalesHeader.TestField("Shortcut Dimension 1 Code");
        SalesHeader.TestField("Shortcut Dimension 2 Code");
        SalesHeader.TestField("Salesperson Code");
    end;

}