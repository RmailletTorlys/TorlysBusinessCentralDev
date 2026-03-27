page 51526 TlyPstdSalesInvoiceLinesPLEdit
{
    ApplicationArea = Basic, Suite;
    Caption = 'Posted Sales Invoice Lines Price List Edit';
    // Editable = true;
    // ModifyAllowed = true;
    PageType = List;
    SourceTable = "Sales Invoice Line";
    UsageCategory = History;
    Permissions = tabledata "Sales Invoice Line" = rm;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the document number.';
                    Editable = false;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Editable = false;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Editable = false;
                }
                field("Quantity"; Rec."Quantity")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Editable = false;
                }
                field("Quantity Case"; Rec."Quantity Case")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Editable = false;
                }
                field("Quantity Pallet"; Rec."Quantity Pallet")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Editable = false;
                }
                field("Default Price List"; Rec."Default Price List")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Editable = true;
                }
                field("Price List"; Rec."Price List")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Editable = true;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Editable = false;
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Editable = false;
                }
            }

        }
    }
}