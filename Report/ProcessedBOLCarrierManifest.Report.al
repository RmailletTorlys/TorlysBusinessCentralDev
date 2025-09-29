report 50013 "Processed BOL Carrier Manifest"
{
    Caption = 'Processed BOL Carrier Manifest';
    PreviewMode = PrintLayout;
    WordMergeDataItem = BOLHeader;
    RDLCLayout = './Sales/Reports/ProcessedBOLCarrierManifest.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(BOLHeader; "Torlys Processed BOL Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Shipping Agent Code", "Pickup Date", "Location Code";
            RequestFilterHeading = 'Processed BOL Carrier Manifest';

            column(No_; "No.")
            {

            }
            column(PrintDetail; PrintDetailOption)
            {

            }
            column(FilterString; FilterString)
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
            column(Shipping_Instructions_1; "Shipping Instructions 1")
            {

            }
            column(Shipping_Instructions_2; "Shipping Instructions 2")
            {

            }
            column(Shipping_Instructions_3; "Shipping Instructions 3")
            {

            }
            column(Shipping_Instructions_4; "Shipping Instructions 4")
            {

            }
            column(Piece_Count; "Piece Count")
            {

            }
            column(Shipping_Comment; "Shipping Comment")
            {

            }
            column(Cases___Total; "Cases - Total")
            {

            }
            column(Weight___Total; "Weight - Total")
            {

            }
            column(Warehouse_Associate_Loaded_by; "Warehouse Associate Loaded by")
            {

            }
            column(BOLCount; BOLCount)
            {

            }
            column(TotalWeight; TotalWeight)
            {

            }
            column(TotalSkids; TotalSkids)
            {

            }
            column(TotalBoxes; TotalBoxes)
            {

            }
            column(TotalTubes; TotalTubes)
            {

            }
            column(TotalPackages; TotalPackages)
            {

            }
            column(TotalRolls; TotalRolls)
            {

            }
            dataitem(BOLLine; "Torlys Processed BOL Line")
            {
                DataItemLink = "Bol No." = field("No.");
                DataItemLinkReference = BOLHeader;
                DataItemTableView = sorting("BOL No.", "BOL Line No.");

                column(Shipment_No_; "Shipment No.")
                {

                }
                column(BOL_No_; "BOL No.")
                {

                }
                column(Order_No_; "Order No.")
                {

                }
                column(Total_Cases; "Total Cases")
                {

                }
                column(Total_Pallet; "Total Pallet")
                {

                }
                column(Total_Weight; "Total Weight")
                {

                }
            }

            trigger OnAfterGetRecord()
            begin
                BOLCount := BOLHeader.Count;
                TotalSkids += "No. of Skids";
                TotalBoxes += "No. of Boxes";
                TotalTubes += "No. of Tubes";
                TotalPackages += "No. of Packages";
                TotalRolls += "No. of Rolls";
                TotalWeight += "Weight - Total";
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PrintDetail; PrintDetailOption)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Detail';
                        ToolTip = 'Print Detail';
                    }
                }
            }
        }
    }

    var
        BOLCount: Integer;
        TotalSkids: Integer;
        TotalBoxes: Integer;
        TotalTubes: Integer;
        TotalPackages: Integer;
        TotalRolls: Integer;
        TotalWeight: Decimal;
        PrintDetailOption: Boolean;
        FilterString: Text;
}