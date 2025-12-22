tableextension 50459 "Torlys Sales Receivables Setup" extends "Sales & Receivables Setup"
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
    }
}