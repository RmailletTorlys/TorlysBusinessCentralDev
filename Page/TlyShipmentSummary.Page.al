page 52012 TlyShipmentSummary
{
    Caption = 'Shipment Summary for Today';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sales Shipment Header";
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

    trigger OnOpenPage()
    var
        ShipmentHeader: Record "Sales Shipment Header";
    begin
        if ShipmentHeader.FindSet() then
            repeat
                if not Rec.Get(ShipmentHeader."No.") then begin
                    Rec.SetRange("Shipping Agent Code", ShipmentHeader."Shipping Agent Code");
                    Rec.SetRange("Shipment Date", WorkDate());
                    if Rec.IsEmpty() then begin
                        Rec.TransferFields(ShipmentHeader);
                        Rec.Insert();
                    end;
                    Rec.SetRange("Shipping Agent Code");
                end;
            until ShipmentHeader.Next() = 0;
    end;

    procedure GetOrderCount(): Integer
    var
        SalesHeader: Record "Sales Header";
        OrderCount: Integer;
    begin
        SalesHeader.SetFilter("Document Type", 'Order');
        SalesHeader.SetRange("Shipping Agent Code", Rec."Shipping Agent Code");
        SalesHeader.SetRange("Shipment Date", WorkDate());
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
        SalesLine.SetRange("Shipment Date", WorkDate());
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
        SalesLine.SetRange("Shipment Date", WorkDate());
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
        ShipmentHeader.SetRange("Shipment Date", WorkDate());
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
        ShipmentLine.SetRange("Shipment Date", WorkDate());
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
        ShipmentLine.SetRange("Shipment Date", WorkDate());
        if ShipmentLine.Find('-') then
            repeat
                ShipmentWeight += (ShipmentLine.Quantity * ShipmentLine."Net Weight");
            until ShipmentLine.Next() = 0;
        exit(ShipmentWeight);
    end;
}