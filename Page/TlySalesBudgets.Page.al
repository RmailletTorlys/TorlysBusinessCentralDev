page 52017 TlySalesBudgets
{
    ApplicationArea = Basic, Suite;
    Caption = 'Sales Budgets';
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = TlySalesBudgets;
    SourceTableView = sorting("Line No.") order(Ascending);
    UsageCategory = Administration;
    // InsertAllowed = false;
    // ModifyAllowed = false;
    // DeleteAllowed = false;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Caption = 'Line No.';
                    ToolTip = 'Line No.';
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Customer No.';
                    ToolTip = 'Customer No.';
                }

                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Bill-to Customer No.';
                    ToolTip = 'Bill-to Customer No.';
                }

                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    Caption = 'Salesperson Code';
                    ToolTip = 'Salesperson Code';
                }
                field("Region"; Rec."Region")
                {
                    ApplicationArea = All;
                    Caption = 'Region';
                    ToolTip = 'Region';
                }
                field("Club"; Rec."Club")
                {
                    ApplicationArea = All;
                    Caption = 'Club';
                    ToolTip = 'Club';
                }
                // field("Buying Group"; Rec."Buying Group")
                // {
                // ApplicationArea = All;
                //                 Caption = 'Buying Group';
                //                 ToolTip = 'Buying Group';
                // }
                field("Channel"; Rec."Channel")
                {
                    ApplicationArea = All;
                    Caption = 'Channel';
                    ToolTip = 'Channel';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'Gen. Prod. Posting Group';
                    ToolTip = 'Gen. Prod. Posting Group';
                }

                field("National PM"; Rec."National PM")
                {
                    ApplicationArea = All;
                    Caption = 'National PM';
                    ToolTip = 'National PM';
                }

                field("National PM Brand"; Rec."National PM Brand")
                {
                    ApplicationArea = All;
                    Caption = 'National PM Brand';
                    ToolTip = 'National PM Brand';
                    TableRelation = TlyNationalPMBrand;
                }

                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Caption = 'Starting Date';
                    ToolTip = 'Starting Date';
                }

                field("Budget - Sales $"; Rec."Budget - Sales $")
                {
                    ApplicationArea = All;
                    Caption = 'Budget - Sales $';
                    ToolTip = 'Budget - Sales $';
                }

                field("Budget - Margin $"; Rec."Budget - Margin $")
                {
                    ApplicationArea = All;
                    Caption = 'Budget - Margin $';
                    ToolTip = 'Budget - Margin $';
                }
                field("Budget - Margin %"; Rec."Budget - Margin %")
                {
                    ApplicationArea = All;
                    Caption = 'Budget - Margin %';
                    ToolTip = 'Budget - Margin %';
                }
            }
        }
    }
}