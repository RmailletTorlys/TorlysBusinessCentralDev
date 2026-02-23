page 55199 TlyHolidayCalendarList
{
    Caption = 'Holiday Calendar';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = true;
    SourceTable = TlyHolidayCalendar;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Holiday Date"; Rec."Holiday Date")
                {
                    ApplicationArea = All;
                    Caption = 'Holiday Date';
                    ToolTip = 'Holiday Date';
                }

                field("Holiday Description"; Rec."Holiday Description")
                {
                    ApplicationArea = All;
                    Caption = 'Holiday Description';
                    ToolTip = 'Holiday Description';
                }
                field("Last Work Day"; Rec."Last Work Day")
                {
                    ApplicationArea = All;
                    Caption = 'Last Work Day';
                    ToolTip = 'Last Work Day';
                }
                field("Days until next working day"; Rec."Days until next working day")
                {
                    ApplicationArea = All;
                    Caption = 'Days until next working day';
                    ToolTip = 'Days until next working day';
                }
            }
        }
    }
}
