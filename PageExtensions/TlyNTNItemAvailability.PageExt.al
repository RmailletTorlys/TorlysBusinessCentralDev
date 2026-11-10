pageextension 51669 TlyNTNItemAvailability extends "NTN Item Availability"
{
    layout
    {

        addafter("Web Inventory")
        {
            field("Bucket 1 Date"; Rec."Bucket1v2Date1")
            {
                Caption = 'Bucket 1 Date';
                ToolTip = 'Bucket 1 Date';
                ApplicationArea = All;
            }

            field("Bucket 1 Qty"; Rec."Bucket1v2Qty")
            {
                Caption = 'Bucket 1 Qty';
                ToolTip = 'Bucket 1 Qty';
                ApplicationArea = All;
            }

            field("Bucket 2 Date"; Rec."Bucket2v2Date1")
            {
                Caption = 'Bucket 2 Date';
                ToolTip = 'Bucket 2 Date';
                ApplicationArea = All;
            }

            field("Bucket 2 Qty"; Rec."Bucket2v2Qty")
            {
                Caption = 'Bucket 2 Qty';
                ToolTip = 'Bucket 2 Qty';
                ApplicationArea = All;
            }

            field("Bucket 3 Date"; Rec."Bucket3v2Date1")
            {
                Caption = 'Bucket 3 Date';
                ToolTip = 'Bucket 3 Date';
                ApplicationArea = All;
            }

            field("Bucket 3 Qty"; Rec."Bucket3v2Qty")
            {
                Caption = 'Bucket 3 Qty';
                ToolTip = 'Bucket 3 Qty';
                ApplicationArea = All;
            }

            field("Bucket 4 Date"; Rec."Bucket4v2Date1")
            {
                Caption = 'Bucket 4 Date';
                ToolTip = 'Bucket 4 Date';
                ApplicationArea = All;
            }

            field("Bucket 4 Qty"; Rec."Bucket4v2Qty")
            {
                Caption = 'Bucket 4 Qty';
                ToolTip = 'Bucket 4 Qty';
                ApplicationArea = All;
            }
        }

        modify("Web Inventory")
        {
            Caption = 'Currently Available';
        }

        // modify("Web Inventory Bucket 1")
        // {
        //     Caption = 'Avail. to ship in 1-7 days'
        // }

        // modify("Web Inventory Bucket 2")
        // {
        //     Caption = 'Avail. to ship in 8-14 days'
        // }

        // modify("Web Inventory Bucket 3")
        // {
        //     Caption = 'Avail. to ship in 15-21 days'
        // }

        // modify("Web Inventory Bucket 4")
        // {
        //     Caption = 'Avail. to ship in 16-28 days'
        // }

        // modify("Web Inventory Bucket 5")
        // {
        //     Caption = 'Avail. to ship in 29-35 days'
        // }

        modify("Variant No.")
        {
            Visible = false;
        }

        modify("Web Inventory Status")
        {
            Visible = false;
        }

        modify("Show Actual Inventory on Web")
        {
            Visible = false;
        }

        modify("Inventory Threshold")
        {
            Visible = false;
        }

        modify("Last Troubleshooting Date")
        {
            Visible = false;
        }

        modify("Last Troubleshooting Time")
        {
            Visible = false;
        }

        modify("Last Validated Date")
        {
            Visible = false;
        }

        modify("Last Validated Time")
        {
            Visible = false;
        }

        modify("Last Validated Inventory")
        {
            Visible = false;
        }

        modify("Last Validated Invent. Status")
        {
            Visible = false;
        }

        modify("Last Validation Status")
        {
            Visible = false;
        }

        modify("Last Validation Message")
        {
            Visible = false;
        }

        modify("NTN NAV Created Date")
        {
            Visible = false;
        }

        modify("NTN NAV Modified Date")
        {
            Visible = false;
        }

        // modify("NAV Previously Modified Date")
        // {
        //     Visible = false;
        // }

        // modify("NAV Modified By")
        // {
        //     Visible = false;
        // }
    }
}