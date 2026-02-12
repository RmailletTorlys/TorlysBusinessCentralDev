page 50999 TlySalesOrderShipment
{
    Caption = 'Sales Order Shipment';
    PageType = Card;
    SourceTable = "Sales Header";
    ApplicationArea = Basic, Suite;
    UsageCategory = Documents;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    RefreshOnActivate = true;

    layout
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
                field("Picked By"; Rec."Picked By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the warehouse associate who picked the items for the sales order.';
                    Caption = 'Picked By';
                }
                field("Audited By"; Rec."Audited By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the warehouse associate who audited the items for the sales order.';
                    Caption = 'Audited By';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the customer number of the customer to whom the sales document is being sold.';
                    Caption = 'Customer No.';
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Ship-to Code';
                    Caption = 'Ship-to Code';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the customer to whom the sales document is being sold.';
                    Caption = 'Customer Name';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the code of the location from which the items are shipped.';
                    Caption = 'Location Code';
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Shipping Agent Code';
                    Caption = 'Shipping Agent Code';
                }
                field("Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Shipping Agent Service Code';
                    Caption = 'Shipping Agent Service Code';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the items are shipped.';
                    Caption = 'Shipment Date';
                    // Editable = Rec."Shipping Agent Code" = 'PU';
                    Editable = false;
                }
                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shipping Advice';
                    Caption = 'Shipping Advice';
                    Editable = false;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Status';
                    Caption = 'Status';
                    // StyleExpr = StatusStyleTxt;
                }
                field("No. Pick Slips Printed"; Rec."No. Pick Slips Printed")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the number of pick lists that have been printed for the sales order.';
                    Caption = 'No. Pick Slips Printed';
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
                field("Last Shipping No."; Rec."Last Shipping No.")
                {
                    ApplicationArea = All;
                    Caption = 'Last Shipping No.';
                    ToolTip = 'Last Shipping No.';
                    Editable = false;
                }
                field("BOL No."; Rec."BOL No.")
                {
                    ApplicationArea = All;
                    Caption = 'BOL No.';
                    ToolTip = 'BOL No.';
                    Editable = false;
                }
            }
            // group(Lines)
            // {
            // Caption = 'Lines';
            part(SalesLines; "Sales Order Subform")
            {
                // Caption = 'Sales Lines';
                ApplicationArea = Basic, Suite;
                Editable = false;
                Enabled = true;
                SubPageLink = "Document No." = field("No.");
                SubPageView = where("Outstanding Quantity" = filter(<> 0));
            }
            // }
        }
    }
    actions
    {
        area(Promoted)
        {
            group("Change Shipment Date")
            {
                actionref("Today"; ChangeShipmentDateToday)
                { }
                actionref("Next Business Day"; ChangeShipmentDateTomorrow)
                { }
                actionref("2 Business Days"; ChangeShipmentDate2days)
                { }
            }
            actionref("Print Pick Slip"; PrintPickSlip)
            { }
            actionref("Print Summary Pick Slip"; PrintSummaryPickSlip)
            { }
            actionref("Print Label"; PrintLabel)
            { }
            actionref("Post and Print"; PostAndPrint)
            { }
            actionref("Remove BOL # from SH/OR"; RemoveBOL)
            { }
        }
        area(Navigation)
        {
            group(ShipmentDate)
            {
                action(ChangeShipmentDateToday)
                {
                    ApplicationArea = All;
                    Caption = 'Change To Today';
                    Image = ChangeDate;
                    ToolTip = 'Change To Today';
                    trigger OnAction()
                    begin
                        TorlysChangeShipmentDate.ChangeToToday(Rec, xRec);
                    end;
                }
                action(ChangeShipmentDateTomorrow)
                {
                    ApplicationArea = All;
                    Caption = 'Change To Next Business Day';
                    Image = ChangeDate;
                    ToolTip = 'Change To Next Business Day';
                    trigger OnAction()
                    begin
                        TorlysChangeShipmentDate.ChangeToNextBusinessDay(Rec, xRec);
                    end;
                }
                action(ChangeShipmentDate2days)
                {
                    ApplicationArea = All;
                    Caption = 'Change To 2 Business Days Ahead';
                    Image = ChangeDate;
                    ToolTip = 'Change To 2 Business Days Ahead';
                    trigger OnAction()
                    begin
                        TorlysChangeShipmentDate.ChangeTo2BusinessDays(Rec, xRec);
                    end;
                }
            }
            group(Process)
            {
                Caption = 'Process';
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
                    begin
                        Codeunit.Run(Codeunit::TlyShipPostPrint, Rec);
                        // TorlysDocPrint.PrintShipmentLabel(Rec); //change to SO label only
                        TorlysDocPrint.PrintSalesOrderLabel(Rec);
                    end;
                }
                action(RemoveBOL)
                {
                    ApplicationArea = All;
                    Caption = 'Remove BOL # from SH/OR';
                    Image = CheckList;
                    ToolTip = 'Clear the BOL # from the current line.';
                    // Visible = (Rec."BOL No." <> '');
                    trigger OnAction()
                    var
                        ShipmentHeader: Record "Sales Shipment Header";
                        SalesHeader: Record "Sales Header";
                        RemoveBOL: Boolean;
                    begin
                        CurrPage.SetSelectionFilter(SalesHeader);
                        if SalesHeader.Count > 1 then
                            Error('You cannot remove BOL # this way, choose 1 order.')
                        else begin
                            RemoveBOL := Dialog.Confirm('This will just remove the BOL # from the SH and the OR, the BOL line will still be populated. Proceed?');
                            if RemoveBOL then begin
                                ShipmentHeader.Reset();
                                ShipmentHeader.SetRange("No.", Rec."Last Shipping No.");
                                if ShipmentHeader.Find('-') then begin
                                    ShipmentHeader."BOL No." := '';
                                    ShipmentHeader.Modify(true);
                                    Message('BOL # removed from %1.', Rec."Last Shipping No.");
                                end;
                                SalesHeader.Reset();
                                SalesHeader.SetRange("No.", Rec."No.");
                                if SalesHeader.Find('-') then begin
                                    SalesHeader."BOL No." := '';
                                    SalesHeader.Modify(true);
                                    Message('BOL # removed from %1.', Rec."No.");
                                end;
                            end;
                        end;
                    end;
                }
            }
        }
    }

    var
        TorlysDocPrint: Codeunit TlyDocumentPrint;
        DocPrint: Codeunit "Document-Print";
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";
        TorlysChangeShipmentDate: Codeunit TlyChangeShipmentDate;

    // trigger OnOpenPage()
    // begin
    //     Rec.SetRange("Shipment Date");
    // end;
}