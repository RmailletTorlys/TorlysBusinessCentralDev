report 50016 "Bill Of Lading List"
{
    Caption = 'Bill Of Lading List';
    PreviewMode = PrintLayout;
    WordMergeDataItem = "Shipping Agent";
    RDLCLayout = './Sales/Reports/BillOfLadingList.rdl';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Shipping Agent"; "Shipping Agent")
        {
            DataItemTableView = sorting(Code);
            RequestFilterFields = Code;

            column(Code; Code)
            {

            }
            column(Name; Name)
            {

            }

            dataitem("Torlys BOL Header"; "Torlys BOL Header")
            {
                DataItemTableView = sorting("No.");
                DataItemLinkReference = "Shipping Agent";
                DataItemLink = "Shipping Agent Code" = field(code);

                column(No_; "No.")
                {

                }
                column(Ship_to_Post_Code; "Ship-to Post Code")
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
                column(Shipping_Comment; "Shipping Comment")
                {

                }
                column(Cases___Total; "Cases - Total")
                {

                }
                column(Weight___Total; "Weight - Total")
                {

                }

                dataitem("Torlys BOL Line"; "Torlys BOL Line")
                {
                    DataItemTableView = sorting("BOL No.", "BOL Line No.");
                    DataItemLinkReference = "Torlys BOL Header";
                    DataItemLink = "Bol No." = field("No.");
                }
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo(Code);
            end;
        }
    }
    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
}
