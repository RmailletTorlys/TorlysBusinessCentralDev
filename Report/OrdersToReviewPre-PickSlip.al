report 50006 "Orders to review pre-pick slip"
{
    Caption = 'Orders to review pre-pick slip';
    PreviewMode = PrintLayout;
    WordMergeDataItem = Header;
    WordLayout = './Sales/Reports/OrdersToReviewPre-Pickslip.docx';
    UsageCategory = ReportsAndAnalysis;


    dataset
    {
        dataitem(Header; "Sales Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Location Code", "Shipment Date", "Shipping Agent Code", "No. Pick Lists Printed", "Released", "On Hold";
            RequestFilterHeading = 'Orders To Release TLY';

            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(No_; "No.")
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Shipment_Date; "Shipment Date")
            {

            }
            column(Released; Released)
            {

            }
            column(No__Pick_Lists_Printed; "No. Pick Lists Printed")
            {

            }
            column(Pick_Slip_Printed_By; "Pick Slip Printed By")
            {

            }
            column(Pick_Slip_Printed_Date; "Pick Slip Printed Date")
            {

            }
            column(Pick_Slip_Printed_Time; "Pick Slip Printed Time")
            {

            }
            column(On_Hold; "On Hold")
            {

            }
            column(Shipping_Agent_Code; "Shipping Agent Code")
            {

            }
            column(SystemCreatedBy; SystemCreatedBy)
            {

            }
            column(Assigned_User_ID; "Assigned User ID")
            {

            }
            trigger OnAfterGetRecord()
            var
                ModifiedAfterPrint: Boolean;
            begin

            end;
        }
    }

    trigger OnPreReport()
    var
        HeaderFilter: Text;
    begin
        HeaderFilter := Header.GetFilters;
    end;
}
