reportextension 50300 "TorlysPostedCreditMemo" extends "Standard Sales - Credit Memo"
{
    dataset
    {
        modify(Line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                AmountExclInvDisc := Amount + "Inv. Discount Amount";

                If Quantity = 0 then
                    unitpricetoprint := 0
                else
                    unitpricetoprint := ROUND(AmountExclInvDisc / Quantity, 0.01);

                // Clear(tempdesc3);
                // If ("Item Reference No." <> '') then begin
                //     Clear(ItemTemp);
                //     ItemTemp.get("No.");
                //     tempdesc3 := Description;
                //     Description := ItemTemp.Description;
                //     Modify();
                // end;

                If ("No." <> '') and ("Item Reference No." <> '') then begin
                    Clear(tempcrossrefitem);
                    tempcrossrefitem.SetFilter("Item No.", "No.");
                    tempcrossrefitem.SetFilter("Reference Type", 'Customer');
                    If tempcrossrefitem.find('-') then
                        tempsalescrmemoline."No." := tempcrossrefitem."Reference No.";
                    TempDesc := tempcrossrefitem.Description;
                    refitem := tempcrossrefitem."Reference No.";
                end;

                If Type = Type::" " then begin
                    "No." := '';
                    "Unit of Measure" := '';
                    Amount := 0;
                    "Amount Including VAT" := 0;
                    "Inv. Discount Amount" := 0;
                    Quantity := 0;
                End else
                    if Type = Type::"G/L Account" then
                        "No." := '';

                desctoprint := Description + '' + "Description 2";
            end;
        }
        modify(header)
        {
            trigger OnAfterAfterGetRecord()
            begin
                billaddr(billtoaddrTly, Header);
                if "Pre-Assigned No. Series" = 'S-CM' then begin
                    // ROandPreALabel := 'Credit Memo No.';
                    ROandPreALabel := 'Pre-Assigned No.';
                    roandPreassignNo := "Pre-Assigned No.";
                end else begin
                    ROandPreALabel := 'Return Order No.';
                    roandPreassignNo := "Return Order No."
                end;

                SalesCommentLine.Reset();
                SalesCommentLine.SetRange("No.", "No.");
                SalesCommentLine.SetRange("Print On Credit Memo", true);

                // FindSet is used for looping through a set of records
                if SalesCommentLine.FindSet() then begin
                    repeat
                        // This is where you process EACH comment
                        // Example: Concatenate all comments into one string
                        AllComments := AllComments + ' --- ' + SalesCommentLine.Comment;

                    until SalesCommentLine.Next() = 0; // Moves to the next record; stops when 0
                end else begin
                    AllComments := '';
                end;
            end;
        }

        add(Header)
        {
            column(Payment_Terms_Code; "Payment Terms Code")
            {

            }
            column(Reason_Code; "Reason Code")
            {

            }
            column(ROandPreALabel; ROandPreALabel)
            {

            }
            column(roandPreassignNo; roandPreassignNo)
            {

            }
            column(Original_Invoice_No_; "Original Invoice No.")
            {

            }
            column(AllComments; AllComments)
            {

            }
            column(billtoaddrTly1; billtoaddrTly[1])
            { }
            column(billtoaddrTly2; billtoaddrTly[2])
            { }
            column(billtoaddrTly3; billtoaddrTly[3])
            { }
            column(billtoaddrTly4; billtoaddrTly[4])
            { }
            column(billtoaddrTly5; billtoaddrTly[5])
            { }
            column(billtoaddrTly6; billtoaddrTly[6])
            { }
            column(billtoaddrTly7; billtoaddrTly[7])
            { }
            column(billtoaddrTly8; billtoaddrTly[8])
            { }
        }

        add(Line)
        {
            column(quantity1; "Quantity")
            {

            }
            column(unitpricetoprint; unitpricetoprint)
            {

            }
            column(tempdesc3; tempdesc3)
            {

            }
            column(Item_Reference_No_; "Item Reference No.")
            {

            }
            column(desctoprint; desctoprint)
            {

            }
            column(TempDesc; TempDesc)
            {

            }
            column(refitem; refitem)
            {

            }
        }
    }

    var
        ItemTemp: Record Item;
        tempcrossrefitem: Record "Item Reference";
        tempsalescrmemoline: Record "Sales Cr.Memo Line" temporary;
        SalesCommentLine: Record "Sales Comment Line";
        quantity1: Decimal;
        unitpricetoprint: Decimal;
        AmountExclInvDisc: Decimal;
        tempdesc3: Text;
        desctoprint: Text;
        AllComments: Text;
        ROandPreALabel: Text;
        roandPreassignNo: text;
        TempDesc: Text;
        refitem: code[50];
        billtoaddrTly: array[8] of Text;
        FormatAddr1: Codeunit "Format Address";

    local procedure billaddr(var AddrArray: array[8] of Text[100]; var CrMemoHeader: Record "Sales Cr.Memo Header")
    var
    begin
        FormatAddr1.FormatAddr(
            AddrArray, '', CrMemoHeader."Bill-to Name", CrMemoHeader."Bill-to Name 2", CrMemoHeader."Bill-to Address", CrMemoHeader."Bill-to Address 2",
            CrMemoHeader."Bill-to City", CrMemoHeader."Bill-to Post Code", '', CrMemoHeader."Bill-to Country/Region Code");
    end;
}