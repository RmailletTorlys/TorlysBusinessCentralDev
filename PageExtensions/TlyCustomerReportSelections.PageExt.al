pageextension 59657 TlyCustomerReportSelections extends "Customer Report Selections"
{
    layout
    {
        addbefore(Usage2)
        {
            field("Source No."; Rec."Source No.")
            {
                ApplicationArea = All;
                Caption = 'Source No.';
                ToolTip = 'Source No.';
                Visible = true;
                Editable = false;
            }
            field("Ship-to Code"; Rec."Ship-to Code")
            {
                ApplicationArea = All;
                Caption = 'Ship-to Code';
                ToolTip = 'Ship-to Code';
                Visible = true;
            }
            field("Usage"; Rec."Usage")
            {
                ApplicationArea = All;
                Caption = 'Usage';
                ToolTip = 'Usage';
                Visible = true;
                Editable = false;
            }
        }
        // modify(Usage2)
        // {
        //     trigger OnAfterValidate()
        //     var
        //         Usage2: Enum "Custom Report Selection Sales";
        //     begin
        //         case Usage2 of
        //             "Custom Report Selection Sales"::Quote:
        //                 Rec.Usage := "Report Selection Usage"::"S.Quote";
        //             "Custom Report Selection Sales"::"Confirmation Order":
        //                 Rec.Usage := "Report Selection Usage"::"S.Order";
        //             "Custom Report Selection Sales"::Invoice:
        //                 Rec.Usage := "Report Selection Usage"::"S.Invoice";
        //             "Custom Report Selection Sales"::"Credit Memo":
        //                 Rec.Usage := "Report Selection Usage"::"S.Cr.Memo";
        //             "Custom Report Selection Sales"::"Customer Statement":
        //                 Rec.Usage := "Report Selection Usage"::"C.Statement";
        //             "Custom Report Selection Sales"::"Job Quote":
        //                 Rec.Usage := "Report Selection Usage"::JQ;
        //             "Custom Report Selection Sales"::Reminder:
        //                 Rec.Usage := "Report Selection Usage"::Reminder;
        //             "Custom Report Selection Sales"::Shipment:
        //                 Rec.Usage := "Report Selection Usage"::"S.Shipment";
        //             "Custom Report Selection Sales"::"Pro Forma Invoice":
        //                 Rec.Usage := "Report Selection Usage"::"Pro Forma S. Invoice";
        //             "Custom Report Selection Sales"::"Processed BOL":
        //                 Rec.Usage := "Report Selection Usage"::"Processed BOL";
        //         end;
        //     end;
        // }
    }
}