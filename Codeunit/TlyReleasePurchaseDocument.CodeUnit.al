codeunit 57027 TlyReleasePurchaseDocument
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnCodeOnAfterCheckPurchaseReleaseRestrictions', '', false, false)]
    local procedure OnCodeOnAfterCheckPurchaseReleaseRestrictions(var PurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean)
    var
        DimensionSetEntry: Record "Dimension Set Entry";
        HeaderRegion: Code[20];
        PurchaseLine: Record "Purchase Line";
    begin
        IsHandled := true;

        // these are for PO only
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order then begin

            DimensionSetEntry.SetRange("Dimension Set ID", PurchaseHeader."Dimension Set ID");
            DimensionSetEntry.SetFilter("Dimension Code", 'REGION');
            if DimensionSetEntry.Find('-') then
                HeaderRegion := DimensionSetEntry."Dimension Value Code";

            PurchaseLine.Reset();
            PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
            PurchaseLine.SetFilter(Type, 'Item');
            if PurchaseLine.Find('-') then begin
                repeat
                    DimensionSetEntry.SetRange("Dimension Set ID", PurchaseLine."Dimension Set ID");
                    DimensionSetEntry.SetFilter("Dimension Code", 'REGION');
                    if DimensionSetEntry.Find('-') then
                        if HeaderRegion <> DimensionSetEntry."Dimension Value Code" then
                            Error('Line %1 with item %2 has a Region mismatch.', PurchaseLine."Line No.", PurchaseLine."No.");
                until PurchaseLine.Next() = 0;
            end;
        end;
    end;
}