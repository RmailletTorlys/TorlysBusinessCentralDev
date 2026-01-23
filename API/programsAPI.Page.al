page 56001 "Programs API"
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

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(code; Rec.Code)
                {
                    Caption = 'Program Code';
                }

                field(description; Rec."Description")
                {
                    Caption = 'Description';
                }

            }
        }
    }

}