page 51002 "Torlys BOL"
{
    AdditionalSearchTerms = 'Bill of Lading, BOL';
    Caption = 'Bill of Lading';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Torlys BOL Header";
    UsageCategory = Documents;
    ApplicationArea = Basic, Suite;
    Permissions = tabledata "Sales Shipment Header" = rm;
    DeleteAllowed = true;
    InsertAllowed = true;

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
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
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
                    Importance = Promoted;
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code of the ship-to address.';
                    Caption = 'Ship-to Code';
                    Importance = Promoted;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the location.';
                    Caption = 'Location Code';
                    Importance = Promoted;
                }
                field("Pickup Date"; Rec."Pickup Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the date of the pickup.';
                    Caption = 'Pickup Date';
                    Importance = Promoted;
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the code of the shipping agent.';
                    Caption = 'Shipping Agent Code';
                    Importance = Promoted;
                }
                field(SystemCreatedBy; LookupUserId.UserId(Rec.SystemCreatedBy))
                {
                    Caption = 'Created By';
                    ToolTip = 'Created By';
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Additional;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'Created Date';
                    ToolTip = 'Created Date';
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Additional;
                }
            }

            group(Shipping)
            {
                Caption = 'Shipping';
                grid(ShippingGrid)
                {
                    group(ShipmentInfo)
                    {
                        ShowCaption = false;

                        field("Ship-to Name"; Rec."Ship-to Name")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the name of the ship-to address.';
                            Caption = 'Ship-to Name';
                            Importance = Additional;
                        }
                        field("Ship-to Address"; Rec."Ship-to Address")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the address of the ship-to address.';
                            Caption = 'Ship-to Address';
                            Importance = Additional;
                        }
                        field("Ship-to Address 2"; Rec."Ship-to Address 2")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the second address line of the ship-to address.';
                            Caption = 'Ship-to Address 2';
                            Importance = Additional;
                        }
                        field("Ship-to City"; Rec."Ship-to City")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the city of the ship-to address.';
                            Caption = 'Ship-to City';
                            Importance = Additional;
                        }
                        field("Ship-to Post Code"; Rec."Ship-to Post Code")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the post code of the ship-to address.';
                            Caption = 'Ship-to Post Code';
                            Importance = Additional;
                        }
                        field("Tracking No."; Rec."Carrier Tracking No.")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the tracking number of the carrier.';
                            Caption = 'Carrier Tracking No.';
                        }
                        field("Loaded By"; Rec."Loaded by")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the warehouse associate who loaded the bill of lading.';
                            Caption = 'Loaded By';
                        }
                        field("Shipping Comment"; Rec."Shipping Comment")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the first line of the shipping comment.';
                            Caption = 'Shipping Comment';
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
                    group("Shipment Contents")
                    {
                        Caption = 'Shipment Contents';
                        field("No. of Skids"; Rec."No. of Skids")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the number of skids in the shipment.';
                            Caption = 'No. of Skids';
                        }
                        field("No. of Boxes"; Rec."No. of Boxes")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the number of boxes in the shipment.';
                            Caption = 'No. of Boxes';
                        }
                        field("No. of Tubes"; Rec."No. of Tubes")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the number of tubes in the shipment.';
                            Caption = 'No. of Tubes';
                        }
                        field("No. of Packages"; Rec."No. of Packages")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the number of packages in the shipment.';
                            Caption = 'No. of Packages';
                        }
                        field("No. of Rolls"; Rec."No. of Rolls")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the number of rolls in the shipment.';
                            Caption = 'No. of Rolls';
                        }
                        field("Piece Count"; Rec."Piece Count")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the number of pieces in the shipment.';
                            Caption = 'Piece Count';
                        }
                    }
                }
            }

            part(BoLLine; "Torlys BOL Subform")
            {
                ApplicationArea = All;
                Enabled = true;
                SubPageLink = "BOL No." = field("No.");
                UpdatePropagation = Both;
                // Editable = false;
            }

            group(WeightsQuantities)
            {
                Caption = 'Weights & Quantities';
                grid(WeightsAndQuantities)
                {
                    group(Weights)
                    {
                        Caption = 'Weights';

                        field("Weight - Flooring"; Rec."Weight - Flooring")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the weight of the flooring in the shipment.';
                            Caption = 'Flooring';
                            Editable = false;
                        }
                        field("Weight - Underlayment Rolls"; Rec."Weight - Underlayment Rolls")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the weight of the underlayment rolls in the shipment.';
                            Caption = 'Underlayment Rolls';
                            Editable = false;
                        }
                        field("Weight - Mouldings"; Rec."Weight - Mouldings")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the weight of the mdlings in the shipment.';
                            Caption = 'Mouldings';
                            Editable = false;
                        }
                        field("Weight - Other"; Rec."Weight - Other")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the weight of other items in the shipment.';
                            Caption = 'Other';
                            Editable = false;
                        }
                        field("Weight - Total"; Rec."Weight - Total")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the total weight of the shipment.';
                            Caption = 'Total';
                            Editable = false;
                        }
                    }

                    group(Quantity)
                    {
                        Caption = 'Quantity(CASE)';

                        field("Cases - Flooring"; Rec."Cases - Flooring")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the quantity of the flooring in the shipment.';
                            Caption = 'Flooring';
                            Editable = false;
                        }
                        field("Cases - Underlayment Rolls"; Rec."Cases - Underlayment Rolls")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the quantity of the underlayment rolls in the shipment.';
                            Caption = 'Underlayment Rolls';
                            Editable = false;
                        }
                        field("Cases - Mouldings"; Rec."Cases - Mouldings")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the quantity of the mdlings in the shipment.';
                            Caption = 'Mouldings';
                            Editable = false;
                        }
                        field("Cases - Other"; Rec."Cases - Other")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the quantity of other items in the shipment.';
                            Caption = 'Other';
                            Editable = false;
                        }
                        field("Cases - Total"; Rec."Cases - Total")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the total quantity of the shipment.';
                            Caption = 'Total';
                            Editable = false;
                        }
                    }

                    group(Quantity2)
                    {
                        Caption = 'Quantity(BASE)';

                        field("Base Quantity - Flooring"; Rec."Base Quantity - Flooring")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the base quantity of the flooring in the shipment.';
                            Caption = 'Flooring';
                            Editable = false;
                        }
                        field("Base Quantity - Underlayment Rolls"; Rec."Base Qty. - Underlayment Rolls")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the base quantity of the Underlayment Rolls in the shipment.';
                            Caption = 'Underlayment Rolls';
                            Editable = false;
                        }
                        field("Base Quantity - Mouldings"; Rec."Base Quantity - Mouldings")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the base quantity of the mdlings in the shipment.';
                            Caption = 'Mouldings';
                            Editable = false;
                        }
                        field("Base Quantity - Other"; Rec."Base Quantity - Other")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the base quantity of other items in the shipment.';
                            Caption = 'Other';
                            Editable = false;
                        }
                        field("Base Quantity - Total"; Rec."Base Quantity - Total")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the total base quantity of the shipment.';
                            Caption = 'Total';
                            Editable = false;
                        }
                    }
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            // actionref("New"; New1)
            // { }
            // actionref("Delete"; Delete1)
            // { }
            actionref("Add Shipments for Pickup Date"; AddShipments)
            { }
            actionref("Print Open BOL"; PrintOpenBOL)
            { }
            actionref("Post BOL"; PostBOL)
            { }
            actionref("Post and Print BOL"; PostAndPrint)
            { }
        }
        area(Navigation)
        {
            action(AddShipments)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Add Shipments for Pickup Date';
                Caption = 'Add Shipments for Pickup Date';
                Image = Document;

                trigger OnAction()
                begin
                    // Rec."Pickup Date" := WorkDate();
                    GetShipments();
                end;
            }
            action(PrintOpenBOL)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Print Open BOL';
                Caption = 'Print Open BOL';
                Image = Print;
                trigger OnAction()
                var
                begin
                    TorlysDocPrint.PrintBillOfLading(Rec);
                end;
            }
            action(PostBOL)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Post BOL';
                Caption = 'Post BOL';
                Image = Document;

                trigger OnAction()
                var
                    ProcessedBOLHeader: Record "Torlys Processed BOL Header";
                    BOLLine: Record "Torlys BOL Line";
                    ProcessedBOLLine: Record "Torlys Processed BOL Line";
                begin
                    ProcessedBOLHeader.TransferFields(Rec);
                    ProcessedBOLHeader.Insert();

                    BOLLine.Reset;
                    BOLLine.SetFilter("BOL No.", Rec."No.");
                    if BOLLine.Find('-') then begin
                        repeat
                            ProcessedBOLLine.TransferFields(BOLLine);
                            ProcessedBOLLine.Insert();
                        until BOLLine.Next = 0;
                    end;

                    Message('%1 has been posted.', Rec."No.");
                    Commit();

                    BOLLine.DeleteAll();
                    Rec.Delete();
                end;
            }
            action(PostAndPrint)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Post and Print BOL';
                Caption = 'Post and Print BOL';
                Image = Print;

                trigger OnAction()
                var
                    ProcessedBOLHeader: Record "Torlys Processed BOL Header";
                    BOLLine: Record "Torlys BOL Line";
                    ProcessedBOLLine: Record "Torlys Processed BOL Line";
                begin
                    ProcessedBOLHeader.TransferFields(Rec);
                    ProcessedBOLHeader.Insert();

                    BOLLine.Reset;
                    BOLLine.SetFilter("BOL No.", Rec."No.");
                    if BOLLine.Find('-') then begin
                        repeat
                            ProcessedBOLLine.TransferFields(BOLLine);
                            ProcessedBOLLine.Insert();
                        until BOLLine.Next = 0;
                    end;

                    Message('%1 has been posted.', Rec."No.");
                    Commit();
                    TorlysDocPrint.PrintBillOfLading(Rec);

                    BOLLine.DeleteAll();
                    Rec.Delete();
                end;
            }
        }
    }

    internal procedure GetShipments()
    var
        PostedShipments: Record "Sales Shipment Header";
        PostedShipmentLines: Record "Sales Shipment Line";
        BoLLines: Record "Torlys BOL Line";
        // UpdateBoL: Codeunit UpdateBillOfLadingOnShipHeader;
        CurrentLocationCode: Code[10];
        CurrentLine: Integer;
        PostedShipmentCases: Integer;
        PostedShipmentPallets: Integer;
        PostedShipmentWeight: Decimal;
        WeightFloor: Decimal;
        WeightUL: Decimal;
        WeightMould: Decimal;
        WeightOther: Decimal;
        CaseFloor: Decimal;
        CaseUL: Decimal;
        CaseMould: Decimal;
        CaseOther: Decimal;
        BaseFloor: Decimal;
        BaseUL: Decimal;
        BaseMould: Decimal;
        BaseOther: Decimal;
        SalesHeader: Record "Sales Header";

    begin
        PostedShipments.Reset();
        PostedShipmentLines.Reset();
        PostedShipmentWeight := 0;
        PostedShipmentCases := 0;
        PostedShipmentPallets := 0;
        WeightFloor := 0;
        WeightUL := 0;
        WeightMould := 0;
        WeightOther := 0;
        CaseFloor := 0;
        CaseUL := 0;
        CaseMould := 0;
        CaseOther := 0;
        BaseFloor := 0;
        BaseUL := 0;
        BaseMould := 0;
        BaseOther := 0;

        BoLLines.Reset();

        if BoLLines.FindLast() then
            CurrentLine := BoLLines."BOL Line No.";

        CurrentLocationCode := FORMAT(Rec."Location Code");

        PostedShipments.SetCurrentKey("Shipping Agent Code", "Shipment Date", "BoL No.");
        PostedShipments.SetRange("Location Code", CurrentLocationCode);
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

                PostedShipmentWeight := 0;
                PostedShipmentCases := 0;
                PostedShipmentPallets := 0;
                PostedShipmentLines.Reset();
                PostedShipmentLines.SetRange("Document No.", PostedShipments."No.");
                PostedShipmentLines.SetRange(Type, Enum::"Sales Line Type"::Item);

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
                BoLLines."Shipping Comment" := Rec."Shipping Comment";

                if PostedShipmentLines.FindSet() then
                    repeat
                        PostedShipmentWeight := PostedShipmentWeight + PostedShipmentLines."Net Weight" * PostedShipmentLines."Quantity (Base)";
                        PostedShipmentCases := PostedShipmentCases + PostedShipmentLines."Qty. to Ship Case";
                        PostedShipmentPallets := PostedShipmentPallets + PostedShipmentLines."Qty. to Ship Pallet";

                        case PostedShipmentLines."Gen. Prod. Posting Group" of
                            'ACCESSORIES':
                                begin
                                    WeightMould := WeightMould + PostedShipmentLines."Net Weight" * PostedShipmentLines."Quantity (Base)";
                                    CaseMould := CaseMould + PostedShipmentLines."Qty. to Ship Case";
                                    BaseMould := BaseMould + PostedShipmentLines."Quantity (Base)";
                                end;
                            'UNDERLAYMENT':
                                begin
                                    WeightUL := WeightUL + PostedShipmentLines."Net Weight" * PostedShipmentLines."Quantity (Base)";
                                    CaseUL := CaseUL + PostedShipmentLines."Qty. to Ship Case";
                                    BaseUL := BaseUL + PostedShipmentLines."Quantity (Base)";
                                end;
                            'FLOORING':
                                begin
                                    WeightFloor := WeightFloor + (PostedShipmentLines."Net Weight" * PostedShipmentLines."Quantity (Base)");
                                    CaseFloor := CaseFloor + PostedShipmentLines."Qty. to Ship Case";
                                    BaseFloor := BaseFloor + PostedShipmentLines."Quantity (Base)";
                                end;
                            else begin
                                WeightOther := WeightOther + PostedShipmentLines."Net Weight" * PostedShipmentLines."Quantity (Base)";
                                CaseOther := CaseOther + PostedShipmentLines."Qty. to Ship Case";
                                BaseOther := BaseOther + PostedShipmentLines."Quantity (Base)";
                            end;
                        end;
                    until PostedShipmentLines.Next() = 0;
                BoLLines."Total Cases" := PostedShipmentCases;
                BoLLines."Total Pallet" := PostedShipmentPallets;
                BoLLines."Total Weight" := PostedShipmentWeight;
                BoLLines.Insert();

                CurrentLine += 10000;
            until PostedShipments.Next() = 0;


        // put BOL # on shipment header
        if PostedShipments.Find('-') then begin
            PostedShipments.ModifyAll(PostedShipments."BOL No.", Rec."No.");
        end;

        // put BOL # on sales header
        BOLLines.Reset();
        BOLLines.SetRange("BOL No.", Rec."No.");
        if BOLLines.Find('-') then begin
            repeat
                SalesHeader.Reset();
                SalesHeader.SetRange("No.", BOLLines."Order No.");
                if SalesHeader.Find('-') then begin
                    repeat
                        SalesHeader."BOL No." := BOLLines."BOL No.";
                        SalesHeader.Modify(true);
                    until SalesHeader.Next() = 0;
                end;
            until BOLLines.Next() = 0;
        end;

        // Rec."Weight - Flooring" := WeightFloor;
        // Rec."Weight - Underlayment Rolls" := WeightUL;
        // Rec."Weight - Mouldings" := WeightMould;
        // Rec."Weight - Other" := WeightOther;
        // Rec."Weight - Total" := WeightFloor + WeightUL + WeightMould + WeightOther;

        // Rec."Cases - Flooring" := CaseFloor;
        // Rec."Cases - Underlayment Rolls" := CaseUL;
        // Rec."Cases - Mouldings" := CaseMould;
        // Rec."Cases - Other" := CaseOther;
        // Rec."Cases - Total" := CaseFloor + CaseUL + CaseMould + CaseOther;

        // Rec."Base Qty. - Underlayment Rolls" := BaseUL;
        // Rec."Base Quantity - Flooring" := BaseFloor;
        // Rec."Base Quantity - Mouldings" := BaseMould;
        // Rec."Base Quantity - Other" := BaseOther;
        // Rec."Base Quantity - Total" := BaseFloor + BaseUL + BaseMould + BaseOther;

    end;

    var
        TorlysDocPrint: Codeunit "TorlysDocumentPrint";
        LookupUserId: Codeunit TorlysLookupUserID;
}
