pageextension 55742 TlyTransferOrderList extends "Transfer Orders"
{
    layout
    {
        moveafter("No."; Status)

        addafter("Status")
        {
            field("Transfer Type"; Rec."Transfer Type")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Transfer Type';
                Caption = 'Transfer Type';
            }
        }
        moveafter("Transfer Type"; "Transfer-from Code", "Transfer-to Code", "Direct Transfer", "In-Transit Code")

        addafter("In-Transit Code")
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Posting Date';
                Caption = 'Posting Date';
            }
        }

        moveafter("Posting Date"; "Shipment Date", "Receipt Date", "Shipping Agent Code")

        addafter("Shipping Agent Code")
        {
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
                ApplicationArea = All;
                Editable = false;
            }
            field("BOL No."; Rec."BOL No.")
            {
                Caption = 'BOL No.';
                ToolTip = 'BOL No.';
                ApplicationArea = All;
                Editable = false;
            }
            field("Package Tracking No."; Rec."Package Tracking No.")
            {
                Caption = 'Package Tracking No.';
                ToolTip = 'Package Tracking No.';
                ApplicationArea = All;
                Editable = false;
            }
            // field("Booking No."; Rec."Booking No.")
            // {
            //     Caption = 'Booking No.';
            //     ToolTip = 'Booking No.';
            //     ApplicationArea = All;
            // }
            field("Container No."; Rec."TPS CMG Container No.")
            {
                Caption = 'Container No.';
                ToolTip = 'Container No.';
                ApplicationArea = All;
                Editable = false;
            }
            field("Completely Shipped"; Rec."Completely Shipped")
            {
                Caption = 'Completely Shipped';
                ToolTip = 'Completely Shipped';
                ApplicationArea = All;
                Editable = false;
            }

            field("Last Shipment No."; Rec."Last Shipment No.")
            {
                Caption = 'Last Shipment No.';
                ToolTip = 'Last Shipment No.';
                ApplicationArea = All;
                Editable = false;
            }
            field("Completely Received"; Rec."Completely Received")
            {
                Caption = 'Completely Received';
                ToolTip = 'Completely Received';
                ApplicationArea = All;
                Editable = false;
            }
            field("Last Receipt No."; Rec."Last Receipt No.")
            {
                Caption = 'Last Receipt No.';
                ToolTip = 'Last Receipt No.';
                ApplicationArea = All;
                Editable = false;
            }

            field("Total Weight"; TotalWeight)
            {
                Caption = 'Total Weight';
                ToolTip = 'Total Weight';
                ApplicationArea = All;
                Editable = false;
            }
            field("To Ship Weight"; ToShipWeight)
            {
                Caption = 'To Ship Weight';
                ToolTip = 'To Ship Weight';
                ApplicationArea = All;
                Editable = false;
            }
            field("To Receive Weight"; ToReceiveWeight)
            {
                Caption = 'To Receive Weight';
                ToolTip = 'To Receive Weight';
                ApplicationArea = All;
                Editable = false;
            }

            field("Vendor No."; VendorNo)
            {
                Caption = 'Vendor No.';
                ToolTip = 'Vendor No.';
                ApplicationArea = All;
                Editable = false;
                Description = 'TLY-SD - 11/26/2026';
            }

            field("Outstanding Quantity"; Rec."Outstanding Quantity")
            {
                Caption = 'Outstanding Quantity';
                ToolTip = 'Outstanding Quantity';
                ApplicationArea = All;
                Editable = false;
                Description = 'TLY-SD - 11/25/2026';
            }

            field("Qty. to Ship"; Rec."Qty. to Ship")
            {
                Caption = 'Qty. to Ship';
                ToolTip = 'Qty. to Ship';
                ApplicationArea = All;
                Editable = false;
                Description = 'TLY-SD - 11/25/2026';
            }

            field("Qty. in Transit"; Rec."Qty. in Transit")
            {
                Caption = 'Qty. in Transit';
                ToolTip = 'Qty. in Transit';
                ApplicationArea = All;
                Editable = false;
                Description = 'TLY-SD - 11/25/2026';
            }

            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Editable = false;
            }

            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created Date';
                ToolTip = 'Created Date';
                ApplicationArea = All;
                Editable = false;
            }

            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Editable = false;
            }

            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified Date';
                ToolTip = 'Modified Date';
                ApplicationArea = All;
                Editable = false;
            }
        }

        modify("Shipment Date")
        {
            visible = true;
        }

        modify("Receipt Date")
        {
            visible = true;
        }

        modify("Shipping Agent Code")
        {
            visible = true;
        }
    }

    actions
    {
        addlast(Category_Category8)
        {
            actionref(Summary_Pick; "Summary Pick")
            {
            }
            actionref(TransferLabel; "Transfer Label")
            {
            }
            // actionref(ReceivingReport; "Receiving Report")
            // {
            // }
        }

        addlast(processing)
        {
            action("Summary Pick")
            {
                Caption = 'Print Summary Pick';
                Image = Print;
                ApplicationArea = Basic, Suite;
                trigger OnAction()
                var
                    TorlysDocPrint: Codeunit TlyDocumentPrint;
                begin
                    TorlysDocPrint.PrintSummaryPickSlipTransfer(Rec);
                end;
            }
            action("Transfer Label")
            {
                Caption = 'Print Transfer Label';
                Image = Print;
                ApplicationArea = Basic, Suite;
                trigger OnAction()
                var
                    TorlysDocPrint: Codeunit TlyDocumentPrint;
                begin
                    TorlysDocPrint.PrintTransferLabel(Rec);
                end;
            }
            // action("Receiving Report")
            // {
            //     Caption = 'Print Receiving Report';
            //     Image = Print;
            //     ApplicationArea = Basic, Suite;
            //     trigger OnAction()
            //     var
            //         TorlysDocPrint: Codeunit TlyDocumentPrint;
            //     begin
            //         TorlysDocPrint.PrintReceivingTransfer(Rec);
            //     end;
            // }
        }
    }

    views
    {
        addlast
        {
            view(OrderFullfillment)
            {
                Caption = 'Order Fullfillment';
                Filters = where("Transfer Type" = filter('Order Fullfillment'));
                OrderBy = ascending("Receipt Date");
            }

            view(DemandPlanning)
            {
                Caption = 'Demand Planning';
                Filters = where("Transfer Type" = filter('Demand Planning'));
                OrderBy = ascending("Receipt Date");
            }

            view(Marketing)
            {
                Caption = 'Marketing';
                Filters = where("Transfer Type" = filter('Marketing'));
                OrderBy = ascending("Receipt Date");
            }

            view(SupplierPurchase)
            {
                Caption = 'Supplier Purchase';
                Filters = where("Transfer Type" = filter('Supplier Purchase'));
                OrderBy = ascending("Receipt Date");
            }

            view(PID)
            {
                Caption = 'PID';
                Filters = where("Transfer Type" = filter('PID'));
                OrderBy = ascending("Receipt Date");
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        TransferLine: Record "Transfer Line";
    begin
        TotalWeight := 0;
        ToShipWeight := 0;
        ToReceiveWeight := 0;
        // VendorNo := ''; //TLY-SD - 11/25/2026

        TransferLine.Reset();
        TransferLine.SetRange("Document No.", Rec."No.");
        TransferLine.SetFilter("Derived From Line No.", '0');
        if TransferLine.Find('-') then begin
            repeat
                TotalWeight := TotalWeight + (TransferLine."Net Weight" * TransferLine.Quantity);
                ToShipWeight := ToShipWeight + (TransferLine."Net Weight" * TransferLine."Qty. to Ship");
                ToReceiveWeight := ToReceiveWeight + (TransferLine."Net Weight" * TransferLine."Qty. to Receive");
            until TransferLine.Next() = 0;
            if Rec."Transfer Type" = Rec."Transfer Type"::"Supplier Purchase" then begin //TLY-SD - 11/25/2026
                TransferLine.CalcFields("Vendor No."); //TLY-SD - 11/25/2026
                VendorNo := TransferLine."Vendor No."; //TLY-SD - 11/25/2026
            end; //TLY-SD - 11/25/2026
        end;
    end;

    var
        LookupUserId: Codeunit TlyLookupUserID;
        TotalWeight: Decimal;
        ToShipWeight: Decimal;
        ToReceiveWeight: Decimal;
        VendorNo: Code[20]; //TLY-SD - 11/25/2026
}
