page 50100 TlySalesOrderAPI
{
    PageType = API;
    Caption = 'Custom Sales Order API';
    APIPublisher = 'Torlys';
    APIGroup = 'sales';
    APIVersion = 'v1.0';
    EntityName = 'customSalesOrder';
    EntitySetName = 'customSalesOrders';
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = const(Order));
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(number; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(customerNumber; Rec."Sell-to Customer No.")
                {
                    Caption = 'Customer No.';
                }
                // --- ADD YOUR CUSTOM EXTENSION FIELDS BELOW ---
                field(OrderMethod; Rec."Order Method")
                {
                    Caption = 'Order Method';
                }
                field(OrderType; Rec."Order Type")
                {
                    Caption = 'Order Type';
                }
                field(TagName; Rec."Tag Name")
                {
                    Caption = 'Tag Name';
                }
                field(Campaign; Rec."Campaign No.")
                {
                    Caption = 'Campaign No.';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Document Type" := Rec."Document Type"::Order;
    end;
}
