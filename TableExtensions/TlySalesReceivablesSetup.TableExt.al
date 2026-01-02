tableextension 50459 TlySalesReceivablesSetup extends "Sales & Receivables Setup"
{
    fields
    {
        field(50001; "Bill of Lading Nos."; Code[20])
        {
            Caption = 'Bill of Lading Nos.';
            TableRelation = "No. Series";
            ToolTip = 'Specifies the code for the number series that will be used to assign numbers to Bills of Lading.';
        }

        field(50002; "Claims Tracking Nos."; Code[20])
        {
            Caption = 'Claims Tracking Nos.';
            TableRelation = "No. Series";
            ToolTip = 'Specifies the code for the number series that will be used to assign numbers to Claims Tracking.';
        }

        field(50003; "Restocking G/L Acc. No."; Code[20])
        {
            Caption = 'Restocking G/L Acc. No.';
            TableRelation = "G/L Account";
            ToolTip = 'Restocking G/L Acc. No.';
        }
    }
}