pageextension 50527 TlyPostedSalesCrMemoLines extends "Posted Sales Credit Memo Lines"
{
    layout
    {
        addafter("Document No.")
        {
            field("Posting Date"; Rec."Posting Date")
            {
                Caption = 'Posting Date';
                ToolTip = 'Posting Date';
                ApplicationArea = All;
            }
        }

        addafter("Sell-to Customer Name")
        {
            field("External Document No."; Rec."External Document No.")
            {
                Caption = 'External Document No.';
                ToolTip = 'External Document No.';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Reason Code"; Rec."Reason Code")
            {
                Caption = 'Reason Code';
                ToolTip = 'Reason Code';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Original Invoice No."; OriginalInvoiceNo)
            {
                Caption = 'Original Invoice No.';
                ToolTip = 'Original Invoice No.';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Rebill Invoice No."; RebillInvoiceNo)
            {
                Caption = 'Rebill Invoice No.';
                ToolTip = 'Rebill Invoice No.';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        addafter("No.")
        {
            field("Item Reference No."; Rec."Item Reference No.")
            {
                Caption = 'Item Reference No.';
                ToolTip = 'Item Reference No.';
                ApplicationArea = All;
            }
        }

        moveafter("Item Reference No."; Description)

        addafter(Description)
        {
            field("Location Code"; Rec."Location Code")
            {
                Caption = 'Location Code';
                ToolTip = 'Location Code';
                ApplicationArea = All;
            }
        }

        moveafter("Location Code"; "Unit of Measure Code", Quantity)

        addafter(Quantity)
        {
            field("Quantity Case"; Rec."Quantity Case")
            {
                Caption = 'Quantity Case';
                ToolTip = 'Quantity Case';
                ApplicationArea = All;
            }
            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Quantity Pallet';
                ToolTip = 'Quantity Pallet';
                ApplicationArea = All;
            }
            field("Shipment Date"; Rec."Shipment Date")
            {
                Caption = 'Shipment Date';
                ToolTip = 'Shipment Date';
                ApplicationArea = All;
            }

            field("Item Category Code"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                ApplicationArea = All;
                Visible = true;
            }

            field("Sales Price Code"; Rec."Sales Price Code")
            {
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Default Price List"; Rec."Default Price List")
            {
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }

            field("Price List"; Rec."Price List")
            {
                Caption = 'Price List';
                ToolTip = 'Price List';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        moveafter("Price List"; "Unit Price")

        addafter("Unit Price")
        {
            field("Line Amount"; Rec."Line Amount")
            {
                Caption = 'Line Amount';
                ToolTip = 'Line Amount';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Unit Cost"; Rec."Unit Cost")
            {
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        moveafter("Unit Cost"; "Unit Cost (LCY)")

        addafter("Unit Cost (LCY)")
        {
            field("Tax Group Code"; Rec."Tax Group Code")
            {
                Caption = 'Tax Group Code';
                ToolTip = 'Tax Group Code';
                ApplicationArea = All;
                Visible = true;
            }
            field("Tax Area Code"; Rec."Tax Area Code")
            {
                Caption = 'Tax Area Code';
                ToolTip = 'Tax Area Code';
                ApplicationArea = All;
                Visible = true;
            }
            field("Created By"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Created Date"; Rec."SystemCreatedAt")
            {
                Caption = 'Created Date';
                ToolTip = 'Created Date';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        modify("Unit Cost (LCY)")
        {
            Visible = true;
        }

        modify("Line Discount %")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }

        modify("Amount Including VAT")
        {
            Visible = false;
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
        OriginalInvoiceNo: Code[20];
        RebillInvoiceNo: Code[20];

    trigger OnAfterGetRecord()
    var
        SalesCrHeader: Record "Sales Cr.Memo Header";
    begin
        SalesCrHeader.Reset();
        if Rec."Document No." <> '' then begin
            SalesCrHeader.Get(Rec."Document No.");
            OriginalInvoiceNo := SalesCrHeader."Original Invoice No.";
            RebillInvoiceNo := SalesCrHeader."Rebill Invoice No.";
        end else begin
            OriginalInvoiceNo := '';
            RebillInvoiceNo := '';
        end;
    end;
}