// codeunit 52012 TlyGenJnlPostLine
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostBankAccOnAfterCheckLedgEntrySetFilters', '', false, false)]
//     local procedure OnPostBankAccOnAfterCheckLedgEntrySetFilters(var CheckLedgEntry: Record "Check Ledger Entry"; GenJnlLine: Record "Gen. Journal Line")
//     begin
//         if CheckLedgEntry.FindFirst then
//             Error('Cheque %1 already exists for this Bank Account.', CheckLedgEntry."Document No.");
//     end;
// }