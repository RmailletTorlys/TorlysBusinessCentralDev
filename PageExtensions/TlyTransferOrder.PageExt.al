pageextension 55740 TlyTransferOrder extends "Transfer Order"
{
    layout
    {
        addbefore("Transfer-from Code")
        {
            field("Transfer Type"; Rec."Transfer Type")
            {
                Caption = 'Transfer Type';
                ToolTip = 'Transfer Type';
                ApplicationArea = All;
                ShowMandatory = true;
                Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
            }
        }

        moveafter("Transfer-from Code"; "Transfer-to Code", "In-Transit Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Posting Date", "Shipment Date", "Receipt Date", "Shipping Agent Code")

        addafter("Shipping Agent Code")
        {
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
                ApplicationArea = All;
                Importance = Standard;
                Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
            }
            field("Picked By"; Rec."Picked By")
            {
                Caption = 'Picked By';
                ToolTip = 'Picked By';
                ApplicationArea = All;
                Importance = Standard;
                ShowMandatory = true;
                Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
            }
            field("Audited By"; Rec."Audited By")
            {
                Caption = 'Audited By';
                ToolTip = 'Audited By';
                ApplicationArea = All;
                Importance = Standard;
                ShowMandatory = true;
                Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
            }
            field("Received By"; Rec."Received By")
            {
                Caption = 'Received By';
                ToolTip = 'Received By';
                ApplicationArea = All;
                Importance = Standard;
                // Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
            }
            // field("Put Away By"; Rec."Put Away By")
            // {
            //     Caption = 'Put Away By';
            //     ToolTip = 'Put Away By';
            //     ApplicationArea = All;
            //     Importance = Standard;
            //     Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
            // }
            field("BOL No."; Rec."BOL No.")
            {
                Caption = 'BOL No.';
                ToolTip = 'BOL No.';
                ApplicationArea = All;
                Editable = false;
                Importance = Standard;
            }
            field("Package Tracking No."; Rec."Package Tracking No.")
            {
                Caption = 'Package Tracking No.';
                ToolTip = 'Package Tracking No.';
                ApplicationArea = All;
                Editable = false;
                Importance = Standard;
            }
            field("Booking No."; Rec."Booking No.")
            {
                Caption = 'Booking No.';
                ToolTip = 'Booking No.';
                ApplicationArea = All;
                Importance = Standard;
            }
        }

        moveafter("Booking No."; Status)

        addafter(Status)
        {
            field("Fully Shipped"; Rec."Completely Shipped")
            {
                Caption = 'Completely Shipped';
                ToolTip = 'Completely Shipped';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field("Fully Received"; Rec."Completely Received")
            {
                Caption = 'Completely Shipped';
                ToolTip = 'Completely Shipped';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                Caption = 'Created Date';
                ToolTip = 'Created Date';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
            field(SystemModifiedAt; Rec.SystemModifiedAt)
            {
                Caption = 'Modified Date';
                ToolTip = 'Modified Date';
                ApplicationArea = All;
                Editable = false;
                Importance = Additional;
            }
        }

        modify("Assigned User ID")
        {
            Visible = false;
        }

        modify("Shortcut Dimension 1 Code")
        {
            ShowMandatory = true;
            Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
        }

        modify("Shortcut Dimension 2 Code")
        {
            ShowMandatory = true;
            Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
        }

        modify("Shipment Date")
        {
            ShowMandatory = true;
            Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
        }

        modify("Receipt Date")
        {
            ShowMandatory = true;
            Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
        }
        modify("Direct Transfer")
        {
            Visible = false;
        }
        modify("Shipping Agent Code")
        {
            ShowMandatory = true;
        }
    }

    actions
    {
        addlast(Category_Category6)
        {
            actionref(PopulateQtyToReceive; "Populate Qty. to Receive")
            {
            }
            actionref(JoinedSO; "View and Fill Joined SO")
            {
            }
            actionref(LinkededSO; "View and Fill Linked SO")
            {
            }
        }

        addlast(Documents)
        {
            action("Populate Qty. to Receive")
            {
                ApplicationArea = Location;
                Caption = 'Populate Qty. to Receive';
                ToolTip = 'Populate Qty. to Receive';
                Image = ReceiveLoaner;
                trigger OnAction()
                var
                    TransferLine: Record "Transfer Line";
                    TRQuantity: Decimal;
                    TRQtyShipped: Decimal;
                    TRQtyInTransit: Decimal;
                    TRQtyToReceive: Decimal;
                begin
                    TransferLine.Reset();
                    TransferLine.SetRange("Document No.", Rec."No.");
                    TransferLine.SetFilter("Qty. in Transit", '<>0');
                    if TransferLine.Find('-') then begin
                        repeat
                            TRQuantity += TransferLine.Quantity;
                            TRQtyShipped += TransferLine."Quantity Shipped";
                            TransferLine.Validate(TransferLine."Qty. to Receive", TransferLine."Qty. in Transit");
                            TransferLine.Modify(true);
                            TRQtyInTransit += TransferLine."Qty. in Transit";
                            TRQtyToReceive += TransferLine."Qty. to Receive";
                        until TransferLine.Next() = 0;
                        Message('%1\Please review all numbers below match.\Quantity: %2\Qty. Shipped: %3\Qty. in Transit: %4\Qty. to Receive: %5', Rec."No.", TRQuantity, TRQtyShipped, TRQtyInTransit, TRQtyToReceive);
                    end else begin
                        Message('No lines have been shipped yet.');
                    end;
                end;
            }
            action("View and Fill Joined SO")
            {
                ApplicationArea = Location;
                Caption = 'View and Fill Joined SO';
                ToolTip = 'View and Fill Joined SO';
                Image = Order;
                Visible = (Rec."Transfer Type" = Rec."Transfer Type"::"Order Fullfillment");
                RunObject = Page TlyJoinedSOtoTO;
                RunPageLink = "Transfer Order No." = field("No."), Type = const(Item), "Outstanding Quantity" = filter(> 0);
            }
            action("View and Fill Linked SO")
            {
                ApplicationArea = Location;
                Caption = 'View and Fill Linked SO';
                ToolTip = 'View and Fill Linked SO';
                Image = OrderTracking;
                Visible = (Rec."Transfer Type" = Rec."Transfer Type"::"Demand Planning");
                RunObject = Page TlyLinkedSOtoTO;
                RunPageLink = "Linked Transfer Order No." = field("No."), Type = const(Item);
            }
        }

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
    var
        LookupUserId: Codeunit TlyLookupUserID;
}