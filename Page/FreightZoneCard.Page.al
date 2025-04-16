page 55003 "Freight Zone Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Torlys Freight Zones";


    layout
    {
        area(Content)
        {
            group(General)
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
                field(RatePerSqftFlooring; Rec."Rate per sqft (flooring)")
                {
                    ApplicationArea = All;
                    Caption = 'Rate per sqft (flooring)';
                    ToolTip = 'Rate per sqft (flooring).';
                }
                field(MinimumCharge; Rec."Minimum Charge")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Charge';
                    ToolTip = 'Minimum Charge.';
                }
                field(RatePerRollUnderlay; Rec."Rate per Roll(Underlay)")
                {
                    ApplicationArea = All;
                    Caption = 'Rate per Roll(Underlay)';
                    ToolTip = 'Rate per Roll(Underlay).';
                }
                field(RatePerCaseSheetUnderlay; Rec."Rate per Case(Sheet underlay)")
                {
                    ApplicationArea = All;
                    Caption = 'Rate per Case(Sheet underlay)';
                    ToolTip = 'Rate per Case(Sheet underlay).';
                }
                field(MinimumChargeMoulding; Rec."Minimum Charge(Moulding)")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Charge(Moulding)';
                    ToolTip = 'Minimum Charge(Moulding).';
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
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}
