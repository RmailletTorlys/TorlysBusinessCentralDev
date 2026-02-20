table 55199 TlyHolidayCalendar
{
    DrillDownPageID = TlyHolidayCalendarList;
    LookupPageID = TlyHolidayCalendarList;
    DataClassification = CustomerContent;
    Caption = 'Holiday Calendar';

    fields
    {
        field(1; "Holiday Date"; Date)
        {
            Caption = 'Holiday Date';
            DataClassification = CustomerContent;
        }
        field(2; "Holiday Description"; Text[30])
        {
            Caption = 'Holiday Description';
            DataClassification = CustomerContent;
        }
        field(3; "Last Work Day"; Date)
        {
            Caption = 'Last Work Day';
            DataClassification = CustomerContent;
        }

        field(4; "Days until next working day"; Integer)
        {
            Caption = 'Days until next working day';
            DataClassification = CustomerContent;
        }
    }

    Keys
    {
        key(PK; "Holiday Date")
        {
            Clustered = true;
        }
    }
}