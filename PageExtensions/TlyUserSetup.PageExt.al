pageextension 50119 TlyUserSetup extends "User Setup"
{
    layout
    {
        moveafter("User ID"; "Register Time")

        addafter("Register Time")
        {
            field("Department"; Rec."Department")
            {
                ApplicationArea = All;
                Caption = 'Department';
                ToolTip = 'Department';
                Visible = true;
            }
            field("Default Location Code"; Rec."Default Location Code")
            {
                ApplicationArea = All;
                Caption = 'Default Location Code';
                ToolTip = 'Default Location Code';
                Visible = true;
            }

            field("SO Qty. to Ship Edit"; Rec."SO Qty. to Ship Edit")
            {
                ApplicationArea = All;
                Caption = 'SO Qty. to Ship Edit';
                ToolTip = 'SO Qty. to Ship Edit';
                Visible = true;
            }
        }
        moveafter("SO Qty. to Ship Edit"; "Allow Posting From", "Allow Posting To", "Sales Invoice Posting Policy", "Purch. Invoice Posting Policy")

        modify("Allow Deferral Posting From")
        {
            Visible = false;
        }
        modify("Allow Deferral Posting To")
        {
            Visible = false;
        }
        modify("Sales Resp. Ctr. Filter")
        {
            Visible = false;
        }
        modify("Purchase Resp. Ctr. Filter")
        {
            Visible = false;
        }
        modify("Time Sheet Admin.")
        {
            Visible = false;
        }
        // modify("Sustainability Manager")
        // {
        //     Visible = false;
        // }
        modify(PhoneNo)
        {
            Visible = false;
        }
        modify("Salespers./Purch. Code")
        {
            Visible = false;
        }
    }
}