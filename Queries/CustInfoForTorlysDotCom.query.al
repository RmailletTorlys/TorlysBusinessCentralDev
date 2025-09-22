query 50002 CustInfoForTorlysDotCom
{
    Caption = 'CustInforTorlysDotCom';
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
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
            column(Power_Up; "Club")
            {
            }
            column(Power_Up_Level; "Power Up Level")
            {
            }
            column(Phone_No_; "Phone No.")
            {
            }
            column(website; Website)
            {
            }
            column(Add_to_Dealer_Finder; "Add to Dealer Finder")
            {
            }

        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
