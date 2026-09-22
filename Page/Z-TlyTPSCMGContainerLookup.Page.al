// page 55141 TlyTPSCMGContainerLookup
// {
//     Caption = 'TPC CMG Container Lookup';
//     CardPageId = "TPS CMG Container Document";
//     Editable = false;
//     PageType = List;
//     // ApplicationArea = All;
//     // UsageCategory = Lists;
//     InsertAllowed = true;
//     // DeleteAllowed = false;
//     // ModifyAllowed = false;
//     SourceTable = "TPS CMG Container Header";

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {

//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'No.';
//                     ToolTip = 'No.';
//                 }

//                 field("Description"; Rec."Description")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Description';
//                     ToolTip = 'Description';
//                 }

//                 field("Vendor No."; Rec."Vendor No.")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Vendor No.';
//                     ToolTip = 'Vendor No.';
//                 }

//                 field("Status"; Rec."Status")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Status';
//                     ToolTip = 'Status';
//                 }
//             }
//         }
//     }
// }