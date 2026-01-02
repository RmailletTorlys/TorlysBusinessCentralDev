page 50560 TlyItemAvailability
{
    Caption = 'Item Availability';
    PageType = Document;
    SourceTable = "Item";
    ApplicationArea = Basic, Suite;
    UsageCategory = Administration;
    Editable = false;

    layout
    {
        area(Content)
        {
            // repeater(GroupName)
            // {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'No.';
                ToolTip = 'No.';
                Editable = false;
            }
            field("Description"; Rec."Description")
            {
                ApplicationArea = All;
                Caption = 'Description';
                ToolTip = 'Description';
                Editable = false;
            }
            // }

            part(TorlysItemAvailabilitySubform; TlyItemAvailabilitySubform)
            {
                ApplicationArea = All;
                Editable = false;
                // Enabled = true;
                // SubPageLink = "BOL No." = field("No.");
                // UpdatePropagation = Both;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.SetRange(Rec."No.");
        // UpdateSubForm;
        CurrPage.TorlysItemAvailabilitySubform.Page.SetItemNo(Rec);
    end;
}