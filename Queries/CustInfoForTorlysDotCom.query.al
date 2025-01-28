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
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
