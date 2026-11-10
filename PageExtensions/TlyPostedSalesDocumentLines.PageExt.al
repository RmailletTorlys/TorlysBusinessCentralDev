pageextension 55850 TlyPostedSalesDocumentLines extends "Posted Sales Document Lines"
{
    layout
    {
        addfirst(Options)
        {
            field("Original Invoice No."; OriginalInvoiceNo)
            {
                ApplicationArea = All;
                Caption = 'Original Invoice No.';
                ToolTip = 'Original Invoice No.';
                Editable = false;
            }

            // field("Sell-to Customer No."; CustomerNo)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Sell-to Customer No.';
            //     ToolTip = 'Sell-to Customer No.';
            //     Editable = false;
            // }

            // field("Posting Date"; PostingDate)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Posting Date';
            //     ToolTip = 'Posting Date';
            //     Editable = false;
            // }

            // field("Order Date"; OrderDate)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Order Date';
            //     ToolTip = 'Order Date';
            //     Editable = false;
            // }

            // field("External Document No."; ExternalDocumentNo)
            // {
            //     ApplicationArea = All;
            //     Caption = 'External Document No.';
            //     ToolTip = 'External Document No.';
            //     Editable = false;
            // }

            // field("Tag Name"; SalesHeader."Tag Name")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Tag Name';
            //     ToolTip = 'Tag Name';
            //     Editable = false;
            // }
        }

        modify(OriginalQuantity)
        {
            Visible = false;
        }

        modify(ShowRevLine)
        {
            Visible = false;
        }

        modify(PostedShipmentsBtn)
        {
            Editable = false;
        }

        modify("STRSUBSTNO('(%1)',""No. of Pstd. Shipments"")")
        {
            Visible = false;
        }

        modify("STRSUBSTNO('(%1)',""No. of Pstd. Return Receipts"")")
        {
            Visible = false;
        }

        modify(NoOfPostedCrMemos)
        {
            Visible = false;
        }
    }

    var
        ExtraVar1: Code[20];
        OriginalInvoiceNo: Code[20];
    // CustomerNo: Code[20];
    // PostingDate: Date;
    // OrderDate: Date;
    // ExternalDocumentNo: Code[35];
    // TagName: Text[30];
    // SalesHeader: Record "Sales Header";

    procedure ExtraVariables(ExtraVariable1: Code[20])
    begin
        ExtraVar1 := ExtraVariable1;
    end;

    trigger OnOpenPage()
    var
    // SalesHeader: Record "Sales Header";
    begin
        OriginalInvoiceNo := ExtraVar1;

        // SalesHeader.Reset();
        // SalesHeader.SetRange("No.", ExtraVar1);
        // if SalesHeader.Find('-') then begin
        //     CustomerNo := SalesHeader."Sell-to Customer No.";
        //     PostingDate := SalesHeader."Posting Date";
        //     OrderDate := SalesHeader."Order Date";
        //     ExternalDocumentNo := SalesHeader."External Document No.";
        //     TagName := SalesHeader."Tag Name";
        // end;

        CurrPage.PostedInvoices.Page.SetOriginalInvoiceNo(OriginalInvoiceNo);
    end;

    // trigger OnAfterGetCurrRecord()
    // begin
    //     SalesHeader.Reset();
    //     SalesHeader.SetRange("No.", ExtraVar1);
    //     if SalesHeader.Find('-') then begin
    //         CustomerNo := SalesHeader."Sell-to Customer No.";
    //         PostingDate := SalesHeader."Posting Date";
    //         OrderDate := SalesHeader."Order Date";
    //         ExternalDocumentNo := SalesHeader."External Document No.";
    //         TagName := SalesHeader."Tag Name";
    //     end;
    // end;
}
