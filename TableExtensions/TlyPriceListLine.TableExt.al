tableextension 57001 TlyPriceListLine extends "Price List Line"
{
    fields
    {
        field(50001; "Cost Based On"; Option)
        {
            Caption = 'Cost Based On';
            ToolTip = 'Cost Based On';
            DataClassification = CustomerContent;
            OptionMembers = " ","Ship Date","PO Date";
        }

        field(50002; "Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            ToolTip = 'Shipment Method Code';
            DataClassification = CustomerContent;
            TableRelation = "Shipment Method";
        }
        field(50003; "Stocking Pallet Price"; Decimal)
        {
            Caption = 'Full Pallet Price';
            ToolTip = 'Full Pallet Price';
            DataClassification = CustomerContent;
        }
        field(50004; "Unit Price Tier"; Code[20])
        {
            Caption = 'Unit Price Tier';
            ToolTip = 'Unit Price Tier';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Price List Line"."Price List Code" where("Product No." = field("Product No."), "Unit Price" = field("Unit Price"), "Price List Code" = filter('TIER*&<>*QC&<>*US'), "Ending Date" = filter('')));
            ObsoleteState = Removed;
            ObsoleteReason = 'TLY-SD - 07/15/2026 - did not really work, just do a procedure on the page';
        }
        field(50005; "Full Pallet Price Tier"; Code[20])
        {
            Caption = 'Full Pallet Price Tier';
            ToolTip = 'Full Pallet Price Tier';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Price List Line"."Price List Code" where("Product No." = field("Product No."), "Unit Price" = field("Stocking Pallet Price"), "Price List Code" = filter('TIER*&<>*QC&<>*US'), "Ending Date" = filter('')));
            ObsoleteState = Removed;
            ObsoleteReason = 'TLY-SD - 07/15/2026 - did not really work, just do a procedure on the page';
        }

        modify("Product No.")
        {
            //TLY-SD - 06/29/2026 - start
            //out of the box - start
            TableRelation = if ("Asset Type" = const(Item)) Item //where("No." = field("Product No.")) //remove this because dont know why needed
            else
            if ("Asset Type" = const("G/L Account")) "G/L Account"
            else
            if ("Asset Type" = const(Resource)) Resource
            else
            if ("Asset Type" = const("Resource Group")) "Resource Group"
            else
            if ("Asset Type" = const("Item Discount Group")) "Item Discount Group"
            //out of the box - end
            else //for our added Asset Type
            if ("Asset Type" = const("Sales Price Code")) TlySalesPriceCode; //for our added Asset Type
            //TLY-SD - 06/29/2026 - end
        }
    }
}