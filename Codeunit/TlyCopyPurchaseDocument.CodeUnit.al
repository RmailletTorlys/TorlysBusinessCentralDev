codeunit 50047 TlyCopyPurchaseDocument
{
    [EventSubscriber(ObjectType::Report, Report::"Copy Purchase Document", 'OnBeforeUpdateIncludeHeader', '', false, false)]
    local procedure OnBeforeUpdateIncludeHeader(var IncludeHeader: Boolean; DocType: Integer; var PurchaseHeader: Record "Purchase Header"; FromPurchaseHeader: Record "Purchase Header"; var IsHandled: Boolean)
    begin
        IsHandled := true;

        IncludeHeader := true;
    end;

    [EventSubscriber(ObjectType::Report, Report::"Copy Purchase Document", 'OnAfterValidateIncludeHeader', '', false, false)]
    local procedure OnAfterValidateIncludeHeader(var RecalculateLines: Boolean; IncludeHeader: Boolean)
    begin
        RecalculateLines := true;
    end;
}