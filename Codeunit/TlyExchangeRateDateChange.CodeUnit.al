codeunit 50100 "ExchRateDateHandler"
{
    [EventSubscriber(ObjectType::Table, Database::"Data Exch. Field", 'OnBeforeInsertEvent', '', false, false)]
    local procedure ChangeDateOnInsert(var Rec: Record "Data Exch. Field"; RunTrigger: Boolean)
    begin
        // Target Field ID 3000 isStarting Date in Currency Exchange Rates
        if Rec."Column No." = 30000 then begin
            // overwrite whatever the bank sent with the Today's Date
            // 9 is the standard format: YYYY-MM-DD
            Rec.Value := Format(Today(), 0, 9);
        end;
    end;
}
