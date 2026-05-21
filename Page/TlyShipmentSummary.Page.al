page 52012 TlyShipmentSummary
{
    Caption = 'Shipment Summary';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    // SourceTable = "Sales Shipment Header";
    SourceTable = "Sales Header";
    SourceTableTemporary = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Agent';
                }
                field(OrderCount; GetOrderCount)
                {
                    ApplicationArea = All;
                    Caption = 'Order Count';
                    ToolTip = 'Order Count';
                    Editable = false;
                }
                field(OrderQuantity; GetOrderQuantity)
                {
                    ApplicationArea = All;
                    Caption = 'Order Quantity';
                    ToolTip = 'Order Quantity';
                    Editable = false;
                }
                field(OrderWeight; GetOrderWeight)
                {
                    ApplicationArea = All;
                    Caption = 'Order Weight';
                    ToolTip = 'Order Weight';
                    Editable = false;
                }
                field(ShipmentCount; GetShipmentCount)
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Count';
                    ToolTip = 'Shipment Count';
                    Editable = false;
                }
                field(ShipmentQuantity; GetShipmentQuantity)
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Quantity';
                    ToolTip = 'Shipment Quantity';
                    Editable = false;
                }
                field(ShipmentWeight; GetShipmentWeight)
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Weight';
                    ToolTip = 'Shipment Weight';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(Tomorrow; ShowTomorrow)
            { }
        }
        area(Navigation)
        {
            action(ShowTomorrow)
            {
                Caption = 'Show Tomorrow';
                ToolTip = 'Show Tomorrow';
                ApplicationArea = All;
                Image = Filter;
                trigger OnAction()
                var
                    UserSetup: Record "User Setup";
                    SalesHeader: Record "Sales Header";
                begin
                    Rec.Reset();
                    CurrPage.Update(false);

                    UserSetup.Get(UserId);
                    if UserSetup."Default Location Code" = 'TOR' then
                        LocationCode := 'TOR|QUATOR|CLAIMS TOR'
                    else if UserSetup."Default Location Code" = 'CAL' then
                        LocationCode := 'CAL|QUACAL|CLAIMS CAL';

                    if Date2DWY(WorkDate(), 1) = 5 then
                        ShipmentDate := WorkDate() + 3
                    else
                        ShipmentDate := WorkDate() + 1;

                    if SalesHeader.FindSet() then
                        repeat
                            if not Rec.Get('1', SalesHeader."No.") then begin
                                Rec.SetRange("Shipping Agent Code", SalesHeader."Shipping Agent Code");
                                Rec.SetFilter("Location Code", LocationCode);
                                Rec.SetRange("Shipment Date", ShipmentDate);
                                if Rec.IsEmpty() then begin
                                    Rec.TransferFields(SalesHeader);
                                    Rec.Insert();
                                end;
                                Rec.SetRange("Shipping Agent Code");
                            end;
                        until SalesHeader.Next() = 0;
                end;
            }
        }
    }

    // trigger OnOpenPage()
    // var
    //     ShipmentHeader: Record "Sales Shipment Header";
    // begin
    //     if ShipmentHeader.FindSet() then
    //         repeat
    //             if not Rec.Get(ShipmentHeader."No.") then begin
    //                 Rec.SetRange("Shipping Agent Code", ShipmentHeader."Shipping Agent Code");
    //                 Rec.SetRange("Shipment Date", WorkDate());
    //                 if Rec.IsEmpty() then begin
    //                     Rec.TransferFields(ShipmentHeader);
    //                     Rec.Insert();
    //                 end;
    //                 Rec.SetRange("Shipping Agent Code");
    //             end;
    //         until ShipmentHeader.Next() = 0;
    // end;

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
        SalesHeader: Record "Sales Header";
    begin
        UserSetup.Get(UserId);
        if UserSetup."Default Location Code" = 'TOR' then
            LocationCode := 'TOR|QUATOR|CLAIMS TOR'
        else if UserSetup."Default Location Code" = 'CAL' then
            LocationCode := 'CAL|QUACAL|CLAIMS CAL';

        ShipmentDate := WorkDate();

        if SalesHeader.FindSet() then
            repeat
                if not Rec.Get('1', SalesHeader."No.") then begin
                    Rec.SetRange("Shipping Agent Code", SalesHeader."Shipping Agent Code");
                    Rec.SetFilter("Location Code", LocationCode);
                    Rec.SetRange("Shipment Date", ShipmentDate);
                    if Rec.IsEmpty() then begin
                        Rec.TransferFields(SalesHeader);
                        Rec.Insert();
                    end;
                    Rec.SetRange("Shipping Agent Code");
                end;
            until SalesHeader.Next() = 0;
    end;

    procedure GetOrderCount(): Integer
    var
        SalesHeader: Record "Sales Header";
        OrderCount: Integer;
    begin
        SalesHeader.SetFilter("Document Type", 'Order');
        SalesHeader.SetRange("Shipping Agent Code", Rec."Shipping Agent Code");
        SalesHeader.SetFilter("Location Code", LocationCode);
        SalesHeader.SetRange("Shipment Date", ShipmentDate);
        if SalesHeader.Find('-') then
            repeat
                OrderCount := SalesHeader.Count;
            until SalesHeader.Next() = 0;
        exit(OrderCount);
    end;

    procedure GetOrderQuantity(): Decimal
    var
        SalesLine: Record "Sales Line";
        OrderQuantity: Decimal;
    begin
        SalesLine.SetFilter("Document Type", 'Order');
        SalesLine.SetRange("Shipping Agent Code", Rec."Shipping Agent Code");
        SalesLine.SetFilter("Location Code", LocationCode);
        SalesLine.SetRange("Shipment Date", ShipmentDate);
        if SalesLine.Find('-') then
            repeat
                OrderQuantity += SalesLine."Qty. to Ship";
            until SalesLine.Next() = 0;
        exit(OrderQuantity);
    end;

    procedure GetOrderWeight(): Decimal
    var
        SalesLine: Record "Sales Line";
        OrderWeight: Decimal;
    begin
        SalesLine.Reset();
        SalesLine.SetRange("Shipping Agent Code", Rec."Shipping Agent Code");
        SalesLine.SetFilter("Location Code", LocationCode);
        SalesLine.SetRange("Shipment Date", ShipmentDate);
        if SalesLine.Find('-') then
            repeat
                OrderWeight += (SalesLine."Qty. to Ship" * SalesLine."Net Weight");
            until SalesLine.Next() = 0;
        exit(OrderWeight);
    end;

    procedure GetShipmentCount(): Integer
    var
        ShipmentHeader: Record "Sales Shipment Header";
        ShipmentCount: Integer;
    begin
        ShipmentHeader.Reset();
        ShipmentHeader.SetRange("Shipping Agent Code", Rec."Shipping Agent Code");
        ShipmentHeader.SetFilter("Location Code", LocationCode);
        ShipmentHeader.SetRange("Shipment Date", ShipmentDate);
        if ShipmentHeader.Find('-') then
            repeat
                ShipmentCount := ShipmentHeader.Count;
            until ShipmentHeader.Next() = 0;
        exit(ShipmentCount);
    end;

    procedure GetShipmentQuantity(): Decimal
    var
        ShipmentLine: Record "Sales Shipment Line";
        ShipmentQuantity: Decimal;
    begin
        ShipmentLine.Reset();
        ShipmentLine.SetRange("Shipping Agent Code", Rec."Shipping Agent Code");
        ShipmentLine.SetFilter("Location Code", LocationCode);
        ShipmentLine.SetRange("Shipment Date", ShipmentDate);
        if ShipmentLine.Find('-') then
            repeat
                ShipmentQuantity += ShipmentLine.Quantity;
            until ShipmentLine.Next() = 0;
        exit(ShipmentQuantity);
    end;

    procedure GetShipmentWeight(): Decimal
    var
        ShipmentLine: Record "Sales Shipment Line";
        ShipmentWeight: Decimal;
    begin
        ShipmentLine.Reset();
        ShipmentLine.SetRange("Shipping Agent Code", Rec."Shipping Agent Code");
        ShipmentLine.SetFilter("Location Code", LocationCode);
        ShipmentLine.SetRange("Shipment Date", ShipmentDate);
        if ShipmentLine.Find('-') then
            repeat
                ShipmentWeight += (ShipmentLine.Quantity * ShipmentLine."Net Weight");
            until ShipmentLine.Next() = 0;
        exit(ShipmentWeight);
    end;

    var
        LocationCode: Code[25];
        ShipmentDate: Date;
}