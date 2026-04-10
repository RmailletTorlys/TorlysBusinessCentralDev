// page 50566 TlyCheckPriceAndAvailability
// {
//     Caption = 'Check Price and Availability';
//     PageType = Document;
//     SourceTable = "Item";
//     ApplicationArea = Basic, Suite;
//     UsageCategory = Administration;
//     Editable = false;

//     layout
//     {
//         area(Content)
//         {
//             field("No."; Rec."No.")
//             {
//                 ApplicationArea = All;
//                 Caption = 'No.';
//                 ToolTip = 'No.';
//                 Editable = false;
//             }
//             field("Description"; Rec."Description")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Description';
//                 ToolTip = 'Description';
//                 Editable = false;
//             }
//             part(TlyItemAvailabilitySubform; TlyItemAvailabilitySubform)
//             {
//                 ApplicationArea = All;
//                 Editable = false;
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     begin
//         Rec.SetRange(Rec."No.");
//         CurrPage.TlyItemAvailabilitySubform.Page.SetItemNo(Rec);
//     end;
// }