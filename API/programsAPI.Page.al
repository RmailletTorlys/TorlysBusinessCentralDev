page 56002 "Programs API"
{
    PageType = API;
    Caption = 'Programs';
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'program';
    EntitySetName = 'programs';
    SourceTable = "Item Category";
    DelayedInsert = true;
    Editable = false;
    DataAccessIntent = ReadOnly;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(ItemCategory; Rec.Code)
                {
                    Caption = 'Item Category Code';
                }

                field(Description; Rec."Description")
                {
                    Caption = 'Description';
                }

            }
        }
    }

}