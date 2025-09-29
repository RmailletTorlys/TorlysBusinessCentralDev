codeunit 50007 PrintPickTicketSOUpdate
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Print", 'OnBeforePrintSalesOrder', '', false, false)]
    local procedure OnBeforePrintSalesOrder(var SalesHeader: Record "Sales Header"; ReportUsage: Integer; var IsPrinted: Boolean)
    begin
        if ReportUsage = 2 then
            UpdatePickTicketPrinted(SalesHeader);
    end;

    local procedure UpdatePickTicketPrinted(var SalesHeader: Record "Sales Header")
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then
            if not ValidateBeforePrinting(SalesHeader) then
                ERROR('Please review errors and retry.');
    end;

    local procedure ValidateBeforePrinting(var SalesHeader: Record "Sales Header"): Boolean
    var
        SalesLine: Record "Sales Line";
        Item: Record "Item";

    begin

        //Is the order released?
        if not (SalesHeader.Status = SalesHeader.Status::Released) then
            ERROR('Order %1 is not released. Please contact Customer Service.', SalesHeader."No.");

        //Is the order on Credit Hold?
        if SalesHeader."On Hold" <> '' then
            ERROR('Order %1 is on Credit hold. Contact the Credit Department.', SalesHeader."No.");

        //Is the order for Billing purposes only?
        if SalesHeader."Order Type" = 'BILLING PURPOSES ONLY' then
            ERROR('Order %1 is for billing purposes only and cannot be printed.', SalesHeader."No.");


        //Is the shipment date of the order in the past?
        if SalesHeader."Shipment Date" < WorkDate() then
            ERROR('Order %1 has a shipment date in the past and cannot be printed. Contact Customer Service', SalesHeader."No.");


        //Is the shipment date of the order on a weekend day?
        if Date2DWY(SalesHeader."Shipment Date", 1) > 5 then
            ERROR('Order %1 has a shipment date on a weekend date and cannot be printed. Please contact Customer Service.', SalesHeader."No.");

        //Is the shipment date of the order too far in the future?
        if ((Date2DWY(WorkDate(), 1) < 5) and (SalesHeader."Shipment Date" - WorkDate() > 1)) or
            ((Date2DWY(WorkDate(), 1) = 5) and (SalesHeader."Shipment Date" - WorkDate() > 3)) then
            ERROR('Order %1 has a shipment date too far in the future. Please contact Customer Service if this order needs to leave sooner.', SalesHeader."No.");

        //Is the order allocated?
        SalesHeader.CALCFIELDS("Qty. To ship");
        if SalesHeader."Qty. To ship" < 1 then
            ERROR('Order %1 is not allocated. Please contact Customer Service.', SalesHeader."No.");

        //Is the order partially allocated for a customer with Shipping Advice Complete?
        SalesHeader.CALCFIELDS("Outstanding Quantity", "Qty. To Ship");
        if (SalesHeader."Outstanding Quantity" <> SalesHeader."Qty. To ship") and
            (SalesHeader."Shipping Advice" = SalesHeader."Shipping Advice"::Complete) then
            ERROR('Order %1 is not fully allocated and is not marked partial shipping advice. Please contact Customer Service', SalesHeader."No.");

        //Is there enough inventory to pick?
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetFilter("Type", 'Item');
        SalesLine.SetFilter("Qty. To Ship", '> 0');

        if not SalesLine.IsEmpty() then
            repeat
                Item.Reset();
                Item.SetRange("No.", SalesLine."No.");
                Item.SetFilter("Location Filter", SalesLine."Location Code");
                if Item.FindSet() then begin


                    Item.CalcFields(Inventory);
                    if SalesLine."Qty. To Ship" > Item.Inventory then
                        ERROR('There is not enough inventory of %1 in %2.\Allocated quantity = %3.\NAV on hand = %4.\Please contact purchasing!', Item."No.", SalesLine."Location Code", SalesLine."Qty. to Ship", Item.Inventory);
                end
            until SalesLine.Next() = 0;

        //NOTIFY IF Gateway to put proper sitckers on boxes.
        if SalesHeader."Shipping Agent Code" = 'GATEWAY' then
            MESSAGE('For Gateway Shipment, Please check that you have applied stickers to required boxes.');


        //Location Code of a line on the order does not match the Order header.
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetFilter("Qty. to Ship", '> 0');

        if not SalesLine.IsEmpty() then
            repeat
                if SalesLine."Location Code" <> SalesHeader."Location Code" then
                    ERROR('Location on Header of Order %1 is %2. This is different than the line for item %3 which is set to %4. Please contact Customer Service.', SalesHeader."No.", SalesHeader."Location Code", SalesLine."No.", SalesLine."Location Code");
            until SalesLine.Next() = 0;


        //NOTIFY that this is not the first pick slip to have been printed.
        if SalesHeader."No. Pick Slips Printed" > 0 then
            Message('Order %1 Pick Ticket was last printed on %2.', SalesHeader."No.", SalesHeader."Pick Slip Printed Date");

        exit(True);
    end;
}