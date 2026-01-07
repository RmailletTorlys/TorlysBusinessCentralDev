// codeunit 50036 TlyGetPstdDocLinesToReverse
// {
//     // we want to filter to only show the document in the header of the CR/RO
//     [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeGetPstdDocLinesToReverse', '', false, false)]
//     local procedure OnBeforeGetPstdDocLinesToReverse(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
//     var
//         Cust: Record Customer;
//         SalesPostedDocLines: Page "Posted Sales Document Lines";
//     begin
//         IsHandled := true;

//         // Message('test invoice %1', SalesHeader."Original Invoice No.");
//         Cust.Get(SalesHeader."Sell-to Customer No.");
//         SalesPostedDocLines.SetToSalesHeader(SalesHeader);
//         SalesPostedDocLines.SetRecord(Cust);
//         // SalesPostedDocLines.SetRange("Document No.",SalesHeader."Original Invoice No.");
//         SalesPostedDocLines.LookupMode := true;
//         if SalesPostedDocLines.RunModal() = ACTION::LookupOK then
//             SalesPostedDocLines.CopyLineToDoc();

//         Clear(SalesPostedDocLines);
//     end;

// }