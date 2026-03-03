reportextension 50082 "TorlysReturnReceipt" extends "Return Receipt"
{
    dataset
    {
        modify("Return Receipt Header")
        {
            trigger OnAfterAfterGetRecord()
            begin
                SalesCommentLine.Reset();
                SalesCommentLine.SetRange("No.", "No.");
                SalesCommentLine.SetRange("Print On Invoice", true);

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
        add("Return Receipt Header")
        {
            column(AllComments; AllComments)
            {

            }
        }
    }
    var
        SalesCommentLine: Record "Sales Comment Line";
        AllComments: text;
}