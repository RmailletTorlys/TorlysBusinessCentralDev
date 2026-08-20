pageextension 51823 TlyNTNSubmissionList extends "NTN Submission List"
{
    actions
    {
        addlast(Submission)
        {
            action(NTNSubmissionPageMapping)
            {
                Caption = 'NTN Submission Page Mapping';
                ToolTip = 'NTN Submission Page Mapping';
                ApplicationArea = All;
                // Promoted = true;
                Image = Order;
                RunObject = Page "NTN Submission Page Mapping";
                // RunPageLink = "Related Item No." = field("No.");
                RunPageMode = View;
            }
        }
    }
}