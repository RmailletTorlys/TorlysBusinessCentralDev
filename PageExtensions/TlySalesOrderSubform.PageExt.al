pageextension 50046 TlySalesOrderSubform extends "Sales Order Subform"
{
    layout
    {
        moveafter("No."; "Item Reference No.")

        moveafter(Description; "Location Code", "Unit of Measure Code", Quantity)

        addafter(Quantity)
        {
            field("Quantity Case"; Rec."Quantity Case")
            {
                Caption = 'Quantity Case';
                ToolTip = 'Quantity Case';
                ApplicationArea = All;
                Editable = EditCasePallet;
                // trigger OnValidate()
                // begin
                //     OnValidateQuantityCase(Rec, Rec);
                //     CurrPage.Update(true);
                // end;
            }
            field("Quantity Pallet"; Rec."Quantity Pallet")
            {
                Caption = 'Quantity Pallet';
                ToolTip = 'Quantity Pallet';
                ApplicationArea = All;
                Editable = EditCasePallet;
                // trigger OnValidate()
                // begin
                //     OnValidateQuantityPallet(Rec, Rec);
                //     CurrPage.Update(true);
                // end;
            }
            field("Outstanding Quantity"; Rec."Outstanding Quantity")
            {
                Caption = 'Outstanding Quantity';
                ToolTip = 'Outstanding Quantity';
                ApplicationArea = All;
            }
        }

        moveafter("Outstanding Quantity"; "Qty. to Ship")

        addafter("Qty. to Ship")
        {
            field("Qty. to Ship Case"; Rec."Qty. to Ship Case")
            {
                Caption = 'Qty. to Ship Case';
                ToolTip = 'Qty. to Ship Case';
                ApplicationArea = All;
                Editable = EditQTS and EditCasePallet;
                // trigger OnValidate()
                // begin
                //     OnValidateQtyToShipCase(Rec, xRec);
                //     CurrPage.Update(true);
                // end;
            }
            field("Qty. to Ship Pallet"; Rec."Qty. to Ship Pallet")
            {
                Caption = 'Qty. to Ship Pallet';
                ToolTip = 'Qty. to Ship Pallet';
                ApplicationArea = All;
                Editable = EditQTS and EditCasePallet;
                // trigger OnValidate()
                // begin
                //     OnValidateQtyToShipPallet(Rec, xRec);
                //     CurrPage.Update(true);
                // end;
            }
        }
        moveafter("Qty. to Ship Pallet"; "Shipment Date")

        addafter("Shipment Date")
        {
            field("Item Category Code"; Rec."Item Category Code")
            {
                Caption = 'Item Category Code';
                ToolTip = 'Item Category Code';
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
            field("Sales Price Code"; Rec."Sales Price Code")
            {
                Caption = 'Sales Price Code';
                ToolTip = 'Sales Price Code';
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
            field("Default Price List"; Rec."Default Price List")
            {
                Caption = 'Default Price List';
                ToolTip = 'Default Price List';
                ApplicationArea = All;
                Editable = false;
                Visible = false;
            }
            field("Price List Code"; Rec."Price List")
            {
                Caption = 'Price List';
                ToolTip = 'Price List';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        moveafter("Price List Code"; "Unit Price", "Line Amount")

        addafter("Line Amount")
        {
            field("Unit Cost"; Rec."Unit Cost")
            {
                Caption = 'Unit Cost';
                ToolTip = 'Unit Cost';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        moveafter("Unit Cost"; "Unit Cost (LCY)", "Quantity Shipped")

        addafter("Quantity Shipped")
        {
            field("Qty. Shipped Not Invoiced"; Rec."Qty. Shipped Not Invoiced")
            {
                Caption = 'Qty. Shipped Not Invoiced';
                ToolTip = 'Qty. Shipped Not Invoiced';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        moveafter("Qty. Shipped Not Invoiced"; "Qty. to Invoice", "Quantity Invoiced", "Tax Group Code", "Tax Area Code")

        addafter("Tax Area Code")
        {
            field("Builder Description"; Rec."Builder Description")
            {
                Caption = 'Builder Description';
                ToolTip = 'Builder Description';
                ApplicationArea = All;
                Visible = true;
            }
            field("Master Project Order No."; Rec."Master Project Order No.")
            {
                Caption = 'Master Project Order No.';
                ToolTip = 'Master Project Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Master Project Order Line No."; Rec."Master Project Order Line No.")
            {
                Caption = 'Master Project Order Line No.';
                ToolTip = 'Master Project Order Line No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("MPO Qty. on Sales Order"; Rec."MPO Qty. on Sales Order")
            {
                Caption = 'MPO Qty. on Sales Order';
                ToolTip = 'MPO Qty. on Sales Order';
                ApplicationArea = All;
            }
            field("MPO Quantity Invoiced"; Rec."MPO Quantity Invoiced")
            {
                Caption = 'MPO Quantity Invoiced';
                ToolTip = 'MPO Quantity Invoiced';
                ApplicationArea = All;
            }
        }
        moveafter("MPO Quantity Invoiced"; "Purchasing Code", "Drop Shipment")

        addafter("Drop Shipment")
        {
            field("Purchase Order No."; Rec."Purchase Order No.")
            {
                Caption = 'Purchase Order No.';
                ToolTip = 'Purchase Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Purch. Order Line No."; Rec."Purch. Order Line No.")
            {
                Caption = 'Purch. Order Line No.';
                ToolTip = 'Purch. Order Line No.';
                ApplicationArea = All;
                Visible = true;
            }

            field("Transfer Order No."; Rec."Transfer Order No.")
            {
                Caption = 'Transfer Order No.';
                ToolTip = 'Transfer Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Transfer Order Line No."; Rec."Transfer Order Line No.")
            {
                Caption = 'Transfer Line Order No.';
                ToolTip = 'Transfer Line Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Linked Purchase Order No."; Rec."Linked Purchase Order No.")
            {
                Caption = 'Linked Purchase Order No.';
                ToolTip = 'Linked Purchase Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Linked Purch. Order Line No."; Rec."Linked Purch. Order Line No.")
            {
                Caption = 'Linked Purch. Order Line No.';
                ToolTip = 'Linked Purch. Order Line No.';
                ApplicationArea = All;
                Visible = true;
            }

            field("Linked Transfer Order No."; Rec."Linked Transfer Order No.")
            {
                Caption = 'Linked Transfer Order No.';
                ToolTip = 'Linked Transfer Order No.';
                ApplicationArea = All;
                Visible = true;
            }
            field("Linked Transfer Order Line No."; Rec."Linked Transfer Order Line No.")
            {
                Caption = 'Linked Transfer Line Order No.';
                ToolTip = 'Linked Transfer Line Order No.';
                ApplicationArea = All;
                Visible = true;
            }
        }

        addafter("Linked Transfer Order Line No.")
        {
            field("Created By"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Created At"; Rec."SystemCreatedAt")
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Modified By"; LookupUserId.UserId(Rec."SystemModifiedBy"))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Modified At"; Rec."SystemModifiedAt")
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        modify("Item Reference No.")
        {
            Visible = true;
        }

        modify("Location Code")
        {
            Visible = true;
        }

        modify("Quantity Shipped")
        {
            Visible = true;
        }

        modify("Quantity Invoiced")
        {
            Visible = true;
        }

        modify("Purchasing Code")
        {
            Visible = true;
        }

        modify("Drop Shipment")
        {
            Visible = true;
            Editable = false;
        }

        modify("Line Discount %")
        {
            Visible = false;
        }

        modify("Unit Cost (LCY)")
        {
            Visible = true;
            Editable = false;
        }

        modify("Special Order")
        {
            Visible = false;
        }

        modify("Qty. to Assemble to Order")
        {
            Visible = false;
        }

        modify("Reserved Quantity")
        {
            Visible = false;
        }

        modify("Tax Area Code")
        {
            Visible = true;
        }

        modify("Tax Group Code")
        {
            Visible = true;
        }

        modify("Amount Including VAT")
        {
            Visible = false;
        }

        modify("Qty. to Assign")
        {
            Visible = false;
        }

        modify("Qty. Assigned")
        {
            Visible = false;
        }

        modify("Planned Delivery Date")
        {
            Visible = false;
        }

        modify("Planned Shipment Date")
        {
            Visible = false;
        }
        modify("Item Charge Qty. to Handle")
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

        modify(ShortcutDimCode3)
        {
            Visible = false;
        }

        modify(ShortcutDimCode4)
        {
            Visible = false;
        }

        modify(ShortcutDimCode5)
        {
            Visible = false;
        }

        modify(ShortcutDimCode6)
        {
            Visible = false;
        }

        modify(ShortcutDimCode7)
        {
            Visible = false;
        }

        modify(ShortcutDimCode8)
        {
            Visible = false;
        }

        modify("TotalSalesLine.""Line Amount""")
        {
            Visible = false;
        }

        modify("Invoice Discount Amount")
        {
            Visible = false;
        }

        modify("Invoice Disc. Pct.")
        {
            Visible = false;
        }

        modify("Unit Price")
        {
            trigger OnBeforeValidate()
            begin
                if Rec.Type <> Rec.Type::Item then
                    exit;
                PrepareUserModifiedUnitPrice();

                if ((Rec."Unit Price") <> (xRec."Unit Price")) and (xRec."Unit Price" <> 0) and (UserModifiedUnitPrice) then begin
                    Rec."Price List" := '';
                    UserModifiedUnitPrice := false;
                    CurrPage.Update();
                end;
            end;
        }

        modify("Qty. to Ship")
        {
            Editable = EditQTS;
        }
    }

    actions
    {
        addfirst("&Line")
        {
            action(GetPrice1)
            {
                AccessByPermission = TableData "Sales Price" = R;
                ApplicationArea = Basic, Suite;
                Caption = 'Get Price';
                Ellipsis = true;
                Image = Price;
                // ToolTip = 'Insert the lowest possible price in the Unit Price field according to any special price that you have set up.';
                // Visible = not ExtendedPriceEnabled;
                ObsoleteState = Pending;
                ObsoleteReason = 'Replaced by the new implementation (V16) of price calculation.';
                ObsoleteTag = '17.0';
                Promoted = true;

                trigger OnAction()
                begin
                    ShowPrices();
                end;
            }
            action(ItemAvailability)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Availability';
                Ellipsis = true;
                Image = ItemAvailability;
                ToolTip = 'Item Availability';
                Promoted = true;
                trigger OnAction()
                var
                    Item: Record "Item";
                begin
                    Item.Reset();
                    Item.SetRange("No.", Rec."No.");
                    Page.Run(Page::TlyItemAvailability, Item);
                end;
            }
            action(ItemAccessories)
            {
                Caption = 'Item Accessories';
                ToolTip = 'Item Accessories';
                ApplicationArea = All;
                Image = Order;
                RunObject = Page "NTN Web Related Items";
                RunPageLink = "No." = field("No.");
                RunPageMode = View;
            }
            group(CustomerItemHistory)
            {
                Visible = true;
                Caption = 'Customer/Item History';
                Image = ViewOrder;
                action("Open Sales Orders")
                {
                    Caption = 'Open Sales Orders';
                    ToolTip = 'View open sales orders for this customer and this item';
                    ApplicationArea = All;
                    Image = Order;
                    RunObject = Page "Sales Lines";
                    RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "Document Type" = const(Order), "No." = field("No.");
                }
                action("Posted Sales Invoices")
                {
                    Caption = 'Posted Sales Invoices';
                    ToolTip = 'View posted sales invoices for this customer and this item';
                    ApplicationArea = All;
                    Image = Invoice;
                    RunObject = Page "Posted Sales Invoice Lines";
                    RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "No." = field("No.");
                }
                action("Open Credit Memos")
                {
                    Caption = 'Open Credit Memos';
                    ToolTip = 'View open credit memos for this customer/item';
                    ApplicationArea = All;
                    Image = CreditMemo;
                    RunObject = Page "Sales Lines";
                    RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "Document Type" = const("Credit Memo"), "No." = field("No.");
                }
                action("Open Return Orders")
                {
                    Caption = 'Open Return Orders';
                    ToolTip = 'View open return orders for this customer/item';
                    ApplicationArea = All;
                    Image = ReturnOrder;
                    RunObject = Page "Sales Lines";
                    RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "Document Type" = const("Return Order"), "No." = field("No.");
                }
                action("Posted Credit Memos")
                {
                    Caption = 'Posted Credit Memos';
                    ToolTip = 'View posted credt memos for this customer';
                    ApplicationArea = All;
                    Image = PostedCreditMemo;
                    RunObject = Page "Posted Sales Credit Memo Lines";
                    RunPageLink = "Sell-to Customer No." = field("Sell-to Customer No."), "No." = field("No.");
                }
            }
            group(OrderJoining)
            {
                Visible = true;
                Caption = 'Order Joining';
                Image = Link;
                action("Create Sales Order from this MPO")
                {
                    ToolTip = 'Create Sales Order from MPO';
                    Caption = 'Create Sales Order from MPO';
                    Image = NewOrder;
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        SelectedLines: Record "Sales Line";
                        MPOSalesHeader: Record "Sales Header";
                        ExistingAnswer: Boolean;
                        TorlysCreateMPOFromSalesLine: Codeunit TlySalesLineFromMPO;
                    begin
                        CurrPage.SetSelectionFilter(SelectedLines);
                        if SelectedLines.FindSet() then
                            if SelectedLines.Count > 1 then
                                Error('You can only copy 1 line at a time from a MPO.')
                            else begin
                                MPOSalesHeader.Reset();
                                MPOSalesHeader.Get(1, Rec."Document No.");
                                if MPOSalesHeader."Order Type" <> 'MASTER PROJECT ORDER' then begin
                                    Error('This order (%1) is not a Master Project Order.', Rec."Document No.");
                                end else begin
                                    ExistingAnswer := Dialog.Confirm('Are you looking to add to an existing order?');
                                    if ExistingAnswer then
                                        TorlysCreateMPOFromSalesLine.AddToExisting(SelectedLines)
                                    else
                                        TorlysCreateMPOFromSalesLine.CreateNew(SelectedLines);
                                end;
                            end;
                    end;

                }
                separator("Separator1")
                {
                }
                action("Add To Transfer Order")
                {
                    ToolTip = 'Add To Transfer Order';
                    Caption = 'Add To Transfer Order';
                    Image = TransferToLines;
                    ApplicationArea = All;
                    Visible = (Rec."Transfer Order No." = '') and (Rec."Linked Transfer Order No." = '') and (Rec."Linked Purchase Order No." = '');
                    trigger OnAction()
                    var
                        SelectedLines: Record "Sales Line";
                        TransferOrderNumber: Code[20];
                        TorlysAddSalesLineToTransLine: Codeunit TlyAddSalesLineToTransLine;
                    begin
                        CurrPage.SetSelectionFilter(SelectedLines);
                        if SelectedLines.FindSet() then
                            TorlysAddSalesLineToTransLine.PresentModal(SelectedLines, TransferOrderNumber);

                        if TransferOrderNumber <> '' then
                            repeat
                                TorlysAddSalesLineToTransLine.AddSalesLineToTransLine(SelectedLines, TransferOrderNumber);
                            until SelectedLines.Next() = 0;

                    end;
                }
                separator("Separator2")
                {
                }
                action("Link To Purchase Order")
                {
                    ToolTip = 'Link To Purchase Order';
                    Caption = 'Link To Purchase Order';
                    Image = Purchase;
                    ApplicationArea = All;
                    Visible = (Rec."Transfer Order No." = '') and (Rec."Linked Transfer Order No." = '') and (Rec."Linked Purchase Order No." = '');
                    trigger OnAction()
                    var
                        TorlysLinkSalesLine: Codeunit TlyLinkSalesLine;
                        SelectedLines: Record "Sales Line";
                    begin
                        CurrPage.SetSelectionFilter(SelectedLines);
                        if SelectedLines.FindSet() then
                            TorlysLinkSalesLine.LinkSalesLineToPurchaseLine(SelectedLines);
                    end;
                }
                action("Remove Link To Purchase Order")
                {
                    ToolTip = 'Remove Link To Purchase Order';
                    Caption = 'Remove Link To Purchase Order';
                    Image = RemoveLine;
                    ApplicationArea = All;
                    Visible = (Rec."Linked Purchase Order No." <> '');
                    trigger OnAction()
                    begin
                        if Rec."Linked Purchase Order No." = '' then
                            Error('ERROR!\This line is not linked to a purchase order')
                        else begin
                            Message('SUCCESS!\%1 from %2 with a quantity of %3 is being removed from %4 line %5.', Rec."No.", Rec."Document No.", Rec.Quantity, Rec."Linked Purchase Order No.", Rec."Linked Purch. Order Line No.");
                            Rec."Linked Purchase Order No." := '';
                            Rec."Linked Purch. Order Line No." := 0;
                            Rec.Modify(true);
                        end;
                    end;
                }
                separator("Separator3")
                {
                }

                action("Link To Transfer Order")
                {
                    ToolTip = 'Link To Transfer Order';
                    Caption = 'Link To Transfer Order';
                    Image = TransferOrder;
                    ApplicationArea = All;
                    Visible = (Rec."Transfer Order No." = '') and (Rec."Linked Transfer Order No." = '') and (Rec."Linked Purchase Order No." = '');
                    ;
                    trigger OnAction()
                    var
                        TorlysLinkSalesLine: Codeunit TlyLinkSalesLine;
                        SelectedLines: Record "Sales Line";
                    begin
                        CurrPage.SetSelectionFilter(SelectedLines);
                        if SelectedLines.FindSet() then
                            TorlysLinkSalesLine.LinkSalesLineToTransferLine(SelectedLines);
                    end;
                }
                action("Remove Link To Transfer Order")
                {
                    ToolTip = 'Remove Link To Transfer Order';
                    Caption = 'Remove Link To Transfer Order';
                    Image = RemoveLine;
                    ApplicationArea = All;
                    Visible = (Rec."Linked Transfer Order No." <> '');
                    trigger OnAction()
                    begin
                        if Rec."Linked Transfer Order No." = '' then
                            Error('ERROR!\This line is not linked to a transfer order')
                        else begin
                            Message('SUCCESS!\%1 from %2 with a quantity of %3 is being removed from %4 line %5.', Rec."No.", Rec."Document No.", Rec.Quantity, Rec."Linked Transfer Order No.", Rec."Linked Transfer Order Line No.");
                            Rec."Linked Transfer Order No." := '';
                            Rec."Linked Transfer Order Line No." := 0;
                            Rec.Modify(true);
                        end;
                    end;
                }
            }
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
        UserModifiedUnitPrice: Boolean;
        EditCasePallet: Boolean;
        UserSetup: Record "User Setup";
        EditQTS: Boolean;

    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);
        if UserSetup."SO Qty. to Ship Edit" then EditQTS := true;
    end;

    trigger OnAfterGetRecord()
    begin
        // OnAfterGetRecordCheckEditCasePallet(Rec, xRec, EditCasePallet);
        EditCasePallet := CheckEditCasePallet(Rec);
    end;

    procedure PrepareUserModifiedUnitPrice()
    begin
        if Rec.Type <> Rec.Type::Item then
            exit;

        UserModifiedUnitPrice := true;
    end;

    // [IntegrationEvent(false, false)]
    // local procedure OnAfterGetRecordCheckEditCasePallet(Rec: Record "Sales Line"; xRec: Record "Sales Line"; var EditCasePallet: Boolean)
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidateQuantityCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidateQuantityPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidateQtyToShipCase(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    // begin
    // end;

    // [IntegrationEvent(false, false)]
    // local procedure OnValidateQtyToShipPallet(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
    // begin
    // end;

    procedure CheckEditCasePallet(var SalesLine: Record "Sales Line"): Boolean
    var
        Item: Record Item;
    begin
        if SalesLine.Type <> Rec.Type::Item then exit(false);
        if SalesLine."No." = '' then exit(false);
        Item.Get(SalesLine."No.");
        if Item."Compare Unit of Measure" = '' then exit(false);
        exit(true);
    end;
}