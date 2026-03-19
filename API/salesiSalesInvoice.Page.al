Page 56104 salesiSalesInvoice
{
    PageType = API;
    SourceTable = "Sales Invoice Line";
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesInvoice';
    EntitySetName = 'salesInvoices';
    DelayedInsert = true;
    Editable = false;
    DataAccessIntent = ReadOnly;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    Caption = 'Item Number';
                }

                field(shipTo; Rec."Ship-to Code")
                {
                    Caption = 'Description';
                }

                field(prod_code; Rec."No.")
                {
                    Caption = 'prod_code';
                }

                field(Quantity; Rec."Quantity")
                {
                    Caption = 'Quantity';
                }

                field(Amount; Rec."Amount")
                {
                    Caption = 'Amount';
                }

                field(CurrencyCode; CurrencyCode)
                {
                    Caption = 'Currency Code';
                }

                field(CurrencyFactor; CurrencyFactor)
                {
                    Caption = 'Currency Factor';
                }

                field(Total_Line_Cost; Rec."Line Amount")
                {
                    Caption = 'Total Line Cost';
                }

                field(PostingDateHeader; PostingDate)
                {
                    Caption = 'Posting Date';
                }

                field(invoice_number; Rec."Document No.")
                {
                    Caption = 'invoice_number';
                }

                field(order_number; Rec."Document No.")
                {
                    Caption = 'order_number';
                }

                field(TransactionType; 'INVOICE')
                {
                    Caption = 'TransactionType';
                }

                field(SalespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'SalespersonCode';
                }

                field(CreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'CreaatedBy';
                }

                field(UserId; SystemUserId)
                {
                    Caption = 'UserId';
                }

                field(PaymentTermsCode; PaymentTermsCode)
                {
                    Caption = 'PaymentTermsCode';
                }

                field(ShipmentMethodCode; ShipmentMethodCode)
                {
                    Caption = 'ShipmentMethodCode';
                }

                field(ShippingAgentCode; ShippingAgentCode)
                {
                    Caption = 'ShippingAgentCode';
                }

                field(LocationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }

                field(UnitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'UnitOfMeasureCode';
                }

                field(Chain; ShortcutDimCode[5])
                {
                    Caption = 'Chain';
                }

                field(GLCode; PostingGroupGlCode)
                {
                    Caption = 'GLCode';
                }

                field(Department; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Department';
                }

                field(ShortcutDimension2; '')
                {
                    Caption = 'ShortcutDimension2';
                }

                field(Reportable; Reportable)
                {
                    Caption = 'Reportable';
                }

                field(FriendlyName; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'FriendlyName';
                }

                field(CustomerType; ShortcutDimCode[3])
                {
                    Caption = 'CustomerType';
                }

                field(subChannel; '')
                {
                    Caption = 'subChannel';
                }

                field(ProgramNo; Rec."Item Category Code")
                {
                    Caption = 'ProgramNo';
                }

                field(PromoCode; Rec."Price List")
                {
                    Caption = 'PromoCode';

                }

                field(SalespersonCode2; Rec."Salesperson Code 2")
                {
                    Caption = 'Salesperson Code 2';
                }

                field("SalespersonCode3"; Rec."Salesperson Code 3")
                {
                    Caption = 'Salesperson Code 3';
                }

                field(PostingDateLine; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }

                field(OrderDate; OrderDate)
                {
                    Caption = 'Order Date';
                }

                field(InvoiceDate; DocumentDate)
                {
                    Caption = 'Invoice Date';
                }

                field(ReasonCode; '')
                {
                    Caption = 'ReasonCode';
                }

                field(ProgramTier; Rec."Price List")
                {
                    Caption = 'Program Tier';

                }

                field(TagName; TagName)
                {
                    Caption = 'TagName';
                }

                field(ProjectName; Projectname)
                {
                    Caption = 'ProjectName';

                }


            }
        }
    }
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        GPPG: Record "Gen. Product Posting Group";
        GenPostingSetup: Record "General Posting Setup";
        Customer: Record Customer;
        CurrencyCode: Code[10];
        CurrencyFactor: Decimal;
        SystemUserId: Text;
        PaymentTermsCode: Code[10];
        ShipmentMethodCode: Code[10];
        ShippingAgentCode: Code[10];
        Reportable: Boolean;
        TagName: Text;
        Projectname: Text;
        ChainName: Text;
        OrderDate: Date;
        DocumentDate: Date;
        Department: Text;
        PostingGroupGlCode: Text;
        PostingDate: Date;
        ShortcutDimCode: array[8] of Code[20];



    trigger OnAfterGetRecord()
    begin
        SalesInvoiceHeader.Reset();
        SalesInvoiceHeader.Get(Rec."Document No.");

        GPPG.Reset();
        GPPG.Get(Rec."Gen. Prod. Posting Group");

        GenPostingSetup.Reset();
        GenPostingSetup.Get(Rec."Gen. Bus. Posting Group", Rec."Gen. Prod. Posting Group");

        Customer.Reset();
        Customer.Get(Rec."Sell-to Customer No.");


        Rec.ShowShortcutDimCode(ShortcutDimCode);


        CurrencyCode := SalesInvoiceHeader."Currency Code";
        CurrencyFactor := SalesInvoiceHeader."Currency Factor";
        SystemUserId := SalesInvoiceHeader.SystemCreatedBy;
        PaymentTermsCode := SalesInvoiceHeader."Payment Terms Code";
        ShipmentMethodCode := SalesInvoiceHeader."Shipment Method Code";
        ShippingAgentCode := SalesInvoiceHeader."Shipping Agent Code";
        TagName := SalesInvoiceHeader."Tag Name";
        ProjectName := SalesInvoiceHeader."Tag Name";
        OrderDate := SalesInvoiceHeader."Order Date";
        DocumentDate := SalesInvoiceHeader."Document Date";
        Reportable := GPPG."Reportable Group";
        PostingDate := SalesInvoiceHeader."Posting Date";
        PostingGroupGlCode := GenPostingSetup."Sales Account";
        Department := Customer."Global Dimension 2 Code";

    end;



}





