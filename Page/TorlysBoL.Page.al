page 55005 "Torlys BOL"
{
    AdditionalSearchTerms = 'Bill of Lading, BOL, BoL';
    Caption = 'Bill of Lading';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Torlys BOL Header";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
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

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the number of the customer.';
                    Caption = 'Customer No.';
                }

                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code of the ship-to address.';
                    Caption = 'Ship-to Code';

                    trigger OnAfterLookup(Selected: RecordRef)
                    begin
                        OnAfterLookupOnSetShipToInfo(Selected);
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

            group(Shipping)
            {
                Caption = 'Shipping';

                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the location.';
                    Caption = 'Location Code';
                }

                field("Pickup Date"; Rec."Pickup Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date of the pickup.';
                    Caption = 'Pickup Date';
                }

                field("Carrier Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the Carrier agent.';
                    Caption = 'Carrier Agent Code';
                }

                field("Carrier Tracking No."; Rec."Carrier Tracking No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the tracking number of the carrier.';
                    Caption = 'Carrier Tracking No.';
                }

                field("Whse Associate Loaded By"; Rec."Warehouse Associate Loaded by")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the warehouse associate who loaded the bill of lading.';
                    Caption = 'Whse Associate Loaded By';
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
                ApplicationArea = All;
                Editable = true;
                Enabled = true;
                SubPageLink = "BOL No." = field("No.");
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(AddBoLLines)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Add BoL Lines';
                Caption = 'Add BoL Lines';
                Image = Document;

                trigger OnAction()
                begin
                    GetShipments();
                end;
            }
        }
    }

    local procedure OnAfterLookupOnSetShipToInfo(Selected: RecordRef)
    var
        ShipTo: Record "Ship-to Address";
        IsHandled: Boolean;

    begin
        OnBeforeOnAfterLookupOnSetShipToInfo(Selected, IsHandled);
        if IsHandled then
            exit;

        if Rec."Ship-to Code" = '' then begin
            Rec."Ship-to Name" := '';
            Rec."Ship-to Address" := '';
            Rec."Ship-to Address 2" := '';
            Rec."Ship-to City" := '';
            Rec."Ship-to Post Code" := '';
            exit;
        end;

        ShipTo.Reset();
        ShipTo.SetRange("Customer No.", Rec."Customer No.");
        ShipTo.SetRange(Code, Rec."Ship-to Code");


        if ShipTo.FindFirst() then begin
            Rec."Ship-to Name" := ShipTo."Name";
            Rec."Ship-to Address" := ShipTo."Address";
            Rec."Ship-to Address 2" := ShipTo."Address 2";
            Rec."Ship-to City" := ShipTo."City";
            Rec."Ship-to Post Code" := ShipTo."Post Code";
        end else
            Message('No ship-to address found for the selected Ship-to Code. Please verify and try again');

        OnAfterOnAfterLookupOnSetShipToInfo(Selected);

    end;

    internal procedure GetShipments()
    var
        PostedShipments: Record "Sales Shipment Header";
        PostedShipmentLines: Record "Sales Shipment Line";
        BoLLines: Record "Torlys BOL Line";
        UpdateBoL: Codeunit UpdateBillOfLadingOnShipHeader;
        IsHandled: Boolean;
        CurrentLine: Integer;
    begin
        OnBeforeFindBoLEntries(IsHandled);
        if IsHandled then
            exit;

        PostedShipments.Reset();
        PostedShipmentLines.Reset();

        if BoLLines.FindLast() then
            CurrentLine := BoLLines."BOL Line No.";

        PostedShipments.SetCurrentKey("Shipping Agent Code", "Shipment Date", "BoL No.");
        PostedShipments.SetRange("Location Code", Rec."Location Code");
        PostedShipments.SetRange("Shipping Agent Code", Rec."Shipping Agent Code");
        PostedShipments.SetRange("Shipment Date", Rec."Pickup Date");

        if Rec."Customer No." <> '' then begin
            PostedShipments.SetRange("BoL No.", '');
            PostedShipments.SetRange("Sell-to Customer No.", Rec."Customer No.");
            PostedShipments.SetRange("Ship-to Code", Rec."Ship-to Code");
        end;



        if PostedShipments.IsEmpty then begin
            Message('No Shipments were found. Please verify the information in the Bill of Lading and try again.');
            exit;
        end;



        if PostedShipments.FindSet() then
            repeat

                BoLLines.Init();
                BoLLines."BOL Line No." := CurrentLine;
                BoLLines."BOL No." := Rec."No.";
                BoLLines."Order No." := PostedShipments."Order No.";
                BoLLines."Shipment No." := PostedShipments."No.";
                BoLLines."Shipment Date" := PostedShipments."Shipment Date";
                BoLLines."Customer No." := PostedShipments."Sell-to Customer No.";
                BoLLines."Ship-to Code" := PostedShipments."Ship-to Code";
                BoLLines."Ship-to Name" := PostedShipments."Ship-to Name";
                BoLLines."Ship-to Address" := PostedShipments."Ship-to Address";
                BoLLines."Ship-to Address 2" := PostedShipments."Ship-to Address 2";
                BoLLines."Ship-to City" := PostedShipments."Ship-to City";
                BoLLines."Ship-to Post Code" := PostedShipments."Ship-to Post Code";
                BoLLines."Ship-to County" := PostedShipments."Ship-to County";
                BoLLines."Ship-to Country/Region Code" := PostedShipments."Ship-to Country/Region Code";
                BoLLines."Shipping Agent Code" := Rec."Shipping Agent Code";
                BoLLines."Total Cases" := 0;
                BoLLines."Total Weight" := 0;
                BoLLines."Total Pallet" := 0;
                BoLLines."Destination Instruction 1" := Rec."Destination Instructions 1";
                BoLLines."Destination Instruction 2" := Rec."Destination Instructions 2";




                PostedShipmentLines.CalcSums("Qty. to Ship Case");
                BoLLines."Total Cases" := PostedShipmentLines."Qty. to Ship Case";

                PostedShipmentLines.CalcSums("Qty. to Ship Pallet");
                BoLLines."Total Pallet" := PostedShipmentLines."Qty. to Ship Pallet";

                PostedShipmentLines.CalcSums("Net Weight");
                BoLLines."Total Weight" := PostedShipmentLines."Net Weight";



                UpdateBoL.UpdateBolNumber(PostedShipments."No.", BoLLines."BOL No.");


                BoLLines.Insert();

                CurrentLine += 10000;
            until PostedShipments.Next() = 0;



        OnAfterFindBoLEntries();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnAfterLookupOnSetShipToInfo(Selected: RecordRef; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOnAfterLookupOnSetShipToInfo(Selected: RecordRef)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeFindBoLEntries(var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterFindBoLEntries()
    begin
    end;
}
