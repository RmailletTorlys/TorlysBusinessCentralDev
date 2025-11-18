query 50003 CustInfoForTorlysDotComV2
{
    Caption = 'CustInforTorlysDotCom';
    QueryType = Normal;

    elements
    {
        dataitem(Ship_to_Address; "Ship-to Address")
        {
            DataItemTableFilter = "Dealer Locator Participant" = filter(true);

            column(Cust_No; "Customer No.")
            {
            }
            column(No; Code)
            {
            }
            column(Name; "Name 2")
            {
            }
            column(Address; Address)
            {
            }
            column(Address_2; "Address 2")
            {
            }
            column(Post_Code; "Post Code")
            {
            }
            column(City; City)
            {
            }
            column(County; County)
            {
            }
            column(Phone_No_; "Phone No.")
            {
            }
            column(website; "Home Page")
            {
            }
            column(Dealer_Locator_Participant; "Dealer Locator Participant")
            {
            }

            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = Ship_to_Address."Customer No.";

                column(Power_Up_Club; "Club")
                {
                }

                column(Power_Up_Level; "Power Up Level")
                {
                }

            }
        }
    }
}