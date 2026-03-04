// pageextension 59741 TlyTPSCMGContanierLineSubform extends "TPS CMG Contanier Line Subform"
// {
//     layout
//     {
//         moveafter("Document No."; "Document Line No.", "Item No", "Item Description", "Unit of Measure Code", Quantity)

//         addafter(Quantity)
//         {
//             field("Expected Receipt Date"; Rec."Expected Receipt Date")
//             {
//                 Caption = 'Expected Receipt Date';
//                 ToolTip = 'Expected Receipt Date';
//                 ApplicationArea = All;
//                 Editable = true;
//             }
//         }

//         modify("Variant Code")
//         {
//             Visible = false;
//         }
//     }
// }