codeunit 50414 "Manual Release Check CR"
{

    [EventSubscriber(ObjectType::CodeUnit, CodeUnit::"Release Sales Document", 'OnBeforePerformManualReleaseProcedure', '', false, false)]
    local procedure OnBeforePerformManualReleaseProcedure(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean)
    begin

        if SalesHeader."On Hold" <> '' then begin
            Message('Order On Credit Hold. Please Contact the Credit Team for Support. Specify the following - Order #: %1 for customer %2', SalesHeader."No.", SalesHeader."Sell-to Customer No.");
            IsHandled := true;
        end;

    end;


}