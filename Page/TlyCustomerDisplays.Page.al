page 51025 TlyCustomerDisplays
{
    ApplicationArea = Basic, Suite;
    Caption = 'Customer Displays';
    PageType = List;
    RefreshOnActivate = true;
    ShowFilter = false;
    // SourceTable = TlyDisplays;
    SourceTable = TlyCustomerDisplays;
    SourceTableView = sorting("Customer No.", "Ship-to Code", "Item Category Code") order(ascending);
    UsageCategory = Administration;
    DelayedInsert = true;
    LinksAllowed = false;
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(DisplayLines)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number.';
                }

                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer location code.';
                }

                field("Name"; Rec."Name")
                {
                    Caption = 'Name';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Name 2"; Rec."Name 2")
                {
                    Caption = 'Name 2';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Address"; Rec.Address)
                {
                    Caption = 'Address';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Address 2"; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("City"; Rec.City)
                {
                    Caption = 'City';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("County"; Rec.County)
                {
                    Caption = 'County';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }

                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Club"; Rec."Club")
                {
                    Caption = 'Club';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Power Up Level"; Rec."Power Up Level")
                {
                    Caption = 'Power Up Level';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }

                field("Display Type"; Rec."Display Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the display type.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the program number.';
                }
                field("Item Category Description"; Rec."Item Category Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description.';
                }
                field("Comments"; Rec.Comments)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the comments.';
                }
            }
        }
    }
}