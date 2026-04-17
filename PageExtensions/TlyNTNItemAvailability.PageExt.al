pageextension 51669 TlyNTNItemAvailability extends "NTN Item Availability"
{
    layout
    {
        modify("Web Inventory")
        {
            Caption = 'Currently Available'
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