Table 51058 TlyDisplayLine
{
    DataClassification = CustomerContent;
    Caption = 'Display Line';
    DrillDownPageId = "Customer Display Subform";
    LookupPageId = "Customer Display Subform";
    Fields
    {
        field(1; "LineNo."; Integer)
        {
            Caption = 'Line No.';

        }
        field(2; "CustNo."; Code[10])
        {
            Caption = 'Customer No.';

        }
        field(3; "CustLocationCode"; Code[10])
        {
            Caption = 'Customer Location';

        }
        field(4; "Display Type"; Enum TlyDisplayTypes)
        {
            Caption = 'Display Type';
        }
        field(5; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category".Code;
        }
        field(6; "Description"; Text[100])
        {
            Caption = 'Program Description';
        }
        field(7; "Comments"; Text[100])
        {
            Caption = 'Comments';
        }
    }

    Keys
    {
        key(Key1; "LineNo.", "CustNo.", CustLocationCode, "Display Type", "Item Category Code")
        {
            Clustered = true;
        }
    }


    procedure PopulateDescription(DisplayRec: Record TlyDisplayLine)
    var
        ItemCategory: Record "Item Category";
    begin
        Rec := DisplayRec;
        if ItemCategory.Get(DisplayRec."Item Category Code") then
            Rec.Description := ItemCategory.Description;

    end;

    procedure GetNextLineNo(CustNo: Code[10]; LocationCode: Code[10]): Integer
    var
        DisplayLine: Record TlyDisplayLine;
        NextLineNo: Integer;
    begin
        DisplayLine.SetRange("CustNo.", "CustNo");
        DisplayLine.SetRange("CustLocationCode", LocationCode);
        if "DisplayLine".FindLast() then
            NextLineNo := DisplayLine."LineNo.";

        NextLineNo += 10000;
        exit(NextLineNo);
    end;
}