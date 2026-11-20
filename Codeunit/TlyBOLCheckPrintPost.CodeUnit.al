codeunit 57007 TlyBOLCheckPrintPost

{
    Permissions = tabledata "Sales Shipment Header" = rm;

    procedure BOLChecks(BOLHeader: Record TlyBillOfLadingHeader)
    var
        BOLLine: Record TlyBillOfLadingLine;
    begin
        // random checks requested throughout the years
        if BOLHeader."Customer No." = '' then Error('Customer Code cannot be blank!');
        if BOLHeader."Location Code" = '' then Error('Location Code cannot be blank!');
        if BOLHeader."Pickup Date" = 0D then Error('Pickup Date cannot be blank!');
        if BOLHeader."Shipping Agent Code" = '' then Error('Shipping Agent Code cannot be blank!');
        if BOLHeader."Loaded By" = '' then Error('Loaded By cannot be blank!');
        if BOLHeader."Shipping Agent Code" = 'MIDLAND IN' then Message('Did you place both stickers on the BOL?');
        // if BOLHeader."Shipping Agent Code" = 'GATEWAY' then Message('Have you applied stickers to required boxes?'); //TLY-SD - 11/02/2026 - removed per JK

        // check for mismatches between lines and header
        BOLLine.Reset();
        BOLLine.SetFilter("BOL No.", BOLHeader."No.");
        if BOLLine.Find('-') then begin
            repeat
                // if BOLLine."Customer No." <> BOLHeader."Customer No." then begin
                //     Error('Shipment # %1 has a differnet CUSTOMER # than the BOL Header!', BOLLine."Shipment No.")
                // end;
                // if BOLLine."Ship-to Code" <> BOLHeader."Ship-to Code" then begin
                //     Error('Shipment # %1 has a differnet SHIP-TO CODE than the BOL Header!', BOLLine."Shipment No.")
                // end;
                // if BOLLine."Ship-to Name" <> BOLHeader."Ship-to Name" then begin
                //     Error('Shipment # %1 has a differnet NAME than the BOL Header!', BOLLine."Shipment No.")
                // end;
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
        BOLHeader.CalcFields("Weight - Total", "Cases - Total"); //TLY-SD - 11/17/2026 - needed since posting is in CU
        if (BOLHeader."Weight - Flooring" + BOLHeader."Weight - Underlayment Rolls" + BOLHeader."Weight - Mouldings" + BOLHeader."Weight - Other") <> BOLHeader."Weight - Total" then
            Error('Please make sure Category Weights (%1) equal Total Weight (%2)!',
                BOLHeader."Weight - Flooring" + BOLHeader."Weight - Underlayment Rolls" + BOLHeader."Weight - Mouldings" + BOLHeader."Weight - Other", BOLHeader."Weight - Total");
        if (BOLHeader."Cases - Flooring" + BOLHeader."Cases - Underlayment Rolls" + BOLHeader."Cases - Mouldings" + BOLHeader."Cases - Other") <> BOLHeader."Cases - Total" then
            Error('Please make sure Category Cases (%1) equal Total Cases (%2)!',
                BOLHeader."Cases - Flooring" + BOLHeader."Cases - Underlayment Rolls" + BOLHeader."Cases - Mouldings" + BOLHeader."Cases - Other", BOLHeader."Cases - Total");
    end;

    procedure BOLPost(BOLHeader: Record TlyBillOfLadingHeader; var BOLNumber: Code[20])
    //TLY-SD - 11/17/2026 - move to CU
    var
        ProcessedBOLHeader: Record TlyProcessedBillOfLadingHeader;
        BOLLine: Record TlyBillOfLadingLine;
        ProcessedBOLLine: Record TlyProcessedBillOfLadingLine;
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesHeader: Record "Sales Header";
        TransferShipmentHeader: Record "Transfer Shipment Header";
        TransferHeader: Record "Transfer Header";
        CommentLine: Record "Comment Line";
        CommentLine2: Record "Comment Line";
    begin
        if BOLHeader."No. Printed" = 0 then Error('Cannot post until it has first been printed.');
        if BOLHeader."Package Tracking No." = '' then Error('Need to input tracking number before posting.');

        BOLNumber := BOLHeader."No."; //TLY-SD - 11/17/2026 - needed since posting is in CU

        ProcessedBOLHeader.TransferFields(BOLHeader);
        ProcessedBOLHeader.Insert();

        BOLLine.Reset;
        BOLLine.SetFilter("BOL No.", BOLHeader."No.");
        if BOLLine.Find('-') then begin
            repeat
                ProcessedBOLLine.TransferFields(BOLLine);
                ProcessedBOLLine.Insert();
                if SalesShipmentHeader.Get(BOLLine."Shipment No.") then begin
                    SalesShipmentHeader."Package Tracking No." := BOLHeader."Package Tracking No.";
                    SalesShipmentHeader.Modify(true);
                end;
                if SalesHeader.Get(1, BOLLine."Order No.") then begin
                    SalesHeader."Package Tracking No." := BOLHeader."Package Tracking No.";
                    SalesHeader.Modify(true);
                end;
                if TransferShipmentHeader.Get(BOLLine."Shipment No.") then begin
                    TransferShipmentHeader."Package Tracking No." := BOLHeader."Package Tracking No.";
                    TransferShipmentHeader.Modify(true);
                end;
                if TransferHeader.Get(BOLLine."Order No.") then begin
                    TransferHeader."Package Tracking No." := BOLHeader."Package Tracking No.";
                    TransferHeader.Modify(true);
                end;
            until BOLLine.Next = 0;
        end;

        //TLY-SD - 10/01/2025 - start
        //copy comments from Open BOL to Processed BOL
        CommentLine.SetFilter("Table Name", 'Bill of Lading');
        CommentLine.SetRange("No.", BOLHeader."No.");
        if CommentLine.FindSet() then
            repeat
                CommentLine2 := CommentLine;
                CommentLine2."Table Name" := CommentLine."Table Name"::"Processed BOL";
                CommentLine2."No." := BOLHeader."No.";
                CommentLine2.Insert();
                CommentLine.Delete(true);
            until CommentLine.Next() = 0;
        //TLY-SD - 10/01/2025 - end

        Message('%1 has been posted.', BOLHeader."No.");
        BOLLine.DeleteAll();
        // CurrPage.Update();
        BOLHeader.Delete();
        Commit();
    end;
}