table 55199 TlyHolidayCalendar
{
    DrillDownPageID = TlyHolidayCalendarList;
    LookupPageID = TlyHolidayCalendarList;
    DataClassification = CustomerContent;
    Caption = 'Holiday calendar for pre-printing';

    fields
    {
        field(1; "Last Work Day"; Date)
        {
            Caption = 'Last Work Day';
            DataClassification = CustomerContent;
        }
        field(2; "Holiday Description"; Text[30])
        {
            Caption = 'Holiday Description';
            DataClassification = CustomerContent;
        }
        field(3; "Days until next working day"; Integer)
        {
            Caption = 'Days until next working day';
            DataClassification = CustomerContent;
        }
    }
}