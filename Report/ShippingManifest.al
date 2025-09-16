report 50015 "Shipping Manifest"
{
    Caption = 'Shipping Manifest';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Shipping Agent";
    RDLCLayout = './Sales/Reports/ShippingManifest.rdl';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Shipping Agent"; "Shipping Agent")
        {
            RequestFilterFields = "Master Pro Bill";
            RequestFilterHeading = 'Shipping Manifest';

            column(ShippingAgentFilter; ShippingAgentFilter)
            {

            }
            column(Printdate; Format(Printdate, 0, '<month,2>/<day,2>/<year,4>'))
            {

            }

            dataitem("Torlys Processed BOL Header"; "Torlys Processed BOL Header")
            {
                DataItemLinkReference = "Shipping Agent";
                DataItemLink = "Shipping Agent Code" = field(Code);
                RequestFilterFields = "Pickup Date", "Transaction Type";
                RequestFilterHeading = 'Shipping Manifest';

                column(No_; "No.")
                {

                }
                column(ProcessedBOLFilter; ProcessedBOLFilter)
                {

                }
                column(Pickupdate; Format(Pickupdate, 0, '<month,2>/<day,2>/<year,4>'))
                {

                }
                column(Customer_No_; "Customer No.")
                {

                }
                column(Ship_to_Address; "Ship-to Address")
                {

                }
                column(Ship_to_Address_2; "Ship-to Address 2")
                {

                }
                column(Ship_to_City; "Ship-to City")
                {

                }
                column(Ship_to_Post_Code; "Ship-to Post Code")
                {

                }
                column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code")
                {

                }
                column(Shipping_Agent_Code; "Shipping Agent Code")
                {

                }
                column(Shipping_Comment; "Shipping Comment")
                {

                }
                column(Weight___Total; "Weight - Total")
                {

                }
                column(Piece_Count; "Piece Count")
                {

                }
                column(CarrierTotalWeight; CarrierTotalWeight)
                {

                }
                column(TotalBoxes; TotalBoxes)
                {

                }
                column(TotalPackages; TotalPackages)
                {

                }
                column(TotalRolls; TotalRolls)
                {

                }
                column(TotalSkids; TotalSkids)
                {

                }
                column(TotalTubes; TotalTubes)
                {

                }

                trigger OnPreDataItem()
                begin
                    CurrReport.CreateTotals("Weight - Total", CarrierTotalWeight);
                end;

                trigger OnAfterGetRecord()
                begin
                    CarrierTotalWeight := CarrierTotalWeight + "Weight - Total";

                    TotalSkids += "No. of Skids";
                    TotalBoxes += "No. of Boxes";
                    TotalTubes += "No. of Tubes";
                    TotalRolls += "No. of Rolls";
                    TotalPackages += "No. of Packages";

                    ShippingAgent.Get("Shipping Agent Code");
                    ShipToAddress.Get("Customer No.", "Ship-to Code");
                    // ShipToAddress_Terminal := ShipToAddress.
                end;
            }

            trigger OnPreDataItem()
            begin
                ShippingAgentFilter := "Shipping Agent".GetFilters;

                CurrReport.CreateTotals(ProcessedBOL."Weight - Total", CarrierTotalWeight);
                Printdate := Today;
            end;

            trigger OnAfterGetRecord()
            begin
                Pickupdate := ProcessedBOL."Pickup Date";
                CarrierTotalWeight := CarrierTotalWeight + ProcessedBOL."Weight - Total";
            end;
        }
    }
    var
        ShippingAgent: Record "Shipping Agent";
        ProcessedBOL: Record "Torlys Processed BOL Header";
        ShipToAddress: Record "Ship-to Address";
        Pickupdate: date;
        CarrierTotalWeight: Decimal;
        TotalSkids: Integer;
        TotalBoxes: Integer;
        TotalTubes: integer;
        TotalPackages: integer;
        TotalRolls: Integer;
        Printdate: date;
        ShippingAgentFilter: Text;
        ProcessedBOLFilter: Text;
        ShipToAddress_Terminal: Option;
}
