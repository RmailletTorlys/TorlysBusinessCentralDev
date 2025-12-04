// page 52004 "Lookup Values List"
// {
//     Caption = 'Lookup Values';
//     Editable = true;
//     PageType = List;
//     QueryCategory = 'Lookup Values List';
//     ApplicationArea = All;
//     UsageCategory = Lists;
//     SourceTable = "Torlys Lookup Values";
//     SourceTableView = SORTING(Code) ORDER(Ascending);
//     CardPageId = "Lookup Values Card";


//     layout
//     {
//         area(Content)
//         {
//             repeater(GroupName)
//             {
//                 field(Type; Rec."Type")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Type';
//                     ToolTip = 'Lookup Value Type.';
//                 }

//                 field(Code; Rec."Code")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Code';
//                     ToolTip = 'Lookup Value Code.';
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Description';
//                     ToolTip = 'Lookup Value Description.';
//                 }
//             }
//         }
//     }
// }