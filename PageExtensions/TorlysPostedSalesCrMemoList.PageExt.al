pageextension 50144 TorlysPostedSalesCrMemoList extends "Posted Sales Credit Memos"
{
    layout
    {
        addafter("No.")
        {
            field("Return Order No."; Rec."Return Order No.")
            {
                Caption = 'Return Order No.';
                ToolTip = 'Return Order No.';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }

        }

        moveafter("Return Order No."; "Posting Date", "Sell-to Customer No.", "Ship-to Code", "Sell-to Customer Name")

        addafter("Sell-to Customer Name")
        {
            field("Ship-to Address"; Rec."Ship-to Address")
            {
                Caption = 'Ship-to Address';
                ToolTip = 'Ship-to Address';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Ship-to City"; Rec."Ship-to City")
            {
                Caption = 'Ship-to City';
                ToolTip = 'Ship-to City';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Ship-to County"; Rec."Ship-to County")
            {
                Caption = 'Ship-to County';
                ToolTip = 'Ship-to County';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
        }
        moveafter("Ship-to County"; "Shortcut Dimension 1 Code", "Location Code")

        addafter("Location Code")
        {
            field("External Document No."; Rec."External Document No.")
            {
                Caption = 'External Document No.';
                ToolTip = 'External Document No.';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field(ShortcutDimCode3; ShortcutDimCode[3])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,3';
                ToolTip = 'Global Dimension 3 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = true;

            }
            field("Order Type"; Rec."Order Type")
            {
                Caption = 'Order Type';
                ToolTip = 'Order Type';
                ApplicationArea = All;
                Visible = false;
                Editable = false;
            }
            field("Temporary Hold"; Rec."Temporary Hold")
            {
                Caption = 'Temporary Hold';
                ToolTip = 'Temporary Hold';
                ApplicationArea = All;
                Visible = false;
                Editable = false;
            }
        }

        addafter("Temporary Hold")
        {
            field("Shipping Instructions"; Rec."Shipping Instructions")
            {
                Caption = 'Shipping Instructions';
                ToolTip = 'Shipping Instructions';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }

        }

        moveafter("Shipping Comment"; Amount)

        addafter(Amount)
        {
            field("Created By"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Created At"; Rec."SystemCreatedAt")
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        modify("Posting Date")
        {
            Visible = true;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
        }

        modify("Document Date")
        {
            Visible = false;
        }

        modify("Sell-to Contact")
        {
            Visible = false;
        }

        modify("Due Date")
        {
            Visible = false;
        }

        modify("Ship-to Code")
        {
            Visible = true;
        }

        modify("Currency Code")
        {
            Visible = false;
        }

        modify("Amount Including VAT")
        {
            Visible = false;
        }

        modify("Remaining Amount")
        {
            Visible = false;
        }

        modify("Paid")
        {
            Visible = false;
        }

        modify("Cancelled")
        {
            Visible = false;
        }

        modify("Corrective")
        {
            Visible = false;
        }

        modify("No. Printed")
        {
            Visible = false;
        }
    }

    var
        LookupUserId: Codeunit "TorlysLookupUserID";

    protected var
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

}
