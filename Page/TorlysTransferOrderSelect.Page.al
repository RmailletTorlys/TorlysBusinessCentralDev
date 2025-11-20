page 50556 "TorlysTransferOrderSelect"
{
    Caption = 'Transfer Order Select';
    PageType = List;
    SourceTable = "Transfer Header";
    ApplicationArea = Basic, Suite;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'No.';
                    Caption = 'No.';
                }

                field("Transfer Type"; Rec."Transfer Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Transfer Type';
                    Caption = 'Transfer Type';
                }
                field("Transfer-from Code"; Rec."Transfer-from Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Transfer-from Code';
                    Caption = 'Transfer-from Code';
                }

                field("Transfer-to Code"; Rec."Transfer-to Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Transfer-to Code';
                    Caption = 'Transfer-to Code';
                }

                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Shipment Date';
                    Caption = 'Shipment Date';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Select)
            {
                Caption = 'Select';
                Tooltip = 'Select';
                Image = CheckList;
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
        }
    }
}
