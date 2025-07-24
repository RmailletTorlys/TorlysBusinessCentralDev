page 55001 "Freight Zone List"
{
    Caption = 'Freight Zones';
    Editable = false;
    PageType = List;
    QueryCategory = 'Freight Zone List';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Torlys Freight Zones";
    SourceTableView = SORTING(Code) ORDER(Ascending);
    CardPageId = "Freight Zone Card";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'Code of the freight zone.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description of the freight zone.';
                }
                field(StartDate; Rec."Start Date")
                {
                    ApplicationArea = All;
                    Caption = 'Start Date';
                    ToolTip = 'Start date of the freight zone.';
                }
                field(EndDate; Rec."End Date")
                {
                    ApplicationArea = All;
                    Caption = 'End Date';
                    ToolTip = 'End date of the freight zone.';
                }
                field(RatePerSqftFlooring; Rec."Rate per sqft (floor)")
                {
                    ApplicationArea = All;
                    Caption = 'Rate per sqft (floor)';
                    ToolTip = 'Rate per sqft (floor).';
                }
                field(MinimumCharge; Rec."Minimum Charge")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Charge';
                    ToolTip = 'Minimum Charge.';
                }
                field(RatePerRollUnderlay; Rec."Rate per Roll (underlay)")
                {
                    ApplicationArea = All;
                    Caption = 'Rate per Roll (underlay)';
                    ToolTip = 'Rate per Roll (underlay).';
                }
                field(RatePerCaseSheetUnderlay; Rec."Rate per Case (sheet underlay)")
                {
                    ApplicationArea = All;
                    Caption = 'Rate per Case (sheet underlay)';
                    ToolTip = 'Rate per Case (sheet underlay).';
                }
                field(MinimumChargeMoulding; Rec."Minimum Charge (moulding)")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Charge (moulding)';
                    ToolTip = 'Minimum Charge (moulding).';
                }
                field(TailgateCharge; Rec."Tailgate Charge")
                {
                    ApplicationArea = All;
                    Caption = 'Tailgate Charge';
                    ToolTip = 'Tailgate Charge.';
                }
                field(ShipsOnMonday; Rec."Ships on - Monday")
                {
                    ApplicationArea = All;
                    Caption = 'Ships on - Monday';
                    ToolTip = 'Ships on - Monday.';
                }
                field(ShipsOnTuesday; Rec."Ships on - Tuesday")
                {
                    ApplicationArea = All;
                    Caption = 'Ships on - Tuesday';
                    ToolTip = 'Ships on - Tuesday.';
                }
                field(ShipsOnWednesday; Rec."Ships on - Wednesday")
                {
                    ApplicationArea = All;
                    Caption = 'Ships on - Wednesday';
                    ToolTip = 'Ships on - Wednesday.';
                }
                field(ShipsOnThursday; Rec."Ships on - Thursday")
                {
                    ApplicationArea = All;
                    Caption = 'Ships on - Thursday';
                    ToolTip = 'Ships on - Thursday.';
                }
                field(ShipsOnFriday; Rec."Ships on - Friday")
                {
                    ApplicationArea = All;
                    Caption = 'Ships on - Friday';
                    ToolTip = 'Ships on - Friday.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }
}