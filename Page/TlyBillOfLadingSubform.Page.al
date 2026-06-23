page 51004 TlyBillOfLadingSubform
{
    AutoSplitKey = true;
    Caption = 'Bill of Lading Subform';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    // UsageCategory = Lists;
    PageType = ListPart;
    SourceTable = TlyBillOfLadingLine;
    // Editable = false;
    DeleteAllowed = true;
    // ModifyAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("BOL No."; Rec."BOL No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the bill of lading.';
                    Caption = 'BOL No.';
                    Editable = false;
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the order that is being shipped.';
                    Caption = 'Order No.';
                    Editable = false;
                }
                field("Shipment No."; Rec."Shipment No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the shipment that is being shipped.';
                    Caption = 'Shipment No.';
                    Editable = false;
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date of the shipment.';
                    Caption = 'Shipment Date';
                    Editable = false;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated customer';
                    Editable = false;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated ship-to code';
                    Editable = false;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated ship-to name';
                    Editable = false;
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated ship-to address';
                    // Editable = false;
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the second line of the address of the ship-to address.';
                    Caption = 'Ship-to Address 2';
                    // Editable = false;
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'The associated ship-to city';
                    Editable = false;
                }
                field("Ship-to County"; Rec."Ship-to County")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the state of the ship-to address.';
                    Caption = 'Ship-to County';
                    Editable = false;
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the Post Code of the ship-to address.';
                    Caption = 'Ship-to Post Code';
                    Editable = false;
                }
                field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the country of the ship-to address.';
                    Caption = 'Ship-to Country';
                    Editable = false;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'External Document No.';
                    Caption = 'External Document No.';
                    Editable = false;
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Shipping Agent Code';
                    Caption = 'Shipping Agent Code';
                    Editable = false;
                }
                field("Freight Charges"; Rec."Freight Charges")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Freight Charges';
                    Caption = 'Freight Charges';
                    Editable = false;
                }
                field("Shipping Comment"; Rec."Shipping Comment")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the first line of the shipping comment.';
                    Caption = 'Shipping Comment';
                    Editable = false;
                }

                field("Total Weight"; Rec."Total Weight")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total weight of the shipment.';
                    Caption = 'Total Weight';
                    Editable = false;
                }
                field("Total Cases"; Rec."Total Cases")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total number of cases in the shipment.';
                    Caption = 'Total Cases';
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(Fun)
            {
                Caption = 'Page';

                action(EditInExcel)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Edit in Excel';
                    Image = Excel;
                    // Visible = IsSaaSExcelAddinEnabled;
                    ToolTip = 'Send the data in the sub page to an Excel file for analysis or editing';
                    AccessByPermission = System "Allow Action Export To Excel" = X;

                    trigger OnAction()
                    var
                        EditinExcel: Codeunit "Edit in Excel";
                        EditinExcelFilters: Codeunit "Edit in Excel Filters";
                    begin
                        EditinExcelFilters.AddFieldV2('BOL_No', Enum::"Edit in Excel Filter Type"::Equal, Rec."BOL No.", Enum::"Edit in Excel Edm Type"::"Edm.String");

                        EditinExcel.EditPageInExcel(
                            'BOL_Line',
                            page::TlyBillOfLadingSubform,
                            EditinExcelFilters,
                            StrSubstNo(ExcelFileNameTxt, Rec."BOL No."));
                    end;
                }
            }
        }
    }
    var
        ExcelFileNameTxt: Label 'BOL %1 - Lines', Comment = '%1 = document number, ex. 10000';

}