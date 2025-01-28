query 50001 ItemInfoForTorlysDotCom
{
    Caption = 'ItemInfoForTorlysDotCom';
    QueryType = Normal;

    elements
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(Description2; "Description 2")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
