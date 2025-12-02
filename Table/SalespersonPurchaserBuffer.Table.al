// table 50556 "Salesperson Purchaser Buffer"
// {
//     Caption = 'Salesperson Purchaser Buffer';
//     LookupPageID = "Warehouse Assignment";
//     ReplicateData = false;
//     DataClassification = CustomerContent;
//     TableType = Temporary;

//     fields
//     {
//         field(1; "Code"; Code[20])
//         {
//             Caption = 'Code';
//             DataClassification = SystemMetadata;
//             ToolTip = 'Code';

//         }
//         field(2; "Name"; Text[50])
//         {
//             Caption = 'Name';
//             ToolTip = 'Name';
//             DataClassification = SystemMetadata;
//         }
//     }

//     keys
//     {
//         key(Key1; "Code")
//         {
//             Clustered = true;
//         }
//     }
// }