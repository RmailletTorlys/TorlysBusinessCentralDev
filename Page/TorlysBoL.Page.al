page 55005 "Torlys BOL"
{
    Caption = 'Bill of Lading';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Torlys BOL Header";


    layout
    {
        area(content)
        {
            Group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Caption = 'No.';
                }

                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the type of transaction that is being posted for this bill of lading.';
                    Caption = 'Transaction Type';
                }

                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number series that is used for the No. field on the bill of lading header.';
                    Caption = 'No. Series';
                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Caption = 'Customer No.';
                }

                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the ship-to address.';
                    Caption = 'Ship-to Code';
                }

                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the ship-to address.';
                    Caption = 'Ship-to Name';
                }

                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the address of the ship-to address.';
                    Caption = 'Ship-to Address';
                }

                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the second address line of the ship-to address.';
                    Caption = 'Ship-to Address 2';
                }

                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the city of the ship-to address.';
                    Caption = 'Ship-to City';
                }

                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the post code of the ship-to address.';
                    Caption = 'Ship-to Post Code';
                }
            }

            group(Shipping)
            {
                Caption = 'Shipping';
                field("Shipping Instructions 1"; Rec."Shipping Instructions 1")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the first line of the shipping instructions.';
                    Caption = 'Shipping Instructions 1';
                }

                field("Shipping Instructions 2"; Rec."Shipping Instructions 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the second line of the shipping instructions.';
                    Caption = 'Shipping Instructions 2';
                }
            }

            group(Destination)
            {
                Caption = 'Destination';
                field("Destination Instructions 1"; Rec."Destination Instructions 1")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the first line of the destination instructions.';
                    Caption = 'Destination Instructions 1';
                }

                field("Destination Instructions 2"; Rec."Destination Instructions 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the second line of the destination instructions.';
                    Caption = 'Destination Instructions 2';
                }
            }

            part(BoLLine; "Torlys BOL Subform")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Bill of Lading Lines';
                Editable = true;
                Enabled = true;
                SubPageLink = "BOL No." = field("No.");
                UpdatePropagation = Both;
            }
        }
    }
}
