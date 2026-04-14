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
                field(SellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                }

                field(ShipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                }

                field(ItemNo; Rec."No.")
                {
                    Caption = 'Item No.';
                }

                field(Quantity; Rec."Quantity")
                {
                    Caption = 'Quantity';
                }

                field(Amount; Rec."Amount")
                {
                    Caption = 'Amount';
                }

                field(Cost; Rec."Quantity" * Rec."Unit Cost")
                {
                    Caption = 'Cost';
                }

                field(CurrencyCode; CurrencyCode)
                {
                    Caption = 'Currency Code';
                }

                // field(CurrencyFactor; CurrencyFactor)
                // {
                //     Caption = 'Currency Factor';
                // }

                // field(PostingDateHeader; Rec."Posting Date")
                // {
                //     Caption = 'Posting Date';
                // }

                field(DocumentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }

                field(OrderNo; Rec."Order No.")
                {
                    Caption = 'Order No.';
                }

                field(TransactionType; 'INVOICE')
                {
                    Caption = 'Transaction Type';
                }

                field(SalespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }

                // field(EnteredBy; EnteredBy)
                // {
                //     Caption = 'CreaatedBy';
                // }

                // field(UserId; CreatedBy)
                // {
                //     Caption = 'UserId';
                // }

                // field(PaymentTermsCode; PaymentTermsCode)
                // {
                //     Caption = 'PaymentTermsCode';
                // }

                // field(ShipmentMethodCode; ShipmentMethodCode)
                // {
                //     Caption = 'ShipmentMethodCode';
                // }

                // field(ShippingAgentCode; ShippingAgentCode)
                // {
                //     Caption = 'ShippingAgentCode';
                // }

                field(LocationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }

                // field(UnitOfMeasureCode; Rec."Unit of Measure Code")
                // {
                //     Caption = 'UnitOfMeasureCode';
                // }

                field(BuyingGroup; ShortcutDimCode[5])
                {
                    Caption = 'BuyingGroup';
                }

                // field(GLCode; PostingGroupGlCode)
                // {
                //     Caption = 'GLCode';
                // }

                field(Region; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Region';
                }

                // field(ShortcutDimension2; '')
                // {
                //     Caption = 'ShortcutDimension2';
                // }

                field(Reportable; Reportable)
                {
                    Caption = 'Reportable';
                }

                field(FriendlyName; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'FriendlyName';
                }

                field(Channel; ShortcutDimCode[3])
                {
                    Caption = 'Channel';
                }

                field(subChannel; '')
                {
                    Caption = 'subChannel';
                }

                field(ItemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }

                field(PromoCode; Rec."Price List")
                {
                    Caption = 'PromoCode';

                }
                field(SalespersonCode2; SalespersonCode2)
                {
                    Caption = 'Salesperson Code 2';
                }

                field("SalespersonCode3"; SalespersonCode3)
                {
                    Caption = 'Salesperson Code 3';
                }

                field(PostingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }

                field(OrderDate; OrderDate)
                {
                    Caption = 'Order Date';
                }

                // field(InvoiceDate; DocumentDate)
                // {
                //     Caption = 'Invoice Date';
                // }

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

                field(project_number; Rec."Price List")
                {
                    Caption = 'Project Number';
                }

                field(NationalPM; '0')
                {
                    Caption = 'National PM';
                }
                field(PostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
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
        // CurrencyFactor: Decimal;
        // SystemUserId: Text;
        // PaymentTermsCode: Code[10];
        // ShipmentMethodCode: Code[10];
        // ShippingAgentCode: Code[10];
        Reportable: Boolean;
        TagName: Text;
        Projectname: Text;
        ChainName: Text;
        OrderDate: Date;
        // DocumentDate: Date;
        Department: Text;
        // PostingGroupGlCode: Text;
        PostingDate: Date;
        SalespersonCode: Code[10];
        SalespersonCode2: Code[10];
        SalespersonCode3: Code[10];
        ShortcutDimCode: array[8] of Code[20];
        LookupUserId: Codeunit TlyLookupUserID;

    trigger OnAfterGetRecord()
    begin

        if SalesInvoiceHeader.Get(Rec."Document No.") then begin
            CurrencyCode := SalesInvoiceHeader."Currency Code";
            // CurrencyFactor := SalesInvoiceHeader."Currency Factor";
            // SystemUserId := LookupUserId.UserId(SalesInvoiceHeader.SystemCreatedBy);
            // PaymentTermsCode := SalesInvoiceHeader."Payment Terms Code";
            // ShipmentMethodCode := SalesInvoiceHeader."Shipment Method Code";
            // ShippingAgentCode := SalesInvoiceHeader."Shipping Agent Code";
            TagName := SalesInvoiceHeader."Tag Name";
            ProjectName := SalesInvoiceHeader."Tag Name";
            OrderDate := SalesInvoiceHeader."Order Date";
            // DocumentDate := SalesInvoiceHeader."Document Date";
            PostingDate := SalesInvoiceHeader."Posting Date";
            SalespersonCode := SalesInvoiceHeader."Salesperson Code";
            SalespersonCode2 := SalesInvoiceHeader."Salesperson Code 2";
            SalespersonCode3 := SalesInvoiceHeader."Salesperson Code 3";
        end else begin
            Clear(SalesInvoiceHeader);
            CurrencyCode := '';
            OrderDate := 0D;
            TagName := '';
        end;

        if (Rec."Gen. Prod. Posting Group" <> '') and GPPG.Get(Rec."Gen. Prod. Posting Group") then
            Reportable := GPPG."Reportable Group"
        else
            Reportable := false;

        // if GenPostingSetup.Get(Rec."Gen. Bus. Posting Group", Rec."Gen. Prod. Posting Group") then
        //     PostingGroupGlCode := GenPostingSetup."Sales Account"
        // else
        //     PostingGroupGlCode := '';

        if Customer.Get(Rec."Sell-to Customer No.") then
            Department := Customer."Global Dimension 2 Code"
        else
            Department := '';

        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;
}