codeunit 50417 TorlysChangeShipmentDate
{
    procedure ChangeToToday(Rec: Record "Sales Header"; xRec: Record "Sales Header")
    var
        ShipmentDate: Date;
    begin
        ShipmentDate := WorkDate;

        if Rec."Shipping Agent Code" <> 'PU' then Error('Cannot change shipment date as this is not a pickup order.');

        Rec.Status := Rec.Status::Open;
        Rec.Modify(true);
        Rec.Validate(Rec."Shipment Date", ShipmentDate);
        Rec.Modify(true);
        Rec.Status := Rec.Status::Released;
        Rec.Modify(true);
        Message('Order = %1\Previous Shipmet Date = %2\New Shipment Date = %3', Rec."No.", xRec."Shipment Date", Rec."Shipment Date");
    end;

    procedure ChangeToNextBusinessDay(Rec: Record "Sales Header"; xRec: Record "Sales Header")
    var
        ShipmentDate: Date;
    begin
        if Date2DWY(WorkDate(), 1) = 5 then
            ShipmentDate := WorkDate() + 3
        else
            ShipmentDate := WorkDate() + 1;

        if Rec."Shipping Agent Code" <> 'PU' then Error('Cannot change shipment date as this is not a pickup order.');

        Rec.Status := Rec.Status::Open;
        Rec.Modify(true);
        Rec.Validate(Rec."Shipment Date", ShipmentDate);
        Rec.Modify(true);
        Rec.Status := Rec.Status::Released;
        Rec.Modify(true);
        Message('Order = %1\Previous Shipmet Date = %2\New Shipment Date = %3', Rec."No.", xRec."Shipment Date", Rec."Shipment Date");
    end;

    procedure ChangeTo2BusinessDays(Rec: Record "Sales Header"; xRec: Record "Sales Header")
    var
        ShipmentDate: Date;
    begin
        if Date2DWY(WorkDate(), 1) = 5 then
            ShipmentDate := WorkDate() + 4
        else
            ShipmentDate := WorkDate() + 2;

        if Rec."Shipping Agent Code" <> 'PU' then Error('Cannot change shipment date as this is not a pickup order.');

        Rec.Status := Rec.Status::Open;
        Rec.Modify(true);
        Rec.Validate(Rec."Shipment Date", ShipmentDate);
        Rec.Modify(true);
        Rec.Status := Rec.Status::Released;
        Rec.Modify(true);
        Message('Order = %1\Previous Shipmet Date = %2\New Shipment Date = %3', Rec."No.", xRec."Shipment Date", Rec."Shipment Date");
    end;
}

