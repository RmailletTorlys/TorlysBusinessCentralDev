report 50004 "Orders to Release TLY"
{
    Caption = 'Orders to Release TLY';
    PreviewMode = PrintLayout;
    WordMergeDataItem = Header;
    RDLCLayout = './Sales/Reports/OrderstoReleaseTLY.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;


    dataset
    {
        dataitem(Header; "Sales Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Location Code", "Shipment Date", "Shipping Agent Code", "No. Pick Slips Printed", "Status", "On Hold";
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
            column(Status; "Status")
            {

            }
            column(No__Pick_Slips_Printed; "No. Pick Slips Printed")
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
            column(RePrintPickSlip; RePrintPickSlip)
            {

            }
            column(On_Hold; "On Hold")
            {

            }
            column(Shipping_Agent_Code; "Shipping Agent Code")
            {

            }
            column(SystemCreatedBy; LookupUserIdWithGuid(SystemCreatedBy))
            {

            }
            column(Assigned_User_ID; "Assigned User ID")
            {

            }
            column(HeaderFilter; HeaderFilter)
            {

            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("Document Type");
                HeaderFilter := "Header".GetFilters;
            end;

            trigger OnAfterGetRecord()
            begin
                If "No. Pick Slips Printed" > 0 then
                    If "Pick Slip Printed Date" > "Popup Modify Date" then
                        ModifiedAfterPrint := False
                    else
                        if "Pick Slip Printed Date" < "Popup Modify Date" then
                            ModifiedAfterPrint := true
                        else
                            if (("Pick Slip Printed Date" = "Popup Modify Date") and ("Pick Slip Printed Time" <= "Popup Modify Time")) then
                                ModifiedAfterPrint := true
                            else
                                ModifiedAfterPrint := false;


                If ModifiedAfterPrint then
                    RePrintPickSlip := 'Yes'
                else
                    RePrintPickSlip := '';
            end;
        }
    }
    procedure LookupUserIdWithGuid(var UserGuid: Guid): Code[50]
    var
        UserDetails: Record "User";
    begin
        UserDetails.Get(UserGuid);
        exit(UserDetails."User Name");
    end;

    var
        ModifiedAfterPrint: Boolean;
        RePrintPickSlip: Text;
        HeaderFilter: Text;
        LastFieldNo: Integer;
}
