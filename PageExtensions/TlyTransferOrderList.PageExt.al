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
            field("Booking No."; Rec."Booking No.")
            {
                Caption = 'Booking No.';
                ToolTip = 'Booking No.';
                ApplicationArea = All;
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

    var
        LookupUserId: Codeunit TlyLookupUserID;
}
