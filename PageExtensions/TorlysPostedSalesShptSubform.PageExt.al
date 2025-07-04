pageextension 50131 "TorlysPostedSalesShptSubform" extends "Posted Sales Shpt. Subform"
{
    layout
    {
        moveafter(Description; "Description 2", "Unit of Measure Code", "Location Code", Quantity)

        addafter(Quantity)
        {
            field("Quantity Case"; Rec."Quantity Case")
            {
                Caption = 'Case Quantity';
                ToolTip = 'Case Quantity';
                ApplicationArea = All;
            }

            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Pallet Quantity';
                ToolTip = 'Pallet Quantity';
                ApplicationArea = All;
            }

            field("Item Category Code"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                ApplicationArea = All;
            }

            field("Default Price List"; Rec."Default Price List")
            {
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                ApplicationArea = All;
            }

            field("Unit Price"; Rec."Unit Price")
            {
                Caption = 'Unit Price';
                ToolTip = 'Unit Price';
                ApplicationArea = All;
            }

            field("Line Amount Excl. Tax"; Rec."Line Amount Excl. Tax")
            {
                Caption = 'Line Amount Excl. Tax';
                ToolTip = 'Line Amount Excl. Tax';
                ApplicationArea = All;
            }

            field("Unit Cost"; Rec."Unit Cost")
            {
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
                ApplicationArea = All;
            }

            field("Purchasing Code"; Rec."Purchasing Code")
            {
                Caption = 'Purchasing Code';
                ToolTip = 'Purchasing Code';
                ApplicationArea = All;
            }

            field("Drop Shipment"; Rec."Drop Shipment")
            {
                Caption = 'Drop Shipment';
                ToolTip = 'Drop Shipment';
                ApplicationArea = All;
            }

            field("Purchase Order No."; Rec."Purchase Order No.")
            {
                Caption = 'Purchase Order No.';
                ToolTip = 'Purchase Order No.';
                ApplicationArea = All;
            }

            field("Purchase Order Line No."; Rec."Purch. Order Line No.")
            {
                Caption = 'Purchase Order Line No.';
                ToolTip = 'Purchase Order Line No.';
                ApplicationArea = All;
            }

            field(SystemCreatedBy; Rec.SystemCreatedBy)
            {
                Caption = 'SystemCreatedBy';
                ToolTip = 'SystemCreatedBy';
                ApplicationArea = All;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'SystemCreatedAt';
                ToolTip = 'SystemCreatedAt';
                ApplicationArea = All;
            }

            field(SystemModifiedBy; Rec.SystemModifiedBy)
            {
                Caption = 'SystemModifiedBy';
                ToolTip = 'SystemModifiedBy';
                ApplicationArea = All;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'SystemModifiedAt';
                ToolTip = 'SystemModifiedAt';
                ApplicationArea = All;
            }


        }



    }
}