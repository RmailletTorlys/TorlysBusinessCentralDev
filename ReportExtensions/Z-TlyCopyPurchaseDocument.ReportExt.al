// reportextension 50492 TlyCopyPurchaseDocument extends "Copy Purchase Document"
// {
//     requestpage
//     {
//         trigger OnOpenPage()
//         begin
//             IncludeHeader := true;
//             RecalculateLines := true;
//         end;
//     }
// }