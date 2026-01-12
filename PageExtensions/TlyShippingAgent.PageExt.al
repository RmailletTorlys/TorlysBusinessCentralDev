pageextension 50428 TlyShippingAgents extends "Shipping Agents"
{
    layout
    {
        addafter(Name)
        {
            field("Agent No."; Rec."Agent No.")
            {
                ApplicationArea = All;
                Caption = 'Agent No.';
                ToolTip = 'Agent No.';
            }

            field("Freight Charges"; Rec."Freight Charges")
            {
                ApplicationArea = All;
                Caption = 'Freight Charges';
                ToolTip = 'Freight Charges';
            }
            field("Pro Bill Type"; Rec."Pro Bill Type")
            {
                ApplicationArea = All;
                Caption = 'Pro Bill Type';
                ToolTip = 'Pro Bill Type';
            }
            field("Master Pro Bill"; Rec."Master Pro Bill")
            {
                ApplicationArea = All;
                Caption = 'Master Pro Bill';
                ToolTip = 'Master Pro Bill';
            }
            field("Pickup/Beyond Method"; Rec."Pickup/Beyond Method")
            {
                ApplicationArea = All;
                Caption = 'Pickup/Beyond Method';
                ToolTip = 'Pickup/Beyond Method';
            }
            field("Pickup/Beyond Address 1"; Rec."Pickup/Beyond Address 1")
            {
                ApplicationArea = All;
                Caption = 'Pickup/Beyond Address 1';
                ToolTip = 'Pickup/Beyond Address 1';
            }
            field("Pickup/Beyond Address 2"; Rec."Pickup/Beyond Address 2")
            {
                ApplicationArea = All;
                Caption = 'Pickup/Beyond Address 2';
                ToolTip = 'Pickup/Beyond Address 2';
            }
            field("Pickup/Beyond Address 3"; Rec."Pickup/Beyond Address 3")
            {
                ApplicationArea = All;
                Caption = 'Pickup/Beyond Address 3';
                ToolTip = 'Pickup/Beyond Address 3';
            }
            field("Pickup/Beyond Address 4"; Rec."Pickup/Beyond Address 4")
            {
                ApplicationArea = All;
                Caption = 'Pickup/Beyond Address 4';
                ToolTip = 'Pickup/Beyond Address 4';
            }
            field("Pickup/Beyond Address 5"; Rec."Pickup/Beyond Address 5")
            {
                ApplicationArea = All;
                Caption = 'Pickup/Beyond Address 5';
                ToolTip = 'Pickup/Beyond Address 5';
            }
            field("Pickup/Beyond Address 6"; Rec."Pickup/Beyond Address 6")
            {
                ApplicationArea = All;
                Caption = 'Pickup/Beyond Address 6';
                ToolTip = 'Pickup/Beyond Address 6';
            }
            field("Pickup/Beyond Dest. Instr."; Rec."Pickup/Beyond Dest. Instr.")
            {
                ApplicationArea = All;
                Caption = 'Pickup/Beyond Dest. Instr.';
                ToolTip = 'Pickup/Beyond Dest. Instr.';
            }
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
}