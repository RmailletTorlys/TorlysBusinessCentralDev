reportextension 50492 TlyCopyPurchaseDocument extends "Copy Purchase Document"
{
    // trigger OnPreReport()
    // begin
    //     IncludeHeader := true;
    //     RecalculateLines := true;
    // end;

    // requestpage
    // {
    //     layout
    //     {
    //         modify(IncludeHeader_Options)
    //         {

    //         }
    //     }
    // }
    // [EventSubscriber(ObjectType::Report, Report::"Copy Purchase Document", 'OnBeforeOpenPage', '', false, false)]
    //         local procedure OnAfterValidateIncludeHeader(var RecalculateLines: Boolean; IncludeHeader: Boolean)
    //     begin
    //     end;
}