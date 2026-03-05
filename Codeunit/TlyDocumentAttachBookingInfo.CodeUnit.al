
codeunit 51100 TlyDocumentAttachBookingInfo
{
    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', true, true)]
    local procedure DocumentAttachment_OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        DocumentNo: Code[20];
    begin
        case RecRef.Number of
            Database::TlyBookingInfo:
                begin
                    FieldRef := RecRef.Field(1);
                    DocumentNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", DocumentNo);
                end;
        end;
    end;
}