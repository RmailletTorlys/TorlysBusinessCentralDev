tableextension 50043 TorlysPurchCommentLine extends "Purch. Comment Line"
{
    fields
    {
        field(50001; Type; Code[50])
        {
            Caption = 'Type';
            ToolTip = 'Specifies the type of comment.';
        }

        field(50002; "Comment Code"; Enum "Torlys Comment Type")
        {
            Caption = 'Comment Code';
            DataClassification = CustomerContent;
        }

        field(50003; "Print on Quote"; Boolean)
        {
            Caption = 'Print on Quote';
            DataClassification = CustomerContent;
        }

        field(50004; "Print on Pick Ticket"; Boolean)
        {
            Caption = 'Print on Pick Ticket';
            DataClassification = CustomerContent;
        }

        field(50005; "Print on Order Confirmation"; Boolean)
        {
            Caption = 'Print on Order Confirmation';
            DataClassification = CustomerContent;
        }

        field(50006; "Print on Shipment"; Boolean)
        {
            Caption = 'Print on Shipment';
            DataClassification = CustomerContent;
        }

        field(50007; "Print on Invoice"; Boolean)
        {
            Caption = 'Print on Invoice';
            DataClassification = CustomerContent;
        }

        field(50008; "Print on Credit Memo"; Boolean)
        {
            Caption = 'Print on Credit Memo';
            DataClassification = CustomerContent;
        }

        field(50009; "Print on Return Authorization"; Boolean)
        {
            Caption = 'Print on Return Authorization';
            DataClassification = CustomerContent;
        }

        field(50010; "Print on Return Receipt"; Boolean)
        {
            Caption = 'Print on Return Receipt';
            DataClassification = CustomerContent;
        }
    }
}