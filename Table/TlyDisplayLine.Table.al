// Table 51058 TlyDisplayLine
// {
//     DataClassification = CustomerContent;
//     Caption = 'Display Line';
//     DrillDownPageId = "Customer Display Subform";
//     // LookupPageId = "Customer Display Subform";

//     Fields
//     {
//         field(1; "Line No."; Integer)
//         {
//             Caption = 'Line No.';

//         }
//         field(2; "Customer No."; Code[10])
//         {
//             Caption = 'Customer No.';

//         }
//         field(3; "Ship-to Code"; Code[10])
//         {
//             Caption = 'Customer Location';

//         }
//         field(4; "Display Type"; Enum TlyDisplayTypes)
//         {
//             Caption = 'Display Type';
//         }
//         field(5; "Item Category Code"; Code[20])
//         {
//             Caption = 'Item Category Code';
//             TableRelation = "Item Category".Code;
//         }
//         field(6; "Description"; Text[100])
//         {
//             Caption = 'Program Description';
//         }
//         field(7; "Comments"; Text[100])
//         {
//             Caption = 'Comments';
//         }
//     }

//     Keys
//     {
//         key(Key1; "Line No.", "Customer No.", "Ship-to Code", "Display Type", "Item Category Code")
//         {
//             Clustered = true;
//         }
//     }

//     procedure PopulateDescription(DisplayRec: Record TlyDisplayLine)
//     var
//         ItemCategory: Record "Item Category";
//     begin
//         Rec := DisplayRec;
//         if ItemCategory.Get(DisplayRec."Item Category Code") then
//             Rec.Description := ItemCategory.Description;

//     end;

//     procedure GetNextLineNo(CustNo: Code[10]; LocationCode: Code[10]): Integer
//     var
//         DisplayLine: Record TlyDisplayLine;
//         NextLineNo: Integer;
//     begin
//         DisplayLine.SetRange("Customer No.", "CustNo");
//         DisplayLine.SetRange("Ship-to Code", LocationCode);
//         if "DisplayLine".FindLast() then
//             NextLineNo := DisplayLine."Line No.";
//         NextLineNo += 10000;
//         exit(NextLineNo);
//     end;
// }