report 50017 "RTV Items To Be Put Away"
{
    Caption = 'RTV Items To Be Put Away';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Sales Header";
    RDLCLayout = './Sales/Reports/RTVItemsToPutAway.rdl';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = Where("Document Type" = filter("Credit Memo"));

            column(No_; "No.")
            {

            }

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemTableView = Where(Type = filter(Item), "Return Qty. to Receive" = filter(> 0));
                DataItemLinkReference = "Sales Header";
                DataItemLink = "Document No." = field("No.");

                column(ItemNo_; "No.")
                {

                }
                column(Return_Qty__to_Receive__Base_; "Return Qty. to Receive (Base)")
                {

                }
                column(Qty__to_Receive_Case; "Return Qty. to Receive Case")
                {

                }
                column(Qty__to_Receive_Pallet; "Return Qty. to Receive Pallet")
                {

                }
            }
        }
    }
}