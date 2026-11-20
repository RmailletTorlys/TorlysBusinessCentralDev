codeunit 50036 TlyGetPstdDocLinesToReverse
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnBeforeGetPstdDocLinesToReverse', '', false, false)]
    local procedure OnBeforeGetPstdDocLinesToReverse(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    var
        Cust: Record Customer;
        SalesPostedDocLines: Page "Posted Sales Document Lines";
    begin
        //we want to filter to only show the document in the header of the CR/RO
        IsHandled := true;

        Cust.Get(SalesHeader."Sell-to Customer No.");
        SalesPostedDocLines.SetToSalesHeader(SalesHeader);
        SalesPostedDocLines.SetRecord(Cust);
        SalesPostedDocLines.ExtraVariables(SalesHeader."Original Invoice No."); //this is our custom add
        SalesPostedDocLines.LookupMode := true;
        if SalesPostedDocLines.RunModal() = ACTION::LookupOK then
            SalesPostedDocLines.CopyLineToDoc();

        Clear(SalesPostedDocLines);
    end;
}