page 50117 TorlysOrdersToBeShipped
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Sales Header";
    UsageCategory = Lists;
    Caption = 'Orders to Be Shipped';
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;


    layout
    {
        area(content)
        {

            repeater(Group)
            {

                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Date';
                    ToolTip = 'Shipment Date';

                }

                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Caption = 'Location Code';
                    ToolTip = 'Location Code';
                }

                field("Collector ID"; GetCollectorID(Rec."Sell-to Customer No."))
                {
                    ApplicationArea = All;
                    Caption = 'Collector ID';
                    ToolTip = 'Collector ID';
                }

                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Number';
                    ToolTip = 'Customer Number';
                }

                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Name';
                    ToolTip = 'Customer Name';
                }

                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                    Caption = 'Ship-to Code';
                    ToolTip = 'Ship-to Code';
                }

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Order No.';
                    ToolTip = 'Order Number';
                }

                field("To Ship Qty."; SumSalesLines(Rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'To Ship Qty.';
                    ToolTip = 'To Ship Quantity';

                }

            }
        }
    }



    actions
    {


        area(processing)
        {

            action(PrintPickSlipsAction)
            {
                Caption = 'Print Selected Pickslips';
                ToolTip = 'Click here to print the selected pickslip. If multiple orders are selected, all pickslips will be printed.';
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                var
                    OrderRec: Record "Sales Header";

                begin

                    CurrPage.SetSelectionFilter(OrderRec);

                    if OrderRec.IsEmpty() then
                        Error('Please verify that you have selected an order and try again.');


                    if OrderRec.FindSet() then
                        repeat
                            Message('Pickslip Printed for Order No. %1', OrderRec."No.");
                        until OrderRec.Next() = 0;


                end;


            }
        }
    }

    trigger OnOpenPage()

    begin


        Rec.SetRange("Document Type", Rec."Document Type"::Order);
        Rec.SetFilter("Shipment Date", '%1', Today);

    end;


    procedure GetCollectorID(CustomerNo: Code[20]): text
    var
        CustomerRec: Record Customer;
    begin
        if not (CustomerRec.Get(CustomerNo)) then
            Error('Customer with No. %1 not found', CustomerNo);
        exit(CustomerRec."Collector ID");
    end;


    procedure SumSalesLines(orderNo: Code[20]): Decimal
    var
        SalesLines: Record "Sales Line";
        TotalQuantity: Decimal;
    begin
        TotalQuantity := 0;

        SalesLines.SetRange("Document Type", SalesLines."Document Type"::Order);
        SalesLines.SetRange("Document No.", orderNo);

        if SalesLines.FindSet() then
            repeat
                TotalQuantity += SalesLines.Quantity;
            until SalesLines.Next() = 0;

        exit(TotalQuantity);
    end;
}