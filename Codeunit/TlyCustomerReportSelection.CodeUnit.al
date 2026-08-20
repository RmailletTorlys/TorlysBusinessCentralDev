codeunit 50456 TlyCustomerReportSelection
{
    [EventSubscriber(ObjectType::Page, Page::"Customer Report Selections", 'OnValidateUsage2OnCaseElse', '', true, true)]
    local procedure OnValidateUsage2OnCaseElse(var CustomReportSelection: Record "Custom Report Selection"; ReportUsage: Option)
    var
        Usage2: Enum "Custom Report Selection Sales";
    begin
        //this is when you select "Usage2" (a field on the "Customer Report Selections" page only) it populates "Usage" (a field in the "Custom Report Selection" table)
        //the case statement is not working so we just do this one instance since "Processed BOL" is all we use for now
        // case Usage2 of
        // "Custom Report Selection Sales"::Quote:
        //     CustomReportSelection.Usage := "Report Selection Usage"::"S.Quote";
        // "Custom Report Selection Sales"::"Confirmation Order":
        //     CustomReportSelection.Usage := "Report Selection Usage"::"S.Order";
        // "Custom Report Selection Sales"::Invoice:
        //     CustomReportSelection.Usage := "Report Selection Usage"::"S.Invoice";
        // "Custom Report Selection Sales"::"Credit Memo":
        //     CustomReportSelection.Usage := "Report Selection Usage"::"S.Cr.Memo";
        // "Custom Report Selection Sales"::"Customer Statement":
        //     CustomReportSelection.Usage := "Report Selection Usage"::"C.Statement";
        // "Custom Report Selection Sales"::"Job Quote":
        //     CustomReportSelection.Usage := "Report Selection Usage"::JQ;
        // "Custom Report Selection Sales"::Reminder:
        //     CustomReportSelection.Usage := "Report Selection Usage"::Reminder;
        // "Custom Report Selection Sales"::Shipment:
        //     CustomReportSelection.Usage := "Report Selection Usage"::"S.Shipment";
        // "Custom Report Selection Sales"::"Pro Forma Invoice":
        //     CustomReportSelection.Usage := "Report Selection Usage"::"Pro Forma S. Invoice";
        // "Custom Report Selection Sales"::"Processed BOL":
        CustomReportSelection.Usage := "Report Selection Usage"::"Processed BOL";
        // end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Customer Report Selections", 'OnAfterOnMapTableUsageValueToPageValue', '', true, true)]
    local procedure OnAfterOnMapTableUsageValueToPageValue(CustomReportSelection: Record "Custom Report Selection"; var Usage2: Enum "Custom Report Selection Sales")
    begin
        //this is when you open the page it checks what is in "Usage" (a field in the "Custom Report Selection" table) and populates "Usage2" (a field on the "Customer Report Selections" page only)
        case CustomReportSelection.Usage of
            "Report Selection Usage"::"S.Quote":
                Usage2 := "Custom Report Selection Sales"::Quote;
            "Report Selection Usage"::"S.Order":
                Usage2 := "Custom Report Selection Sales"::"Confirmation Order";
            "Report Selection Usage"::"S.Invoice":
                Usage2 := "Custom Report Selection Sales"::Invoice;
            "Report Selection Usage"::"S.Cr.Memo":
                Usage2 := "Custom Report Selection Sales"::"Credit Memo";
            "Report Selection Usage"::"C.Statement":
                Usage2 := "Custom Report Selection Sales"::"Customer Statement";
            "Report Selection Usage"::JQ:
                Usage2 := "Custom Report Selection Sales"::"Job Quote";
            "Report Selection Usage"::Reminder:
                Usage2 := "Custom Report Selection Sales"::Reminder;
            "Report Selection Usage"::"S.Shipment":
                Usage2 := "Custom Report Selection Sales"::Shipment;
            "Report Selection Usage"::"Pro Forma S. Invoice":
                Usage2 := "Custom Report Selection Sales"::"Pro Forma Invoice";
            "Report Selection Usage"::"Processed BOL":
                Usage2 := "Custom Report Selection Sales"::"Processed BOL";
        end;
    end;
}