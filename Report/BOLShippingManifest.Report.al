report 50014 "BOL Shipping Manifest"
{
    Caption = 'BOL Shipping Manifest';
    PreviewMode = PrintLayout;
    WordMergeDataItem = BOLHeader;
    RDLCLayout = './Sales/Reports/BOLShippingManifest.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(BOLHeader; "Torlys Processed BOL Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            RequestFilterHeading = 'BOL Shipping Manifest';

            column(Pickup_Date; Format("Pickup Date", 0, '<month,2>/<day,2>/<year,4>'))
            {

            }

            dataitem("Sales Shipment Header"; "Sales Shipment Header")
            {
                DataItemLinkReference = BOLHeader;
                DataItemLink = "Bol No." = field("No.");

                column(External_Document_No_; "External Document No.")
                {

                }
                column(Tag_Name; "Tag Name")
                {

                }
                column(Order_No_; "Order No.")
                {

                }
                column(No_; "No.")
                {

                }
                column(BoL_No_; "BoL No.")
                {

                }
                column(Shipping_Agent_Code; "Shipping Agent Code")
                {

                }
            }

        }
    }
}