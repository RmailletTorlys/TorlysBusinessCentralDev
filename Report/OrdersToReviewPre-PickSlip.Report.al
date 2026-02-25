report 50006 "Orders to review pre-pick slip"
{
    Caption = 'Orders to review pre-pick slip';
    PreviewMode = PrintLayout;
    WordMergeDataItem = Header;
    rdlcLayout = './Sales/Reports/OrdersToReviewPre-Pickslip.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;


    dataset
    {
        dataitem(Header; "Sales Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Location Code", "Shipment Date", "No. Pick Slips Printed", "Shipping Agent Code", "Status", "On Hold", SystemCreatedBy;
            RequestFilterHeading = 'Orders to review pre-pick slip';

            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(No_; "No.")
            {

            }
            column(Status; Status)
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Shipment_Date; "Shipment Date")
            {

            }
            // column(Released; Released)
            // {

            // }
            column(Shipping_Advice; "Shipping Advice")
            {

            }
            column(Ship_to_Code; "Ship-to Code")
            {

            }
            column(Salesperson_Code; "Salesperson Code")
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
            dataitem(Line; "Sales Line")
            {
                DataItemLinkReference = Header;
                UseTemporary = true;

                column(ItemNo; "No.")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Qty__to_Ship; "Qty. to Ship")
                {

                }
                column(Outstanding_Quantity; "Outstanding Quantity")
                {

                }
            }
            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("Document Type");
                HeaderFilter := "Header".GetFilters;
            end;

            trigger OnAfterGetRecord()
            begin
                If "No. Pick Slips Printed" > 0 then
                    If "Pick Slip Printed Date" > "Warehouse Notify Modify Date" then
                        ModifiedAfterPrint := False
                    else
                        if "Pick Slip Printed Date" < "Warehouse Notify Modify Date" then
                            ModifiedAfterPrint := true
                        else
                            if (("Pick Slip Printed Date" = "Warehouse Notify Modify Date") and ("Pick Slip Printed Time" <= "Warehouse Notify Modify Time")) then
                                ModifiedAfterPrint := true
                            else
                                ModifiedAfterPrint := false;
                If ModifiedAfterPrint then
                    RePrintPickSlip := 'Yes'
                else
                    RePrintPickSlip := '';
            End;
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
