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
    Editable = false;
    DataAccessIntent = ReadOnly;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(TransactionType; 'CREDIT')
                {
                    Caption = 'Transaction Type';
                }

                // field(PostingDateHeader; Rec."Posting Date")
                // {
                //     Caption = 'Posting Date';
                // }

                field(PostingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }

                field(DocumentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }

                // field(InvoiceDate; Rec."Posting Date")
                // {
                //     Caption = 'Document Date';
                // }

                field(OrderNo; '')
                {
                    Caption = 'Order No.';
                }

                field(OrderDate; '')
                {
                    Caption = 'Order Date';
                }

                field(Channel; ShortcutDimCode[3])
                {
                    Caption = 'Channel';
                }

                field(SubChannel; '')
                {
                    Caption = 'Sub-Channel';
                }

                field(TagName; TagName)
                {
                    Caption = 'Tag Name';
                }

                field(SellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    Caption = 'Sell-to Customer No.';
                }

                field(ShipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Ship-to Code';
                }

                field(Region; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Region';
                }

                // field(ShortcutDimension2; '')
                // {
                //     Caption = 'Department';
                // }

                field(SalespersonCode; SalespersonCode)
                {
                    Caption = 'Salesperson Code';
                }

                field(SalespersonCode2; SalespersonCode2)
                {
                    Caption = 'Salesperson Code 2';
                }

                field("SalespersonCode3"; SalespersonCode3)
                {
                    Caption = 'Salesperson Code 3';
                }

                field(LocationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }

                field(ItemCategoryCode; Rec."Item Category Code")
                {
                    Caption = 'Item Category Code';
                }

                field(ItemNo; Rec."No.")
                {
                    Caption = 'Item No.';
                }

                field("UnitofMeasureCode"; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit of Measure Code';
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

                // field(CreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
                // {
                //     Caption = 'CreatedBy';
                // }

                // field(UserId; SystemUserId)
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

                field(BuyingGroup; ShortcutDimCode[5])
                {
                    Caption = 'Buying Group';
                }

                // field(GLCode; PostingGroupGlCode)
                // {
                //     Caption = 'GLCode';
                // }

                field(Reportable; Reportable)
                {
                    Caption = 'Reportable';
                }

                field(FriendlyName; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'FriendlyName';
                }

                field(PriceList; Rec."Price List")
                {
                    Caption = 'promoCode';
                }

                field(ReasonCode; ReasonCode)
                {
                    Caption = 'Reason Code';
                }

                field(PostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                }

                field(PriceList2; Rec."Price List")
                {
                    Caption = 'Program Tier';
                }

                field(ProjectName; Projectname)
                {
                    Caption = 'ProjectName';
                }
                field(PriceList3; Rec."Price List")
                {
                    Caption = 'Project Number';
                }
                field(NationalPM; '0')
                {
                    Caption = 'National PM';
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
        DocumentDate: Date;
        Department: Text;
        PostingGroupGlCode: Text;
        PostingDate: Date;
        ReasonCode: Code[10];
        SalespersonCode: Code[10];
        SalespersonCode2: Code[10];
        SalespersonCode3: Code[10];
        ShortcutDimCode: array[8] of Code[20];
        EnteredBy: Code[20];
        LookupUserId: Codeunit TlyLookupUserID;

    trigger OnAfterGetRecord()
    begin

        if SalesCrMemoHeader.Get(Rec."Document No.") then begin
            CurrencyCode := SalesCrMemoHeader."Currency Code";
            // CurrencyFactor := SalesCrMemoHeader."Currency Factor";
            InvoiceNo := SalesCrMemoHeader."Original Invoice No.";
            // SystemUserId := LookupUserId.UserId(SalesCrMemoHeader.SystemCreatedBy);
            // PaymentTermsCode := SalesCrMemoHeader."Payment Terms Code";
            // ShipmentMethodCode := SalesCrMemoHeader."Shipment Method Code";
            // ShippingAgentCode := SalesCrMemoHeader."Shipping Agent Code";
            TagName := SalesCrMemoHeader."Tag Name";
            ProjectName := SalesCrMemoHeader."Tag Name";
            SalespersonCode := SalesCrMemoHeader."Salesperson Code";
            SalespersonCode2 := SalesCrMemoHeader."Salesperson Code 2";
            SalespersonCode3 := SalesCrMemoHeader."Salesperson Code 3";
            DocumentDate := SalesCrMemoHeader."Document Date";
            PostingDate := SalesCrMemoHeader."Posting Date";
            ReasonCode := SalesCrMemoHeader."Reason Code";
            EnteredBy := SalesCrMemoHeader."Entered By";

            if SalesCrMemoHeader."Entered At" <> 0DT then
                OrderDate := DT2Date(SalesCrMemoHeader."Entered At")
            else
                OrderDate := 0D;
        end else begin
            Clear(SalesCrMemoHeader);
            CurrencyCode := '';
            InvoiceNo := '';
            OrderDate := 0D;
        end;

        if GPPG.Get(Rec."Gen. Prod. Posting Group") then
            Reportable := GPPG."Reportable Group"
        else
            Reportable := false;

        if GenPostingSetup.Get(Rec."Gen. Bus. Posting Group", Rec."Gen. Prod. Posting Group") then
            PostingGroupGlCode := GenPostingSetup."Sales Account"
        else
            PostingGroupGlCode := '';

        if Customer.Get(Rec."Sell-to Customer No.") then begin
            ChainName := Customer."Chain Name";
            Department := Customer."Global Dimension 2 Code";
        end else begin
            ChainName := '';
            Department := '';
        end;

        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;
}