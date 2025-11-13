page 50999 "Torlys Sales Order Shipment"
{
    Caption = 'Sales Order Shipment';
    PageType = Card;
    SourceTable = "Sales Header";
    ApplicationArea = All;
    UsageCategory = Administration;

    Layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the unique number that identifies the sales order. The number is assigned when the sales order is created.';
                    Caption = 'Order No.';
                }

                field("Whse Associate Picked By"; Rec."Warehouse Associate Picked By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the warehouse associate who picked the items for the sales order.';
                    Caption = 'Picked By';

                    trigger OnValidate()
                    begin
                        Rec."Whse Assoc. Picked By Name" := GetWhseRepName(Rec."Warehouse Associate Picked By");
                    end;
                }

                field("Whse Associate Picked By Name"; Rec."Whse Assoc. Picked By Name")
                {
                    ApplicationArea = All;

                    ToolTip = 'Specifies the name of the warehouse associate who picked the items for the sales order.';
                    Caption = 'Picked By Name';
                }

                field("Whse Associate Shipped By"; Rec."Warehouse Associate Checked By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the warehouse associate who shipped the items for the sales order.';
                    Caption = 'Checked By';

                    trigger OnValidate()
                    begin
                        Rec."Whse Assoc. Checked By Name" := GetWhseRepName(Rec."Warehouse Associate Checked By");
                    end;
                }

                field("Whse Associate Shipped By Name"; Rec."Whse Assoc. Checked By Name")
                {
                    ApplicationArea = All;

                    ToolTip = 'Specifies the name of the warehouse associate who shipped the items for the sales order.';
                    Caption = 'Checked By Name';
                }


                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the type of sales document, such as a quote, order, or invoice.';
                    Caption = 'Document Type';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the customer number of the customer to whom the sales document is being sold.';
                    Caption = 'Customer No.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the customer to whom the sales document is being sold.';
                    Caption = 'Customer Name';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the items are shipped.';
                    Caption = 'Shipment Date';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the code of the location from which the items are shipped.';
                    Caption = 'Location Code';
                }

                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Status';
                    Caption = 'Status';
                }
                field("No. Pick Slips Printed"; Rec."No. Pick Slips Printed")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the number of pick lists that have been printed for the sales order.';
                    Caption = 'Pick Slips Printed';
                }
                field("Pick Slip Printed By"; Rec."Pick Slip Printed By")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the person who printed the pick slip for the sales order.';
                    Caption = 'Pick Slip Printed By';
                }
                field("Pick Slip Printed Date"; Rec."Pick Slip Printed Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the date when the pick slip was printed for the sales order.';
                    Caption = 'Pick Slip Printed Date';
                }
                field("Pick Slip Printed Time"; Rec."Pick Slip Printed Time")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the time when the pick slip was printed for the sales order.';
                    Caption = 'Pick Slip Printed Time';
                }
            }
            group(Lines)
            {
                Caption = 'Lines';
                part("Sales Lines"; "Sales Order Subform")
                {
                    ApplicationArea = All;
                    SubPageLink = "Document No." = field("No.");
                    SubPageView = where("Outstanding Quantity" = filter(<> 0));
                    Caption = 'Sales Lines';
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Promoted)
        {
            // actionref("Assign Picker"; AssignPicker)
            // {
            // }

            // actionref("Assign Auditor"; AssignAuditor)
            // {
            // }

            actionref("Print Pick Slip"; PrintPickSlip)
            {
            }
            actionref("Print Summary Pick Slip"; PrintSummaryPickSlip)
            {
            }
            actionref("Print Label"; PrintLabel)
            {
            }
            actionref("Post and Print"; PostAndPrint)
            {
            }
        }
        area(Navigation)
        {
            group(Process)
            {
                Caption = 'Process';

                // action(AssignPicker)
                // {
                //     ApplicationArea = All;
                //     Caption = 'Assign Picker';
                //     Image = PickLines;
                //     ToolTip = 'Assign the pick ticket to a warehouse associate for picking the items for the sales order.';



                //     trigger OnAction()
                //     var
                //         SalespersonPurchaser: Record "Salesperson/Purchaser";
                //         SalespersonPurchaserPage: Page "Salespersons/Purchasers";

                //     begin
                //         SalespersonPurchaserPage.SetRecord(SalespersonPurchaser);
                //         SalespersonPurchaserPage.LookupMode(true);

                //         if Rec."Warehouse Associate Picked By" <> '' then begin
                //             Message('This order has already been assigned to %1 for picking.', Rec."Warehouse Associate Picked By");
                //             exit;
                //         end;
                //         Message('Order No %1', Rec."No.");

                //         if SalespersonPurchaserPage.RunModal() = ACTION::OK then begin
                //             SalespersonPurchaserPage.GetRecord(SalespersonPurchaser);
                //             Rec.Validate("Warehouse Associate Picked By", SalespersonPurchaser.Code);
                //             Rec.Modify(true);
                //             CurrPage.Update();
                //             Message('Order No %1 assigned to %2 for picking.', Rec."No.", SalespersonPurchaser.Name);
                //         end;

                //         CurrPage.Update();
                //     end;
                // }

                // action(AssignAuditor)
                // {
                //     ApplicationArea = All;
                //     Caption = 'Check Shipment';
                //     Image = CheckList;
                //     ToolTip = 'Check the shipment for the sales order.';


                //     trigger OnAction()
                //     var
                //         User: Record User;
                //     begin
                //         if Rec."Warehouse Associate Checked By" <> '' then begin
                //             Message('This order has already been audited by %1.', Rec."Warehouse Associate Checked By");
                //             exit;
                //         end;
                //         if PAGE.RunModal(PAGE::Users, User) = ACTION::OK then begin
                //             Rec."Warehouse Associate Checked By" := COPYSTR(User."User Name", 1, 20);
                //             Rec.Modify(true);
                //         end;

                //         CurrPage.Update();

                //     end;
                // }

                action(PrintPickSlip)
                {
                    ApplicationArea = All;
                    Caption = 'Print Pick Slip';
                    Image = Print;
                    ToolTip = 'Print Pick Slip';
                    trigger OnAction()
                    begin
                        // TorlysDocPrint.PrintPickSlip(Rec);
                        DocPrint.PrintSalesOrder(Rec, Usage::"Pick Instruction");
                    end;
                }
                action(PrintSummaryPickSlip)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Print Summary Pick Slip';
                    Image = Print;
                    ToolTip = 'Print a summary picking list that shows which items to pick and ship for the sales order.';
                    trigger OnAction()
                    begin
                        TorlysDocPrint.PrintSummaryPickSlip(Rec);
                    end;
                }
                action(PrintLabel)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Print Label';
                    Image = Print;
                    ToolTip = 'Print label for the sales order.';
                    trigger OnAction()
                    begin
                        TorlysDocPrint.PrintSalesOrderLabel(Rec);
                    end;
                }

                action(PostAndPrint)
                {
                    ApplicationArea = Warehouse;
                    Caption = 'Post and Print';
                    Image = Post;
                    ToolTip = 'Post the selected sales order(s) as shipped.';


                    trigger OnAction()
                    var
                    // SelectedSalesHeader: Record "Sales Header";
                    // SalesShpHeader: Record "Sales Shipment Header";
                    // PrintDoc: Codeunit "Torlys Print Document";
                    // Usage: Option "Sales Order Label";
                    // SalesHeader: Record "Sales Header";
                    // Text1020001: Label 'Do you want to ship and print the %1?';
                    begin

                        IF Rec."No. Pick Slips Printed" = 0 THEN
                            ERROR('You cannot ship this order as no pick slips have been printed!');

                        IF Rec."Warehouse Associate Picked By" = '' THEN
                            ERROR('The Warehouse Associate Picked By field cannot be blank!');

                        IF Rec."Warehouse Associate Checked By" = '' THEN
                            ERROR('The Warehouse Associate Checked By field cannot be blank!');

                        IF Rec."Warehouse Associate Picked By" = Rec."Warehouse Associate Checked By" THEN
                            ERROR('The Picked By and the Checked By Associate cannot be the same!');

                        // since we can't inject to add freight, we will just call our own codeunit
                        // out of the box codeunit below
                        // CODEUNIT.RUN(CODEUNIT::"Ship-Post + Print", Rec);
                        // our codeunit below
                        CODEUNIT.RUN(CODEUNIT::"TorlysShip-Post+Print", Rec);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec."Warehouse Associate Picked By" <> '' then
            Rec."Whse Assoc. Picked By Name" := GetWhseRepName(Rec."Warehouse Associate Picked By");

        if Rec."Warehouse Associate Checked By" <> '' then
            Rec."Whse Assoc. Checked By Name" := GetWhseRepName(Rec."Warehouse Associate Checked By");

        CurrPage.Update();
    end;

    local procedure GetWhseRepName(WarehouseAssociatePickedBy: Code[50]): Code[50]
    var
        SalespersonPurchaser: Record "Salesperson/Purchaser";
    begin
        if WarehouseAssociatePickedBy = '' then
            exit('');

        if SalespersonPurchaser.Get(WarehouseAssociatePickedBy) then
            exit(SalespersonPurchaser.Name)
        else
            exit('Unknown');

    end;

    local procedure PostOrder(PostingCodeunitID: Integer; SelectedSalesheader: Record "Sales Header"): Boolean
    var
        SalesHeader: Record "Sales Header";
        LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
        DocumentIsScheduledForPosting: Boolean;
        DocumentIsPosted: Boolean;


    begin
        LinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(SelectedSalesHeader);
        SelectedSalesHeader.SendToPosting(PostingCodeunitID);

        DocumentIsScheduledForPosting := SelectedSalesHeader."Job Queue Status" = SelectedSalesHeader."Job Queue Status"::"Scheduled for Posting";
        DocumentIsPosted := (not SalesHeader.Get(SelectedSalesHeader."Document Type", SelectedSalesHeader."No.")) or DocumentIsScheduledForPosting;

        CurrPage.Update(False);

        exit(DocumentIsPosted);


    end;

    var
        TorlysDocPrint: Codeunit "TorlysDocumentPrint";
        DocPrint: Codeunit "Document-Print";
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";
}