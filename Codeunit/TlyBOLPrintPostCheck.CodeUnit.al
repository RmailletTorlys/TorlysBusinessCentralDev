codeunit 57007 TlyBOLPrintPostCheck
{
    procedure BOLChecks(BOLHeader: Record TlyBillOfLadingHeader)
    var
        BOLLine: Record TlyBillOfLadingLine;
    begin
        // random checks requested throughout the years
        if BOLHeader."Customer No." = '' then Error('Customer Code cannot be blank!');
        if BOLHeader."Location Code" = '' then Error('Location Code cannot be blank!');
        if BOLHeader."Pickup Date" = 0D then Error('Pickup Date cannot be blank!');
        if BOLHeader."Shipping Agent Code" = '' then Error('Shipping Agent Code cannot be blank!');
        if BOLHeader."Shipping Agent Code" = 'MIDLAND IN' then Message('Did you place both stickers on the BOL?');
        if BOLHeader."Shipping Agent Code" = 'GATEWAY' then Message('Have you applied stickers to required boxes?');

        // check for mismatches between lines and header
        BOLLine.Reset();
        BOLLine.SetFilter("BOL No.", BOLHeader."No.");
        if BOLLine.Find('-') then begin
            repeat
                if BOLLine."Customer No." <> BOLHeader."Customer No." then begin
                    Error('Shipment # %1 has a differnet CUSTOMER # than the BOL Header!', BOLLine."Shipment No.")
                end;
                if BOLLine."Ship-to Code" <> BOLHeader."Ship-to Code" then begin
                    Error('Shipment # %1 has a differnet SHIP-TO CODE than the BOL Header!', BOLLine."Shipment No.")
                end;
                if BOLLine."Ship-to Name" <> BOLHeader."Ship-to Name" then begin
                    Error('Shipment # %1 has a differnet NAME than the BOL Header!', BOLLine."Shipment No.")
                end;
                if BOLLine."Ship-to Address" <> BOLHeader."Ship-to Address" then begin
                    Error('Shipment # %1 has a differnet ADDRESS than the BOL Header!', BOLLine."Shipment No.")
                end;
                if BOLLine."Ship-to Address 2" <> BOLHeader."Ship-to Address 2" then begin
                    Error('Shipment # %1 has a differnet ADDRESS 2 than the BOL Header!', BOLLine."Shipment No.")
                end;
                if BOLLine."Ship-to City" <> BOLHeader."Ship-to City" then begin
                    Error('Shipment # %1 has a differnet CITY than the BOL Header!', BOLLine."Shipment No.")
                end;
                if BOLLine."Ship-to County" <> BOLHeader."Ship-to County" then begin
                    Error('Shipment # %1 has a differnet COUNTY than the BOL Header!', BOLLine."Shipment No.")
                end;
                if BOLLine."Ship-to Post Code" <> BOLHeader."Ship-to Post Code" then begin
                    Error('Shipment # %1 has a differnet POST CODE than the BOL Header!', BOLLine."Shipment No.")
                end;
                if BOLLine."Ship-to Country/Region Code" <> BOLHeader."Ship-to Country/Region Code" then begin
                    Error('Shipment # %1 has a differnet COUNTRY than the BOL Header!', BOLLine."Shipment No.")
                end;
                if BOLLine."Shipping Agent Code" <> BOLHeader."Shipping Agent Code" then begin
                    Error('Shipment # %1 has a differnet SHIPPING AGENT CODE than the BOL Header!', BOLLine."Shipment No.")
                end;
            until BOLLine.Next = 0;
        end;

        // make sure case counts are not all zero
        if (BOLHeader."Transaction Type" = BOLHeader."Transaction Type"::Shipment) and
            ((BOLHeader."Cases - Flooring" + BOLHeader."Cases - Underlayment Rolls" + BOLHeader."Cases - Mouldings" + BOLHeader."Cases - Other") = 0) then
            Error('Please check case counts as they are empty!');

        // check if category weights/cases add up to the total BOL Weight/Cases
        if (BOLHeader."Weight - Flooring" + BOLHeader."Weight - Underlayment Rolls" + BOLHeader."Weight - Mouldings" + BOLHeader."Weight - Other") <> BOLHeader."Weight - Total" then
            Error('Please make sure Category Weights (%1) equal Total Weight (%2)!',
                BOLHeader."Weight - Flooring" + BOLHeader."Weight - Underlayment Rolls" + BOLHeader."Weight - Mouldings" + BOLHeader."Weight - Other", BOLHeader."Weight - Total");
        if (BOLHeader."Cases - Flooring" + BOLHeader."Cases - Underlayment Rolls" + BOLHeader."Cases - Mouldings" + BOLHeader."Cases - Other") <> BOLHeader."Cases - Total" then
            Error('Please make sure Category Cases (%1) equal Total Cases (%2)!',
                BOLHeader."Cases - Flooring" + BOLHeader."Cases - Underlayment Rolls" + BOLHeader."Cases - Mouldings" + BOLHeader."Cases - Other", BOLHeader."Cases - Total");
    end;
}