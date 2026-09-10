// pageextension 50158 TlyItemTurnover extends "Item Turnover"
// {
//     layout
//     {
//         addafter(AmountType)
//         {
//             field("Location Filter"; Rec."Location Filter")
//             {
//                 Caption = 'Location Filter';
//                 ToolTip = 'Location Filter';
//                 ApplicationArea = All;
//                 TableRelation = Location;
//                 trigger OnValidate()
//                 begin
//                     // Rec.SetRange("Location Filter", Rec."Location Filter");
//                     CurrPage.ItemTurnoverLines.PAGE.SetLines(Rec, PeriodType, AmountType);
//                 end;
//             }
//         }
//     }
//     var
//         PeriodType: Enum "Analysis Period Type";
//         AmountType: Enum "Analysis Amount Type";
// }