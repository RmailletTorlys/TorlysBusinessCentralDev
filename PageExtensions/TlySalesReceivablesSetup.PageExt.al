pageextension 50459 "TlySalesReceivablesSetup" extends "Sales & Receivables Setup"
{
    layout
    {
        moveafter("Disable Search by Name"; "Freight G/L Acc. No.")

        addafter("Freight G/L Acc. No.")
        {
            field("Restocking G/L Acc. No."; Rec."Restocking G/L Acc. No.")
            {
                Caption = 'Restocking G/L Acc. No.';
                ApplicationArea = All;
            }
        }

        addafter("Price List Nos.")
        {
            field("Bill of Lading No."; Rec."Bill of Lading Nos.")
            {
                Caption = 'Bill of Lading Nos.';
                ApplicationArea = All;
            }
            field("Claims Tracking No."; Rec."Claims Tracking Nos.")
            {
                Caption = 'Claims Tracking Nos.';
                ApplicationArea = All;
            }
        }

        modify("Freight G/L Acc. No.")
        {
            visible = true;
        }
    }
}