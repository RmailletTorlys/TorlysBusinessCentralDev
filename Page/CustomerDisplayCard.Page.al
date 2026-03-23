// Page 51024 "Customer Display Card"
// {
//     Caption = 'Customer Display Card';
//     PageType = Card;
//     SourceTable = TlyDisplayHeader;
//     ApplicationArea = All;


//     layout
//     {
//         area(Content)
//         {
//             group(General)
//             {
//                 Caption = 'General';

//                 field("Customer No."; Rec."Customer No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the customer number.';
//                     // trigger onValidate()
//                     // begin
//                     //     Rec.GetDisplayHeaderInfo(Rec);
//                     //     CurrPage.Update(true);
//                     // end;
//                 }
//                 field("Customer Name"; Rec."Customer Name")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the customer name.';
//                 }
//                 field("Customer Location"; Rec."Customer No.")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the customer code.';
//                     TableRelation = "Ship-to Address".Code WHERE("Code" = FILTER('*SHOW'));
//                     // trigger onValidate()
//                     // begin
//                     //     Rec.GetShipToAddressInfo(Rec);
//                     //     CurrPage.Update(true);
//                     // end;
//                 }
//                 field("Customer Address"; Rec.CustAddress)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the customer address.';
//                 }
//                 field("Power Up Member"; Rec.Club)
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the PowerUp ID.';
//                 }

//                 field("Power Up Level"; Rec."Power Up Level")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the PowerUp Level.';
//                 }

//             }
//             group(DisplayLines)
//             {
//                 Caption = 'Display Lines';

//                 part(DisplayLinesPart; "Customer Display Subform")
//                 {
//                     ApplicationArea = All;
//                     UpdatePropagation = Both;
//                     SubPageLink = "Customer No." = field("Customer No."),
//                                   "Ship-to Code" = field("Ship-to Code");
//                 }
//             }
//         }
//     }
// }