codeunit 57027 TlyReleasePurchaseDocument
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnCodeOnAfterCheck', '', false, false)]
    local procedure OnCodeOnAfterCheck(PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line"; var LinesWereModified: Boolean)
    var
        DimensionSetEntry: Record "Dimension Set Entry";
        HeaderRegion: Code[20];
    // PurchaseLine: Record "Purchase Line";
    begin
        // IsHandled := true;

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
                            Error('Item %1 on line %2 (%3) has a REGION mismatch (%4).', PurchaseLine."No.", PurchaseLine."Line No.", DimensionSetEntry."Dimension Value Code", HeaderRegion);
                until PurchaseLine.Next() = 0;
            end;
        end;
    end;
}