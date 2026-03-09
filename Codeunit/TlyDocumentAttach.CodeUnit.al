
codeunit 51100 TlyDocumentAttach
{
    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', true, true)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
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
                    DocumentAttachment.Validate("Document Type", "Attachment Document Type"::"Booking Info");
                end;
            Database::"TPS CMG Container Header":
                begin
                    FieldRef := RecRef.Field(1);
                    DocumentNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", DocumentNo);
                    DocumentAttachment.Validate("Document Type", "Attachment Document Type"::"TPS Container");
                end;
        end;
    end;
}