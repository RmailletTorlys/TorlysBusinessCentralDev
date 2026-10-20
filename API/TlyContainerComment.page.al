page 50745 "tlyContainerComment"
{
    PageType = API;
    Caption = 'Container Comment';
    APIPublisher = 'torlys';
    APIGroup = 'integrations';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'containerComment';
    EntitySetName = 'containerComments';
    SourceTable = "TPS CMG Tracking Information";
    DelayedInsert = true;
    ODataKeyFields = "SystemId";
    Editable = true;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field(Id; Rec.SystemId) { Caption = 'Id'; Editable = false; }
                field(type; Rec.Type) { }
                field(lineNo; Rec."Line No.") { Editable = false; }
                field(containerNo; Rec."Container No.") { }
                field(date; Rec."Date") { }
                field(commentField; Rec."Comment Field") { }
                field(comment; Rec.Comment) { }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        TrackingInfo: Record "TPS CMG Tracking Information";
    begin
        if Rec."Line No." = 0 then begin
            TrackingInfo.LockTable();
            TrackingInfo.SetRange(Type, Rec.Type);
            TrackingInfo.SetRange("Container No.", Rec."Container No.");
            if TrackingInfo.FindLast() then
                Rec."Line No." := TrackingInfo."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Comment;
    end;
}