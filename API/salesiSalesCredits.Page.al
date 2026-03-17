Page 56105 salesiSalesCredits
{
    PageType = API;
    SourceTable = "Sales Cr.Memo Line";
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesCredit';
    EntitySetName = 'salesCredits';
    DelayedInsert = true;

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
                field(Quantity; Rec."Quantity (Base)")
                {
                    Caption = 'Quantity';
                }
                field(CurrencyCode; CurrencyCode)
                {
                    Caption = 'Currency Code';
                }
                field(CurrencyFactor; CurrencyFactor)
                {
                    Caption = 'Currency Factor';
                }
                field(sales_value; Rec."Amount")
                {
                    Caption = 'sales_value';
                }

                field(Total_Line_Cost; Rec."Line Amount")
                {
                    Caption = 'Total Line Cost';
                }

                field(PostingDateHeader; PostingDate)
                {
                    Caption = 'Posting Date';
                }
                field(invoice_number; InvoiceNo)
                {
                    Caption = 'invoice_number';
                }

                field(order_number; Rec."Order No.")
                {
                    Caption = 'order_number';
                }

                field(TransactionType; Rec."Transaction Type")
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

                field("UnitofMeasureCode"; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
                }

                field(Chain; ChainName)
                {
                    Caption = 'Chain';
                }

                field(GLCode; PostingGroupGlCode)
                {
                    Caption = 'GLCode';
                }

                field(Department; Department)
                {
                    Caption = 'Department';
                }

                field(ShortcutDimension2; Rec."Shortcut Dimension 2 Code")
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

                field(CustomerType; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'CustomerType';
                }

                field(subChannel; ChannelCode)
                {
                    Caption = 'subChannel';
                }

                field(ProgramNo; Rec."Item Category Code")
                {
                    Caption = 'ProgramNo';
                }

                field(promoCode; Rec."Sales Price Code")
                {
                    Caption = 'promoCode';

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

                field(ReasonCode; Rec.Type)
                {
                    Caption = 'ReasonCode';
                }

                field(ProgramTier; Rec."Sales Price Code")
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
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        GPPG: Record "Gen. Product Posting Group";
        GenPostingSetup: Record "General Posting Setup";
        Customer: Record Customer;
        InvoiceNo: Text;
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
        ChannelCode: Code[10];



    trigger OnAfterGetRecord()
    begin
        SalesCrMemoHeader.Reset();
        SalesCrMemoHeader.SetRange("No.", Rec."Document No.");

        GPPG.Reset();
        GPPG.SetRange("Code", Rec."Gen. Prod. Posting Group");

        GenPostingSetup.Reset();
        GenPostingSetup.SetRange("Gen. Prod. Posting Group", Rec."Gen. Prod. Posting Group");

        Customer.Reset();
        Customer.SetRange("No.", Rec."Sell-to Customer No.");

        CurrencyCode := SalesCrMemoHeader."Currency Code";
        CurrencyFactor := SalesCrMemoHeader."Currency Factor";
        InvoiceNo := SalesCrMemoHeader."Original Invoice No.";
        SystemUserId := SalesCrMemoHeader.SystemCreatedBy;
        PaymentTermsCode := SalesCrMemoHeader."Payment Terms Code";
        ShipmentMethodCode := SalesCrMemoHeader."Shipment Method Code";
        ShippingAgentCode := SalesCrMemoHeader."Shipping Agent Code";
        TagName := SalesCrMemoHeader."Tag Name";
        ProjectName := SalesCrMemoHeader."Tag Name";
        OrderDate := SalesCrMemoHeader."Entered At".Date();
        DocumentDate := SalesCrMemoHeader."Document Date";
        Reportable := GPPG."Reportable Group";
        PostingDate := SalesCrMemoHeader."Posting Date";
        PostingGroupGlCode := GenPostingSetup."Sales Account";
        ChainName := Customer."Chain Name";
        Department := Customer."Global Dimension 2 Code";

    end;



}
