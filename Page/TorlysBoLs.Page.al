page 55004 "Torlys BOLs"
{
    ApplicationArea = Basic, Suite;
    UsageCategory = Lists;
    Caption = 'Bills of Lading';
    DataCaptionFields = "No.";
    Editable = false;
    PageType = List;
    SourceTable = "Torlys BOL Header";
    AdditionalSearchTerms = 'Bill of Lading, Bill of Lading, BOL, BOLs, Bills of Lading';

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
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

                    trigger onValidate()
                    begin
                        if Rec."Ship-to Code" = '' then
                            exit;
                        OnGetShipToCode(Rec."Ship-to Code", Rec."Customer No.");
                    end;
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
        }
    }
    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Show Order")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Show BoL';
                    Image = ViewOrder;
                    RunObject = Page "Torlys BoL";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'View the selected bill of lading.';
                }
            }
        }
    }


    procedure OnGetShipToCode(ShipToCode: Code[10]; CustomerNo: Code[10])
    var

        Customer: Record Customer;


    begin

        if CustomerNo = '' then
            exit;

        if ShipToCode = '' then
            ShipToCode := CustomerNo;

        Customer.Get(CustomerNo);

        Rec."Ship-to Name" := Rec."Ship-to Name";
        Rec."Ship-to Address" := Rec."Ship-to Address";
        Rec."Ship-to Address 2" := Rec."Ship-to Address 2";
        Rec."Ship-to City" := Rec."Ship-to City";
        Rec."Ship-to Post Code" := Rec."Ship-to Post Code";
        Rec."Ship-to Country/Region Code" := Rec."Ship-to Country/Region Code";
    end;
}