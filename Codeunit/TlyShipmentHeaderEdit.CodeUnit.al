codeunit 50117 TlyShipmentHeaderEdit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shipment Header - Edit", 'OnBeforeSalesShptHeaderModify', '', false, false)]
    local procedure OnBeforeSalesShptHeaderModify(var SalesShptHeader: Record "Sales Shipment Header"; FromSalesShptHeader: Record "Sales Shipment Header")
    var
        RemoveBOL: Boolean;
    begin
        RemoveBOL := Dialog.Confirm('This will just remove the BOL # from this SH, the BOL line will still be populated. Proceed?');
        if RemoveBOL then begin
            SalesShptHeader.Reset();
            SalesShptHeader.SetRange("No.", SalesShptHeader."No.");
            if SalesShptHeader.Find('-') then begin
                SalesShptHeader."BOL No." := '';
                SalesShptHeader."Package Tracking No." := '';
                //  SalesShptHeader.Modify(true);
                Message('BOL # removed from %1.', SalesShptHeader."No.");
            end;
        end;
    end;
}