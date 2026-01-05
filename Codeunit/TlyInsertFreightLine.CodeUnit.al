codeunit 50414 TlyInsertFreightLine
{
    // 2 procedures here
    // 1 for adding from SO related screens
    // 1 for adding when posting SH

    // this is for adding freight when initiated from a sales order or related screen by clicking a button
    // main difference here is respecting minimum charge
    procedure SOscreens(Rec: Record "Sales Header")

    var
        FreightZones: Record TlyFreightZone;
        LineCountTotal: Integer;
        LineCountMoulding: Integer;
        LineCountMinimumCharge: Integer;
        ShippedQuantityFloor: Decimal;
        ShippedQuantityUnderlayRoll: Decimal;
        ShippedQuantityUnderlaySheet: Decimal;
        FreightAmount: Decimal;
        OrderFreight: Decimal;
        OrderFreightCount: Decimal;
        Item: Record "Item";
        QtyPerRoll: Integer;
        QtyPerCase: Integer;
        UOMMgt: Codeunit "Unit of Measure Management";
        SalesLine: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        // don't process if meet these criteria
        if Rec."Shipping Agent Code" = 'PU' then Error('Order is for pickup, therefore no freight charge.');
        if Rec."Order Type" = 'CLAIM REPLACEMENT' then Error('Order is a claim replacement, therefore no freight charge');
        if Rec."Freight Zone Code" = '' then Error('No freight zone code selected. Please choose before adding freight.');

        // clear variables, get, and set values to 0
        Clear(FreightZones);
        FreightZones.Get(Rec."Freight Zone Code");
        LineCountTotal := 0;
        LineCountMoulding := 0;
        LineCountMinimumCharge := 0;
        ShippedQuantityFloor := 0.0;
        ShippedQuantityUnderlayRoll := 0;
        ShippedQuantityUnderlaySheet := 0;
        FreightAmount := 0.0;
        OrderFreight := 0.0;
        OrderFreightCount := 0;
        Clear(Item);
        QtyPerRoll := 0;
        QtyPerCase := 0;
        SalesSetup.Get;

        // check open freight charge on this order
        OrderFreight := 0.0;
        OrderFreightCount := 0;
        SalesLine.Reset;
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("No.", SalesSetup."Freight G/L Acc. No.");
        SalesLine.SetFilter("Qty. to Invoice", '%1', 1);
        if SalesLine.Find('-') then begin
            repeat
                OrderFreight := OrderFreight + (SalesLine."Line Amount");
                OrderFreightCount := OrderFreightCount + 1;
            until SalesLine.Next = 0;
        end else begin
            OrderFreight := 0;
        end;

        // count number of lines on order
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Qty. to Invoice", '>0');
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Gen. Prod. Posting Group", '<>IFS');
        // SalesLine.SetFilter("No.", '<>61600');
        SalesLine.SetFilter("No.", '<>%1', SalesSetup."Freight G/L Acc. No.");
        if SalesLine.Find('-') then begin
            repeat
                LineCountTotal := LineCountTotal + 1;
            until SalesLine.Next = 0;
        end;

        // count number of lines that have a moulding
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Qty. to Invoice", '>0');
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Gen. Prod. Posting Group", 'MOULDINGS|MQ MOULDINGS|SS MOULDINGS');
        if SalesLine.Find('-') then begin
            repeat
                LineCountMoulding := LineCountMoulding + 1;
            until SalesLine.Next = 0;
        end;

        // count number of lines that use minimum charge
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Qty. to Invoice", '>0');
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Gen. Prod. Posting Group", 'ACCESSORY|MQ CARPET TILE');
        if SalesLine.Find('-') then begin
            repeat
                LineCountMinimumCharge := LineCountMinimumCharge + 1;
            until SalesLine.Next = 0;
        end;

        // calculate flooring quantity shipped
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Qty. to Invoice", '>0');
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Gen. Prod. Posting Group",
                'CORK|CORKWOOD|HARDWOOD|LAMINATE|LEATHER|MQ HARDWOOD|MQ LAMINATE|MQ VINYL DB|MQ VINYL LL|MQ VINYL SPC|MQ VINYL WPC|SS HARDWOOD|VINYL EW|VINYL RW|VINYL UW|WALLS');
        if SalesLine.Find('-') then begin
            repeat
                ShippedQuantityFloor := ShippedQuantityFloor + SalesLine."Qty. to Invoice";
            until SalesLine.Next = 0;
        end;

        // calculate underlay (roll) quantity shipped
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Qty. to Invoice", '>0');
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Gen. Prod. Posting Group", 'UNDERLAYMENT');
        SalesLine.SETFILTER("Unit of Measure Code", 'ROLL');
        if SalesLine.Find('-') then begin
            repeat
                // Item.Get(SalesLine."No.");
                // QtyPerRoll := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'ROLL');
                // ShippedQuantityUnderlayRoll := Round(ShippedQuantityUnderlayRoll + (SalesLine."Qty. to Invoice" / QtyPerRoll), 1, '>');
                ShippedQuantityUnderlayRoll := ShippedQuantityUnderlayRoll + SalesLine."Qty. to Invoice";
            until SalesLine.Next = 0;
        end;

        // calculate underlay (sheet/case) quantity shipped
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Qty. to Invoice", '>0');
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Gen. Prod. Posting Group", 'UNDERLAYMENT');
        SalesLine.SetFilter("Unit of Measure Code", '<>ROLL');
        if SalesLine.Find('-') then begin
            repeat
                Item.Get(SalesLine."No.");
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE');
                ShippedQuantityUnderlaySheet := Round(ShippedQuantityUnderlaySheet + (SalesLine."Qty. to Invoice" / QtyPerCase), 1, '>');
            until SalesLine.Next = 0;
        end;

        // if there are no shipped lines, then stop the process
        if LineCountTotal = 0 then begin
            Error('Are there any lines to invoice?');
            // if order only has mouldings, charge the moulding minimum charge
        end else if LineCountTotal = LineCountMoulding then begin
            FreightAmount := FreightZones."Minimum charge (moulding)";
            // if order only has minimum charge lines, charge the minimum charge
        end else if LineCountTotal = LineCountMinimumCharge then begin
            FreightAmount := FreightZones."Minimum Charge";
            // if order is mixed, charge minimum or rate per sqft/roll
        end else if (ShippedQuantityFloor > 0) or (ShippedQuantityUnderlayRoll > 0) or (ShippedQuantityUnderlaySheet > 0) then begin
            FreightAmount := (ShippedQuantityFloor * FreightZones."Rate per sqft (floor)")
                            + (ShippedQuantityUnderlayRoll * FreightZones."Rate per roll (underlay)")
                            + (ShippedQuantityUnderlaySheet * FreightZones."Rate per case (sheet underlay)");
            // if freight amount is below the minimum let the user decide what to charge
            if FreightZones."Minimum Charge" > FreightAmount then begin
                if Confirm('Freight is below the minimum, would you like to charge the minimum?', true) then
                    FreightAmount := FreightZones."Minimum Charge"
                else
                    FreightAmount := (ShippedQuantityFloor * FreightZones."Rate per sqft (floor)")
                                    + (ShippedQuantityUnderlayRoll * FreightZones."Rate per roll (underlay)")
                                    + (ShippedQuantityUnderlaySheet * FreightZones."Rate per case (sheet underlay)");
            end;
        end;

        // add freight line
        if OrderFreightCount > 0 then begin
            Message('Current freight on order = %1\Proposed freight should = %2\Please change manually if necessary!', OrderFreight, FreightAmount)
        end else begin
            SalesLine.Reset;
            SalesLine.SetRange("Document Type", Rec."Document Type");
            SalesLine.SetRange("Document No.", Rec."No.");
            SalesLine.Find('+');
            SalesLine.Init;
            SalesLine."Line No." := SalesLine."Line No." + 10000;
            SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
            SalesLine.Validate("No.", SalesSetup."Freight G/L Acc. No.");
            SalesLine.Validate(Description, 'Freight charge');
            SalesLine.Validate(Quantity, 1);
            // SalesLine.Validate("Qty. to Ship", 1);
            // SalesLine.Validate("Qty. to Invoice", 1);
            SalesLine.Validate("Unit Price", FreightAmount);
            SalesLine.Insert;
        end;
    end;

    // this is for adding freight when initiated during posting of shipment from the warehouse screens
    // main difference here is not respecting minimum charge and just doing the math
    procedure SHposting(Rec: Record "Sales Header")

    var
        FreightZones: Record TlyFreightZone;
        LineCountTotal: Integer;
        LineCountMoulding: Integer;
        LineCountMinimumCharge: Integer;
        ShippedQuantityFloor: Decimal;
        ShippedQuantityUnderlayRoll: Decimal;
        ShippedQuantityUnderlaySheet: Decimal;
        FreightAmount: Decimal;
        OrderFreightCount: Decimal;
        Item: Record "Item";
        QtyPerRoll: Integer;
        QtyPerCase: Integer;
        UOMMgt: Codeunit "Unit of Measure Management";
        SalesLine: Record "Sales Line";
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        // don't process if meet these criteria
        if Rec."Shipping Agent Code" = 'PU' then exit;
        if Rec."Order Type" = 'CLAIM REPLACEMENT' then exit;
        if Rec."Freight Zone Code" = '' then exit;

        // clear variables, get, and set values to 0
        Clear(FreightZones);
        FreightZones.Get(Rec."Freight Zone Code");
        LineCountTotal := 0;
        LineCountMoulding := 0;
        LineCountMinimumCharge := 0;
        ShippedQuantityFloor := 0.0;
        ShippedQuantityUnderlayRoll := 0;
        ShippedQuantityUnderlaySheet := 0;
        FreightAmount := 0.0;
        OrderFreightCount := 0;
        Clear(Item);
        QtyPerRoll := 0;
        QtyPerCase := 0;
        SalesSetup.Get;

        // check open freight charge on this order
        SalesLine.Reset;
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("No.", SalesSetup."Freight G/L Acc. No.");
        SalesLine.SetFilter("Qty. to Invoice", '%1', 1);
        if SalesLine.Find('-') then begin
            repeat
                OrderFreightCount := OrderFreightCount + 1;
            until SalesLine.Next = 0;
        end else begin
            OrderFreightCount := 0;
        end;

        // count number of lines on order
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Qty. to Invoice", '>0');
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Gen. Prod. Posting Group", '<>IFS');
        // SalesLine.SetFilter("No.", '<>61600');
        SalesLine.SetFilter("No.", '<>%1', SalesSetup."Freight G/L Acc. No.");
        if SalesLine.Find('-') then begin
            repeat
                LineCountTotal := LineCountTotal + 1;
            until SalesLine.Next = 0;
        end;

        // count number of lines that have a moulding
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Qty. to Invoice", '>0');
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Gen. Prod. Posting Group", 'MOULDINGS|MQ MOULDINGS|SS MOULDINGS');
        if SalesLine.Find('-') then begin
            repeat
                LineCountMoulding := LineCountMoulding + 1;
            until SalesLine.Next = 0;
        end;

        // count number of lines that use minimum charge
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Qty. to Invoice", '>0');
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Gen. Prod. Posting Group", 'ACCESSORY|MQ CARPET TILE');
        if SalesLine.Find('-') then begin
            repeat
                LineCountMinimumCharge := LineCountMinimumCharge + 1;
            until SalesLine.Next = 0;
        end;

        // calculate flooring quantity shipped
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Qty. to Invoice", '>0');
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Gen. Prod. Posting Group",
                'CORK|CORKWOOD|HARDWOOD|LAMINATE|LEATHER|MQ HARDWOOD|MQ LAMINATE|MQ VINYL DB|MQ VINYL LL|MQ VINYL SPC|MQ VINYL WPC|SS HARDWOOD|VINYL EW|VINYL RW|VINYL UW|WALLS');
        if SalesLine.Find('-') then begin
            repeat
                ShippedQuantityFloor := ShippedQuantityFloor + SalesLine."Qty. to Invoice";
            until SalesLine.Next = 0;
        end;

        // calculate underlay (roll) quantity shipped
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Qty. to Invoice", '>0');
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Gen. Prod. Posting Group", 'UNDERLAYMENT');
        SalesLine.SetFilter("Unit of Measure Code", 'ROLL');
        if SalesLine.Find('-') then begin
            repeat
                // Item.Get(SalesLine."No.");
                // QtyPerRoll := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'ROLL');
                // ShippedQuantityUnderlayRoll := Round(ShippedQuantityUnderlayRoll + (SalesLine."Qty. to Invoice" / QtyPerRoll), 1, '>');
                ShippedQuantityUnderlayRoll := ShippedQuantityUnderlayRoll + SalesLine."Qty. to Invoice";
            until SalesLine.Next = 0;
        end;

        // calculate underlay (sheet/case) quantity shipped
        SalesLine.Reset;
        SalesLine.SetRange("Document Type", Rec."Document Type");
        SalesLine.SetRange("Document No.", Rec."No.");
        SalesLine.SetFilter("Qty. to Invoice", '>0');
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Gen. Prod. Posting Group", 'UNDERLAYMENT');
        SalesLine.SetFilter("Unit of Measure Code", '<>ROLL');
        if SalesLine.Find('-') then begin
            repeat
                Item.Get(SalesLine."No.");
                QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE');
                ShippedQuantityUnderlaySheet := Round(ShippedQuantityUnderlaySheet + (SalesLine."Qty. to Invoice" / QtyPerCase), 1, '>');
            until SalesLine.Next = 0;
        end;

        // if there are no shipped lines, then stop the process
        if LineCountTotal = 0 then begin
            Error('Are there any lines to invoice?');
            // if order only has mouldings, charge the moulding minimum charge
        end else if LineCountTotal = LineCountMoulding then begin
            FreightAmount := FreightZones."Minimum charge (moulding)";
            // if order only has minimum charge lines, charge the minimum charge
        end else if LineCountTotal = LineCountMinimumCharge then begin
            FreightAmount := FreightZones."Minimum Charge";
            // if order is mixed, charge minimum or rate per sqft/roll
        end else if (ShippedQuantityFloor > 0) or (ShippedQuantityUnderlayRoll > 0) or (ShippedQuantityUnderlaySheet > 0) then begin
            FreightAmount := (ShippedQuantityFloor * FreightZones."Rate per sqft (floor)")
                            + (ShippedQuantityUnderlayRoll * FreightZones."Rate per roll (underlay)")
                            + (ShippedQuantityUnderlaySheet * FreightZones."Rate per case (sheet underlay)");
        end;

        // add freight line
        if OrderFreightCount = 0 then begin
            // Rec.Status := Rec.Status::Open;
            // Rec.Modify(true);
            // Rec.PerformManualReopen(Rec);
            SalesLine.Reset;
            SalesLine.SetRange("Document Type", Rec."Document Type");
            SalesLine.SetRange("Document No.", Rec."No.");
            SalesLine.Find('+');
            SalesLine.Init;
            SalesLine."Line No." := SalesLine."Line No." + 10000;
            SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
            SalesLine.Validate("No.", SalesSetup."Freight G/L Acc. No.");
            SalesLine.Validate(Description, 'Freight charge');
            SalesLine.Validate(Quantity, 1);
            // SalesLine.Validate("Qty. to Ship", 1);
            // SalesLine.Validate("Qty. to Invoice", 1);
            SalesLine.Validate("Unit Price", FreightAmount);
            SalesLine.Insert;
        end;
    end;
}