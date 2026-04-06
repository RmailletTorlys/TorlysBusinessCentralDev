codeunit 50050 "Tly Temp Hold Order Delete"
{
    trigger OnRun()
    begin
        // If not Confirm('The System will release orders past hold date.', FALSE, 'OK', 'Cancel')
        // then
        //     exit;

        with SalesHeader do begin
            SetRange("Document Type", "Document Type"::Order);
            SetRange("Temporary Hold", true);

            SetFilter("Order Date", '<%1', CalcDate('<-2D', Today));

            If FindSet() then
                repeat
                    SalesLines.SetRange("Document Type", SalesHeader."Document Type");
                    SalesLines.SetRange("Document No.", SalesHeader."No.");
                    SalesLines.DeleteAll(True);
                // Delete(True);
                Until Next = 0;
            // Sleep(10000);

            // SetRange("No.", SalesHeader."No.");
            // Delete(True);
        end;

        with SalesHeader do begin
            SetRange("Document Type", "Document Type"::Order);
            SetRange("Temporary Hold", true);

            SetFilter("Order Date", '<%1', CalcDate('<-2D', Today));

            If FindSet() then
                repeat
                    // SalesLines.SetRange("Document Type", SalesHeader."Document Type");
                    // SalesLines.SetRange("Document No.", SalesHeader."No.");
                    // SalesLines.DeleteAll(True);
                    Delete(True);
                Until Next = 0;
            // Sleep(10000);

            // SetRange("No.", SalesHeader."No.");
            // Delete(True);
        end;

        MESSAGE('#1 temporary orders have been purged', TotalCount);
    end;

    var
        SalesHeader: Record "Sales Header";
        SalesLines: Record "Sales Line";
        TotalCount: Integer;
}