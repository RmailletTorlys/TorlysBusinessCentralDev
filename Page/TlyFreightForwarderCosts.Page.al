page 55103 TlyFreightForwarderCosts
{
    Caption = 'Freight Forwarder Costs';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;
    SourceTable = TlyFreightForwarderCosts;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor No.';
                    ToolTip = 'Vendor No.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    Caption = 'Currency Code';
                    ToolTip = 'Currency Code';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Caption = 'Location Code';
                    ToolTip = 'Location Code';
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Method Code';
                    ToolTip = 'Shipment Method Code';
                }
                field("Origin Code"; Rec."Origin Code")
                {
                    ApplicationArea = All;
                    Caption = 'Origin Code';
                    ToolTip = 'Origin Code';
                }
                field("Port of Loading"; Rec."Port of Loading")
                {
                    ApplicationArea = All;
                    Caption = 'Port of Loading';
                    ToolTip = 'Port of Loading';
                }
                field("Port of Discharge"; Rec."Port of Discharge")
                {
                    ApplicationArea = All;
                    Caption = 'Port of Discharge';
                    ToolTip = 'Port of Discharge';
                }
                field("Steamship Line"; Rec."Steamship Line")
                {
                    ApplicationArea = All;
                    Caption = 'Steamship Line';
                    ToolTip = 'Steamship Line';
                }
                field("Inland Terminal"; Rec."Inland Terminal")
                {
                    ApplicationArea = All;
                    Caption = 'Inland Terminal';
                    ToolTip = 'Inland Terminal';
                }
                field("Destination Address"; Rec."Destination Address")
                {
                    ApplicationArea = All;
                    Caption = 'Destination Address';
                    ToolTip = 'Destination Address';
                }
                field("Container Type"; Rec."Container Type")
                {
                    ApplicationArea = All;
                    Caption = 'Container Type';
                    ToolTip = 'Container Type';
                }
                field("Transport Method"; Rec."Transport Method")
                {
                    ApplicationArea = All;
                    Caption = 'Transport Method';
                    ToolTip = 'Transport Method';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Starting Date';
                    ToolTip = 'Starting Date';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    Caption = 'Ending Date';
                    ToolTip = 'Ending Date';
                }
                field("Rate"; Rec."Rate")
                {
                    ApplicationArea = All;
                    Caption = 'Rate';
                    ToolTip = 'Rate';
                }
                field("Sales Costing Sheet Rate"; Rec."Sales Costing Sheet Rate")
                {
                    ApplicationArea = All;
                    Caption = 'Sales Costing Sheet Rate';
                    ToolTip = 'Sales Costing Sheet Rate';
                }
                field("Comments"; Rec."Comments")
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    ToolTip = 'Comments';
                }
            }
        }
    }
}
