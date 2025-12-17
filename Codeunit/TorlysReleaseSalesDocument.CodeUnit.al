codeunit 57006 TorlysReleaseSalesDocument
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeTestSellToCustomerNo', '', false, false)]
    local procedure OnBeforeTestSellToCustomerNo(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    var
        DimensionSetEntry: Record "Dimension Set Entry";
    begin
        IsHandled := true;

        // these are for SO only
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            SalesHeader.TestField("Sell-to Customer No."); //code exists to not allow delete
            SalesHeader.TestField("Ship-to Code"); //code exists to not allow delete if released
            SalesHeader.TestField("Order Method"); //code added on screen to not allow delete if released
            SalesHeader.TestField("Your Reference"); //code added on screen to not allow delete if released
            SalesHeader.TestField("External Document No."); //code added on screen to not allow delete if released
            SalesHeader.TestField("Tag Name"); //code added on screen to not allow delete if released

            DimensionSetEntry.SetRange("Dimension Set ID", SalesHeader."Dimension Set ID");
            DimensionSetEntry.SetFilter("Dimension Code", 'CHANNEL');
            if DimensionSetEntry.IsEmpty then
                Error('Channel must be populated before releasing.'); //code added on screen to not allow delete if released

            SalesHeader.TestField("Order Type"); //code added on screen to not allow delete if released
            SalesHeader.TestField("Shipment Date"); //code exists to not allow delete if released
            SalesHeader.TestField("Temporary Hold", false); //code added on screen to not allow delete if released
            SalesHeader.TestField("Shipping Instructions"); //code added on screen to not allow delete if released
            SalesHeader.TestField("Location Code"); //code exists to not allow delete if released
            SalesHeader.TestField("Tax Area Code"); //code exists to not allow delete if released
            SalesHeader.TestField("Shortcut Dimension 1 Code"); //mandatory comes from GL Account setup
            SalesHeader.TestField("Shortcut Dimension 2 Code"); //mandatory comes from GL Account setup
            SalesHeader.TestField("Salesperson Code"); //code added on screen to not allow delete if released
        end;

        // these are for SI only
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice then begin
            SalesHeader.TestField("Sell-to Customer No."); //code exists to not allow delete
            SalesHeader.TestField("Ship-to Code"); //code exists to not allow delete if released
            SalesHeader.TestField("External Document No."); //code added on screen to not allow delete if released

            DimensionSetEntry.SetRange("Dimension Set ID", SalesHeader."Dimension Set ID");
            DimensionSetEntry.SetFilter("Dimension Code", 'CHANNEL');
            if DimensionSetEntry.IsEmpty then
                Error('Channel must be populated before releasing.'); //code added on screen to not allow delete if released

            SalesHeader.TestField("Location Code"); //code exists to not allow delete if released
            SalesHeader.TestField("Tax Area Code"); //code exists to not allow delete if released
            SalesHeader.TestField("Shortcut Dimension 1 Code"); //mandatory comes from GL Account setup
            SalesHeader.TestField("Shortcut Dimension 2 Code"); //mandatory comes from GL Account setup
            SalesHeader.TestField("Salesperson Code"); //code added on screen to not allow delete if released
        end;

        // these are for CM and RO only
        if SalesHeader."Document Type" in [SalesHeader."Document Type"::"Credit Memo", SalesHeader."Document Type"::"Return Order"] then begin
            SalesHeader.TestField("Sell-to Customer No."); //code exists to not allow delete
            SalesHeader.TestField("Ship-to Code"); //code exists to not allow delete if released
            SalesHeader.TestField("Order Method"); //code added on screen to not allow delete if released
            SalesHeader.TestField("Your Reference"); //code added on screen to not allow delete if released
            SalesHeader.TestField("External Document No."); //code added on screen to not allow delete if released
            SalesHeader.TestField("Tag Name"); //code added on screen to not allow delete if released

            DimensionSetEntry.SetRange("Dimension Set ID", SalesHeader."Dimension Set ID");
            DimensionSetEntry.SetFilter("Dimension Code", 'CHANNEL');
            if DimensionSetEntry.IsEmpty then
                Error('Channel must be populated before releasing.'); //code added on screen to not allow delete if released

            SalesHeader.TestField("Reason Code"); //code added on screen to not allow delete if released
            SalesHeader.TestField("Location Code"); //code exists to not allow delete if released
            SalesHeader.TestField("Tax Area Code"); //code exists to not allow delete if released
            SalesHeader.TestField("Shortcut Dimension 1 Code"); //mandatory comes from GL Account setup
            SalesHeader.TestField("Shortcut Dimension 2 Code"); //mandatory comes from GL Account setup
            SalesHeader.TestField("Salesperson Code"); //code added on screen to not allow delete if released

        end;
    end;

}