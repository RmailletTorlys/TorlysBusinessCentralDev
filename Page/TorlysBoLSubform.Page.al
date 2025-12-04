page 51004 "Torlys BOL Subform"
{
    AutoSplitKey = true;
    Caption = 'Bill of Lading Subform';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Torlys BOL Line";
    DeleteAllowed = true;
    ModifyAllowed = false;
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
                    Editable = false;
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the second line of the address of the ship-to address.';
                    Caption = 'Ship-to Address 2';
                    Editable = false;
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
                    Caption = 'Ship-to State';
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
                field("Shipping Comment"; Rec."Shipping Comment")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the first line of the shipping comment.';
                    Caption = 'Shipping Comment';
                    Editable = false;
                }
                // field("Ship-to Comment 2"; Rec."Destination Instruction 2")
                // {
                //     ApplicationArea = Basic, Suite;
                //     ToolTip = 'Specifies the second line of the comment for the ship-to address.';
                //     Caption = 'Ship-to Comment 2';
                // }
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
}