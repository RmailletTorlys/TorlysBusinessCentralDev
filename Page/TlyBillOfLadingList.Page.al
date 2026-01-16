page 51001 TlyBillOfLadingList
{
    ApplicationArea = Basic, Suite, Assembly;
    UsageCategory = Lists;
    Caption = 'Bill of Lading List';
    CardPageId = TlyBillOfLading;
    DataCaptionFields = "No.";
    Editable = false;
    PageType = List;
    SourceTable = TlyBillOfLadingHeader;
    AdditionalSearchTerms = 'Bill of Lading, BOL';

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
                    // trigger onValidate()
                    // begin
                    //     if Rec."Ship-to Code" = '' then
                    //         exit;
                    //     OnGetShipToCode(Rec."Ship-to Code", Rec."Customer No.");
                    // end;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the ship-to address.';
                    Caption = 'Ship-to Name';
                }
                field("Carrier Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the carrier.';
                    Caption = 'Carrier Code';
                }
                field("Package Tracking No."; Rec."Package Tracking No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the tracking number of the carrier.';
                    Caption = 'Package Tracking No.';
                }
                field("Pickup Date"; Rec."Pickup Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date of the pickup.';
                    Caption = 'Pickup Date';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the location.';
                    Caption = 'Location Code';
                }
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
                field("Shipping Comment"; Rec."Shipping Comment")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Shipping Comment';
                    Caption = 'Shipping Comment';
                }
                field("Piece Count"; Rec."Piece Count")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of pieces.';
                    Caption = 'Piece Count';
                }
                field("Total Weight"; Rec."Weight - Total")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total weight.';
                    Caption = 'Total Weight';
                }
                field("Total Cases"; Rec."Cases - Total")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the total number of cases.';
                    Caption = 'Total Cases';
                }
                // field("Total Base Qty"; Rec."Base Quantity - Total")
                // {
                //     ApplicationArea = Basic, Suite;
                //     ToolTip = 'Specifies the total base quantity.';
                //     Caption = 'Total Base Qty';
                // }
            }
        }
    }
    // actions
    // {
    //     area(Processing)
    //     {
    //         action(FindBill)
    //         {
    //             ApplicationArea = Basic, Suite;
    //             ToolTip = 'Find BoL';
    //             Caption = 'Find BoL';
    //             Image = Document;
    //             trigger OnAction()
    //             var
    //                 BillOfLading: Record "Torlys BOL Header";
    //                 BoLListPage: Page "Torlys BOL List";
    //             begin
    //                 BoLListPage.SetTableView(BillOfLading);
    //                 BoLListPage.SetRecord(BillOfLading);
    //                 BoLListPage.LookupMode := true;
    //                 if BoLListPage.RunModal() = Action::LookupOK then begin
    //                     BoLListPage.GetRecord(BillOfLading);
    //                     Rec.Get(BillOfLading."No.");
    //                 end;
    //             end;
    //         }
    //     }
    //     area(navigation)
    //     {
    //         group("&Line")
    //         {
    //             Caption = '&Line';
    //             Image = Line;
    //             action("Show Order")
    //             {
    //                 ApplicationArea = Basic, Suite;
    //                 Caption = 'Show BoL';
    //                 Image = ViewOrder;
    //                 RunObject = Page "Torlys BoL";
    //                 RunPageLink = "No." = field("No.");
    //                 ToolTip = 'View the selected bill of lading.';
    //             }
    //         }
    //     }
    // }

    views
    {
        view(TOR)
        {
            Caption = 'TOR';
            Filters = where("Location Code" = filter('TOR'));
        }
        view(CAL)
        {
            Caption = 'CAL';
            Filters = where("Location Code" = filter('CAL'));
        }
    }

    // procedure OnGetShipToCode(ShipToCode: Code[10]; CustomerNo: Code[10])
    // var
    //     Customer: Record Customer;
    // begin

    //     if CustomerNo = '' then
    //         exit;

    //     if ShipToCode = '' then
    //         ShipToCode := CustomerNo;

    //     Customer.Get(CustomerNo);

    //     Rec."Ship-to Name" := Rec."Ship-to Name";
    //     Rec."Ship-to Address" := Rec."Ship-to Address";
    //     Rec."Ship-to Address 2" := Rec."Ship-to Address 2";
    //     Rec."Ship-to City" := Rec."Ship-to City";
    //     Rec."Ship-to Post Code" := Rec."Ship-to Post Code";
    //     Rec."Ship-to Country/Region Code" := Rec."Ship-to Country/Region Code";
    // end;
}