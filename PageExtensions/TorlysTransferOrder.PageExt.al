pageextension 55740 TorlysTransferOrder extends "Transfer Order"
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

        moveafter("Transfer-from Code"; "Transfer-to Code", "Direct Transfer", "In-Transit Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Posting Date", "Shipment Date", "Receipt Date", "Shipping Agent Code")

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
                Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
            }
            field("Audited By"; Rec."Audited By")
            {
                Caption = 'Audited By';
                ToolTip = 'Audited By';
                ApplicationArea = All;
                Importance = Standard;
                Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
            }
            field("Received By"; Rec."Received By")
            {
                Caption = 'Received By';
                ToolTip = 'Received By';
                ApplicationArea = All;
                Importance = Standard;
                Editable = (Rec.Status = Rec.Status::Open) and EnableTransferFields;
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
    }

    actions
    {
        addlast(Category_Category6)
        {
            actionref(JoinedSO; "View and Fill Joined SO")
            {
            }
            actionref(LinkededSO; "View and Fill Linked SO")
            {
            }
        }

        addlast(Documents)
        {
            action("View and Fill Joined SO")
            {
                ApplicationArea = Location;
                Caption = 'View and Fill Joined SO';
                ToolTip = 'View and Fill Joined SO';
                Image = Order;
                RunObject = Page TorlysJoinedSOtoTO;
                RunPageLink = "Transfer Order No." = field("No."), Type = const(Item);
            }
            action("View and Fill Linked SO")
            {
                ApplicationArea = Location;
                Caption = 'View and Fill Linked SO';
                ToolTip = 'View and Fill Linked SO';
                Image = OrderTracking;
                RunObject = Page TorlysLinkedSOtoTO;
                RunPageLink = "Linked Transfer Order No." = field("No."), Type = const(Item);
            }
        }

        addlast(Category_Category8)
        {
            actionref(Summary_Pick; "Summary Pick")
            {
            }
            // actionref(PreReceiving; "Pre-Receiving Report")
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
                    // transferheader: Record "Transfer Header";
                    TorlysDocPrint: Codeunit TlyDocumentPrint;
                begin
                    // transferheader.SetFilter("No.", Rec."No.");
                    // Report.RunModal(50007, true, false, transferheader);
                    TorlysDocPrint.PrintSummaryPickSlipTransfer(Rec);
                end;
            }
            // action("Pre-Receiving Report")
            // {
            //     Caption = 'Print Pre-Receiving Report';
            //     Image = Print;
            //     ApplicationArea = Basic, Suite;
            //     trigger OnAction()
            //     var
            //         transferline: Record "Transfer Line";
            //     begin
            //         transferline.SetFilter("Document No.", Rec."No.");
            //         Report.RunModal(50019, true, false, transferline);
            //     end;
            // }
        }
    }
    var
        LookupUserId: Codeunit TlyLookupUserID;
}