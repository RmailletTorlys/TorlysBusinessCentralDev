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
                    Editable = false;
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
                    Editable = (Rec."Customer No." = '');
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
                    Editable = (Rec."Transaction Type" = Rec."Transaction Type"::Shipment);
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
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'No. Printed';
                    Caption = 'No. Printed';
                    Importance = Additional;
                    Editable = false;
                }
                field("Last Print Date"; Rec."Last Print Date")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Last Print Date';
                    Caption = 'Last Print Date';
                    Importance = Additional;
                    Editable = false;
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
                        field("Ship-to County"; Rec."Ship-to County")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the County of the ship-to address.';
                            Caption = 'Ship-to County';
                            Importance = Additional;
                        }
                        field("Ship-to Post Code"; Rec."Ship-to Post Code")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the post code of the ship-to address.';
                            Caption = 'Ship-to Post Code';
                            Importance = Additional;
                        }
                        field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the Country of the ship-to address.';
                            Caption = 'Ship-to Country/Region Code';
                            Importance = Additional;
                        }
                        field("Package Tracking No."; Rec."Package Tracking No.")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the tracking number of the carrier.';
                            Caption = 'Package Tracking No.';
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
                            Editable = true;
                        }
                        field("Weight - Underlayment Rolls"; Rec."Weight - Underlayment Rolls")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the weight of the underlayment rolls in the shipment.';
                            Caption = 'Underlayment Rolls';
                            Editable = true;
                        }
                        field("Weight - Mouldings"; Rec."Weight - Mouldings")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the weight of the mdlings in the shipment.';
                            Caption = 'Mouldings';
                            Editable = true;
                        }
                        field("Weight - Other"; Rec."Weight - Other")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the weight of other items in the shipment.';
                            Caption = 'Other';
                            Editable = true;
                        }

                        field("Weight - Total"; Rec."Weight - Flooring" + Rec."Weight - Underlayment Rolls" + Rec."Weight - Mouldings" + Rec."Weight - Other")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the weight of other items in the shipment.';
                            Caption = 'Total';
                            Editable = false;
                            Style = Strong;
                        }
                        field("Calc Weight"; Rec."Weight - Total")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the total weight of the shipment.';
                            Caption = 'Calc Total';
                            Editable = false;
                            Style = Strong;
                        }
                    }

                    group(Quantity)
                    {
                        Caption = 'Case Quantity';
                        field("Cases - Flooring"; Rec."Cases - Flooring")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the quantity of the flooring in the shipment.';
                            Caption = 'Flooring';
                            Editable = true;
                        }
                        field("Cases - Underlayment Rolls"; Rec."Cases - Underlayment Rolls")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the quantity of the underlayment rolls in the shipment.';
                            Caption = 'Underlayment Rolls';
                            Editable = true;
                        }
                        field("Cases - Mouldings"; Rec."Cases - Mouldings")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the quantity of the mdlings in the shipment.';
                            Caption = 'Mouldings';
                            Editable = true;
                        }
                        field("Cases - Other"; Rec."Cases - Other")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the quantity of other items in the shipment.';
                            Caption = 'Other';
                            Editable = true;
                        }
                        field("Cases - Total"; Rec."Cases - Flooring" + Rec."Cases - Underlayment Rolls" + Rec."Cases - Mouldings" + Rec."Cases - Other")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the quantity of other items in the shipment.';
                            Caption = 'Total';
                            Editable = false;
                            Style = Strong;
                        }
                        field("Calc Cases"; Rec."Cases - Total")
                        {
                            ApplicationArea = Basic, Suite;
                            ToolTip = 'Specifies the total quantity of the shipment.';
                            Caption = 'Calc Total';
                            Editable = false;
                            Style = Strong;
                        }
                    }

                    // group(Quantity2)
                    // {
                    //     Caption = 'Quantity(BASE)';

                    // field("Base Quantity - Flooring"; Rec."Base Quantity - Flooring")
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     ToolTip = 'Specifies the base quantity of the flooring in the shipment.';
                    //     Caption = 'Flooring';
                    //     Editable = false;
                    // }
                    // field("Base Quantity - Underlayment Rolls"; Rec."Base Qty. - Underlayment Rolls")
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     ToolTip = 'Specifies the base quantity of the Underlayment Rolls in the shipment.';
                    //     Caption = 'Underlayment Rolls';
                    //     Editable = false;
                    // }
                    // field("Base Quantity - Mouldings"; Rec."Base Quantity - Mouldings")
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     ToolTip = 'Specifies the base quantity of the mdlings in the shipment.';
                    //     Caption = 'Mouldings';
                    //     Editable = false;
                    // }
                    // field("Base Quantity - Other"; Rec."Base Quantity - Other")
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     ToolTip = 'Specifies the base quantity of other items in the shipment.';
                    //     Caption = 'Other';
                    //     Editable = false;
                    // }
                    // field("Base Quantity - Total"; Rec."Base Quantity - Total")
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     ToolTip = 'Specifies the total base quantity of the shipment.';
                    //     Caption = 'Total';
                    //     Editable = false;
                    // }
                    // }
                }
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref("Add Shipments for Pickup Date"; AddShipments)
            { }
            actionref("Clear Weight and Quantities"; ClearWeightsAndQuantities)
            { }
            actionref("Print BOL"; PrintBOL)
            { }
            // actionref("Post BOL"; PostBOL)
            // { }
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
                    GetShipment();
                end;
            }
            action(ClearWeightsAndQuantities)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Clear Weight and Quantities';
                Caption = 'Clear Weight and Quantities';
                Image = ClearLog;
                trigger OnAction()
                begin
                    Rec."Weight - Flooring" := 0;
                    Rec."Weight - Underlayment Rolls" := 0;
                    Rec."Weight - Mouldings" := 0;
                    Rec."Weight - Other" := 0;
                    Rec."Cases - Flooring" := 0;
                    Rec."Cases - Underlayment Rolls" := 0;
                    Rec."Cases - Mouldings" := 0;
                    Rec."Cases - Other" := 0;
                    Rec.Modify(true);
                end;
            }
            action(PrintBOL)
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Print BOL';
                Caption = 'Print BOL';
                Image = Print;
                trigger OnAction()
                var
                begin
                    BOLPrintPostChecks.BOLChecks(Rec);
                    TorlysDocPrint.PrintBillOfLading(Rec);
                end;
            }
            // action(PostBOL)
            // {
            //     ApplicationArea = Basic, Suite;
            //     ToolTip = 'Post BOL';
            //     Caption = 'Post BOL';
            //     Image = Document;

            //     trigger OnAction()
            //     var

            //     begin

            //     end;
            // }
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
                    SalesShipmentHeader: Record "Sales Shipment Header";
                    SalesHeader: Record "Sales Header";
                    TransferShipmentHeader: Record "Transfer Shipment Header";
                    TransferHeader: Record "Transfer Header";
                begin
                    BOLPrintPostChecks.BOLChecks(Rec);
                    if Rec."No. Printed" = 0 then Error('Cannot post until it has first been printed.');
                    if Rec."Package Tracking No." = '' then Error('Need to input tracking number before posting.');

                    ProcessedBOLHeader.TransferFields(Rec);
                    ProcessedBOLHeader.Insert();

                    BOLLine.Reset;
                    BOLLine.SetFilter("BOL No.", Rec."No.");
                    if BOLLine.Find('-') then begin
                        repeat
                            ProcessedBOLLine.TransferFields(BOLLine);
                            ProcessedBOLLine.Insert();
                            if SalesShipmentHeader.Get(BOLLine."Shipment No.") then begin
                                SalesShipmentHeader."Package Tracking No." := Rec."Package Tracking No.";
                                SalesShipmentHeader.Modify(true);
                            end;
                            if SalesHeader.Get(1, BOLLine."Order No.") then begin
                                SalesHeader."Package Tracking No." := Rec."Package Tracking No.";
                                SalesHeader.Modify(true);
                            end;
                            if TransferShipmentHeader.Get(BOLLine."Shipment No.") then begin
                                TransferShipmentHeader."Package Tracking No." := Rec."Package Tracking No.";
                                TransferShipmentHeader.Modify(true);
                            end;
                            if TransferHeader.Get(BOLLine."Order No.") then begin
                                TransferHeader."Package Tracking No." := Rec."Package Tracking No.";
                                TransferHeader.Modify(true);
                            end;
                        until BOLLine.Next = 0;
                    end;

                    Message('%1 has been posted.', Rec."No.");
                    BOLLine.DeleteAll();
                    CurrPage.Update();
                    Rec.Delete();
                    Commit();
                    TorlysDocPrint.PrintProcessedBillOfLading(ProcessedBOLHeader);
                end;
            }
        }
    }

    internal procedure GetShipment()
    var
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        BOLLine: Record "Torlys BOL Line";
        NextLineNo: Integer;
        ShippingAgent: Record "Shipping Agent";
        TotalWeight: Decimal;
        TotalCases: Integer;
        SalesHeader: Record "Sales Header";
        TransferShipmentHeader: Record "Transfer Shipment Header";
        TransferShipmentLine: Record "Transfer Shipment Line";
        TransferHeader: Record "Transfer Header";
    begin
        SalesShipmentHeader.Reset();
        SalesShipmentLine.Reset();
        BOLLine.Reset();
        NextLineNo := 0;
        ShippingAgent.Reset();
        TotalWeight := 0;
        TotalCases := 0;
        SalesHeader.Reset();
        TransferShipmentHeader.Reset();
        TransferShipmentLine.Reset();
        TransferHeader.Reset();

        BOLLine.SetRange("BOL No.", Rec."No.");
        if BOLLine.Find('+') then
            NextLineNo := BOLLine."BOL Line No." + 10000
        else
            NextLineNo := 10000;

        if Rec."Transaction Type" = Rec."Transaction Type"::Shipment then begin
            SalesShipmentHeader.SetRange("Sell-to Customer No.", Rec."Customer No.");
            SalesShipmentHeader.SetRange("Ship-to Code", Rec."Ship-to Code");
            SalesShipmentHeader.SetRange("Location Code", Rec."Location Code");
            SalesShipmentHeader.SetRange("Shipment Date", Rec."Pickup Date");
            SalesShipmentHeader.SetRange("Shipping Agent Code", Rec."Shipping Agent Code");
            SalesShipmentHeader.SetRange("BOL No.", '');
            if SalesShipmentHeader.IsEmpty then begin
                Error('No shipments were found. Please verify the information and try again.');
            end;
            if SalesShipmentHeader.FindSet() then begin
                repeat
                    BOLLine.Init();
                    BOLLine."BOL Line No." := NextLineNo;
                    BOLLine."BOL No." := Rec."No.";
                    BOLLine."Order No." := SalesShipmentHeader."Order No.";
                    BOLLine."Shipment No." := SalesShipmentHeader."No.";
                    BOLLine."Shipment Date" := SalesShipmentHeader."Shipment Date";
                    BOLLine."Customer No." := SalesShipmentHeader."Sell-to Customer No.";
                    BOLLine."Ship-to Code" := SalesShipmentHeader."Ship-to Code";
                    BOLLine."Ship-to Name" := SalesShipmentHeader."Ship-to Name";
                    BOLLine."Ship-to Address" := SalesShipmentHeader."Ship-to Address";
                    BOLLine."Ship-to Address 2" := SalesShipmentHeader."Ship-to Address 2";
                    BOLLine."Ship-to City" := SalesShipmentHeader."Ship-to City";
                    BOLLine."Ship-to County" := SalesShipmentHeader."Ship-to County";
                    BOLLine."Ship-to Post Code" := SalesShipmentHeader."Ship-to Post Code";
                    BOLLine."Ship-to Country/Region Code" := SalesShipmentHeader."Ship-to Country/Region Code";
                    BOLLine."External Document No." := SalesShipmentHeader."External Document No.";
                    BOLLine."Shipping Agent Code" := SalesShipmentHeader."Shipping Agent Code";
                    if ShippingAgent.Get(Rec."Shipping Agent Code") THEN
                        BOLLine."Freight Charges" := ShippingAgent."Freight Charges";
                    BOLLine."Shipping Comment" := SalesShipmentHeader."Shipping Comment";
                    BOLLine."Total Weight" := 0;
                    BOLLine."Total Cases" := 0;

                    if Rec."Shipping Comment" = '' then begin
                        Rec."Shipping Comment" := SalesShipmentHeader."Shipping Comment";
                        Rec.Modify(true);
                    end;

                    SalesShipmentLine.Reset();
                    SalesShipmentLine.SetRange("Document No.", SalesShipmentHeader."No.");
                    SalesShipmentLine.SetFilter(Type, 'Item');
                    if SalesShipmentLine.FindSet() then begin
                        repeat
                            if (SalesShipmentLine."Gen. Prod. Posting Group" in ['MOULDINGS', 'MQ MOULDINGS', 'SS MOULDINGS']) then begin
                                Rec."Weight - Mouldings" := Rec."Weight - Mouldings" + (SalesShipmentLine."Net Weight" * SalesShipmentLine."Quantity");
                                Rec."Cases - Mouldings" := Rec."Cases - Mouldings" + SalesShipmentLine."Quantity";
                                BOLLine."Total Weight" := BOLLine."Total Weight" + (SalesShipmentLine."Net Weight" * SalesShipmentLine."Quantity");
                                BOLLine."Total Cases" := BOLLine."Total Cases" + SalesShipmentLine."Quantity";
                            end else if (SalesShipmentLine."Gen. Prod. Posting Group" = 'UNDERLAYMENT') and (SalesShipmentLine."Unit of Measure Code" = 'ROLL') then begin
                                Rec."Weight - Underlayment Rolls" := Rec."Weight - Underlayment Rolls" + (SalesShipmentLine."Net Weight" * SalesShipmentLine."Quantity");
                                Rec."Cases - Underlayment Rolls" := Rec."Cases - Underlayment Rolls" + SalesShipmentLine."Quantity";
                                BOLLine."Total Weight" := BOLLine."Total Weight" + (SalesShipmentLine."Net Weight" * SalesShipmentLine."Quantity");
                                BOLLine."Total Cases" := BOLLine."Total Cases" + SalesShipmentLine."Quantity";
                            end else if (SalesShipmentLine."Gen. Prod. Posting Group" = 'UNDERLAYMENT') and (SalesShipmentLine."Unit of Measure Code" <> 'ROLL') then begin
                                Rec."Weight - Flooring" := Rec."Weight - Flooring" + (SalesShipmentLine."Net Weight" * SalesShipmentLine."Quantity");
                                Rec."Cases - Flooring" := Rec."Cases - Flooring" + SalesShipmentLine."Quantity Case";
                                BOLLine."Total Weight" := BOLLine."Total Weight" + (SalesShipmentLine."Net Weight" * SalesShipmentLine."Quantity");
                                BOLLine."Total Cases" := BOLLine."Total Cases" + SalesShipmentLine."Quantity Case";
                            end else if (SalesShipmentLine."Gen. Prod. Posting Group" in ['CORK', 'CORKWOOD', 'HARDWOOD', 'LAMINATE', 'LEATHER', 'MQ CARPET TILE',
                                                                                    'MQ LAMINATE', 'MQ HARDWOOD', 'MQ VINYL DB', 'MQ VINYL LL', 'MQ VINYL SPC',
                                                                                    'MQ VINYL WPC', 'SS HARDWOOD', 'VINYL EW', 'VINYL RW', 'VINYL UW', 'WALLS']) then begin
                                Rec."Weight - Flooring" := Rec."Weight - Flooring" + (SalesShipmentLine."Net Weight" * SalesShipmentLine."Quantity");
                                Rec."Cases - Flooring" := Rec."Cases - Flooring" + SalesShipmentLine."Quantity Case";
                                BOLLine."Total Weight" := BOLLine."Total Weight" + (SalesShipmentLine."Net Weight" * SalesShipmentLine."Quantity");
                                BOLLine."Total Cases" := BOLLine."Total Cases" + SalesShipmentLine."Quantity Case";
                            end else begin
                                Rec."Weight - Other" := Rec."Weight - Other" + (SalesShipmentLine."Net Weight" * SalesShipmentLine."Quantity");
                                Rec."Cases - Other" := Rec."Cases - Other" + SalesShipmentLine."Quantity";
                                BOLLine."Total Weight" := BOLLine."Total Weight" + (SalesShipmentLine."Net Weight" * SalesShipmentLine."Quantity");
                                BOLLine."Total Cases" := BOLLine."Total Cases" + SalesShipmentLine."Quantity";
                            end;
                        until SalesShipmentLine.Next() = 0;
                    end;
                    BOLLine.Insert();
                    NextLineNo += 10000;
                until SalesShipmentHeader.Next() = 0;
                // write BOL # on shipment header
                if SalesShipmentHeader.Find('-') then begin
                    SalesShipmentHeader.ModifyAll(SalesShipmentHeader."BOL No.", Rec."No.");
                end;
                // write BOL # on sales header
                BOLLine.Reset();
                BOLLine.SetRange("BOL No.", Rec."No.");
                if BOLLine.Find('-') then begin
                    repeat
                        SalesHeader.Reset();
                        SalesHeader.SetRange("No.", BOLLine."Order No.");
                        if SalesHeader.Find('-') then begin
                            repeat
                                SalesHeader."BOL No." := BOLLine."BOL No.";
                                SalesHeader.Modify(true);
                            until SalesHeader.Next() = 0;
                        end;
                    until BOLLine.Next() = 0;
                end;
            end;
        end else if Rec."Transaction Type" = Rec."Transaction Type"::Transfer then begin
            TransferShipmentHeader.SetRange("Transfer-to Code", Rec."Customer No.");
            TransferShipmentHeader.SetRange("Transfer-from Code", Rec."Location Code");
            TransferShipmentHeader.SetRange("Shipment Date", Rec."Pickup Date");
            TransferShipmentHeader.SetRange("Shipping Agent Code", Rec."Shipping Agent Code");
            TransferShipmentHeader.SetRange("BOL No.", '');
            if TransferShipmentHeader.IsEmpty then begin
                Error('No transfers were found. Please verify the information and try again.');
            end;
            if TransferShipmentHeader.FindSet() then begin
                repeat
                    BOLLine.Init();
                    BOLLine."BOL Line No." := NextLineNo;
                    BOLLine."BOL No." := Rec."No.";
                    BOLLine."Order No." := TransferShipmentHeader."Transfer Order No.";
                    BOLLine."Shipment No." := TransferShipmentHeader."No.";
                    BOLLine."Shipment Date" := TransferShipmentHeader."Shipment Date";
                    BOLLine."Customer No." := TransferShipmentHeader."Transfer-to Code";
                    // BOLLine."Ship-to Code" := TransferShipmentHeader."Transfer-to Code";
                    BOLLine."Ship-to Name" := TransferShipmentHeader."Transfer-to Name";
                    BOLLine."Ship-to Address" := TransferShipmentHeader."Transfer-to Address";
                    BOLLine."Ship-to Address 2" := TransferShipmentHeader."Transfer-to Address 2";
                    BOLLine."Ship-to City" := TransferShipmentHeader."Transfer-to City";
                    BOLLine."Ship-to County" := TransferShipmentHeader."Transfer-to County";
                    BOLLine."Ship-to Post Code" := TransferShipmentHeader."Transfer-to Post Code";
                    BOLLine."Ship-to Country/Region Code" := TransferShipmentHeader."Trsf.-to Country/Region Code";
                    BOLLine."External Document No." := TransferShipmentHeader."External Document No.";
                    BOLLine."Shipping Agent Code" := TransferShipmentHeader."Shipping Agent Code";
                    if ShippingAgent.Get(Rec."Shipping Agent Code") THEN
                        BOLLine."Freight Charges" := ShippingAgent."Freight Charges";
                    BOLLine."Shipping Comment" := TransferShipmentHeader."Shipping Comment";
                    BOLLine."Total Weight" := 0;
                    BOLLine."Total Cases" := 0;

                    Rec."Shipping Comment" := TransferShipmentHeader."Shipping Comment";
                    Rec.Modify(true);

                    TransferShipmentLine.Reset();
                    TransferShipmentLine.SetRange("Document No.", TransferShipmentHeader."No.");
                    if TransferShipmentLine.FindSet() then begin
                        repeat
                            if (TransferShipmentLine."Gen. Prod. Posting Group" in ['MOULDINGS', 'MQ MOULDINGS', 'SS MOULDINGS']) then begin
                                Rec."Weight - Mouldings" := Rec."Weight - Mouldings" + (TransferShipmentLine."Net Weight" * TransferShipmentLine."Quantity");
                                Rec."Cases - Mouldings" := Rec."Cases - Mouldings" + TransferShipmentLine."Quantity";
                                BOLLine."Total Weight" := BOLLine."Total Weight" + (TransferShipmentLine."Net Weight" * TransferShipmentLine."Quantity");
                                BOLLine."Total Cases" := BOLLine."Total Cases" + TransferShipmentLine."Quantity";
                            end else if (TransferShipmentLine."Gen. Prod. Posting Group" = 'UNDERLAYMENT') and (TransferShipmentLine."Unit of Measure Code" = 'ROLL') then begin
                                Rec."Weight - Underlayment Rolls" := Rec."Weight - Underlayment Rolls" + (TransferShipmentLine."Net Weight" * TransferShipmentLine."Quantity");
                                Rec."Cases - Underlayment Rolls" := Rec."Cases - Underlayment Rolls" + TransferShipmentLine."Quantity";
                                BOLLine."Total Weight" := BOLLine."Total Weight" + (TransferShipmentLine."Net Weight" * TransferShipmentLine."Quantity");
                                BOLLine."Total Cases" := BOLLine."Total Cases" + TransferShipmentLine."Quantity";
                            end else if (TransferShipmentLine."Gen. Prod. Posting Group" = 'UNDERLAYMENT') and (TransferShipmentLine."Unit of Measure Code" <> 'ROLL') then begin
                                Rec."Weight - Flooring" := Rec."Weight - Flooring" + (TransferShipmentLine."Net Weight" * TransferShipmentLine."Quantity");
                                Rec."Cases - Flooring" := Rec."Cases - Flooring" + TransferShipmentLine."Quantity Case";
                                BOLLine."Total Weight" := BOLLine."Total Weight" + (TransferShipmentLine."Net Weight" * TransferShipmentLine."Quantity");
                                BOLLine."Total Cases" := BOLLine."Total Cases" + TransferShipmentLine."Quantity Case";
                            end else if (SalesShipmentLine."Gen. Prod. Posting Group" in ['CORK', 'CORKWOOD', 'HARDWOOD', 'LAMINATE', 'LEATHER', 'MQ CARPET TILE',
                                                                                    'MQ LAMINATE', 'MQ HARDWOOD', 'MQ VINYL DB', 'MQ VINYL LL', 'MQ VINYL SPC',
                                                                                    'MQ VINYL WPC', 'SS HARDWOOD', 'VINYL EW', 'VINYL RW', 'VINYL UW', 'WALLS']) then begin
                                Rec."Weight - Flooring" := Rec."Weight - Flooring" + (TransferShipmentLine."Net Weight" * TransferShipmentLine."Quantity");
                                Rec."Cases - Flooring" := Rec."Cases - Flooring" + TransferShipmentLine."Quantity Case";
                                BOLLine."Total Weight" := BOLLine."Total Weight" + (TransferShipmentLine."Net Weight" * TransferShipmentLine."Quantity");
                                BOLLine."Total Cases" := BOLLine."Total Cases" + TransferShipmentLine."Quantity Case";
                            end else begin
                                Rec."Weight - Other" := Rec."Weight - Other" + (TransferShipmentLine."Net Weight" * TransferShipmentLine."Quantity");
                                Rec."Cases - Other" := Rec."Cases - Other" + TransferShipmentLine."Quantity";
                                BOLLine."Total Weight" := BOLLine."Total Weight" + (TransferShipmentLine."Net Weight" * TransferShipmentLine."Quantity");
                                BOLLine."Total Cases" := BOLLine."Total Cases" + TransferShipmentLine."Quantity";
                            end;
                        until TransferShipmentLine.Next() = 0;
                    end;
                    BOLLine.Insert();
                    NextLineNo += 10000;
                until TransferShipmentHeader.Next() = 0;
                // write BOL # on shipment header
                if TransferShipmentHeader.Find('-') then begin
                    TransferShipmentHeader.ModifyAll(TransferShipmentHeader."BOL No.", Rec."No.");
                end;
                // write BOL # on sales header
                BOLLine.Reset();
                BOLLine.SetRange("BOL No.", Rec."No.");
                if BOLLine.Find('-') then begin
                    repeat
                        TransferHeader.Reset();
                        TransferHeader.SetRange("No.", BOLLine."Order No.");
                        if TransferHeader.Find('-') then begin
                            repeat
                                TransferHeader."BOL No." := BOLLine."BOL No.";
                                TransferHeader.Modify(true);
                            until TransferHeader.Next() = 0;
                        end;
                    until BOLLine.Next() = 0;
                end;
            end;
        end;

    end;

    var
        BOLPrintPostChecks: Codeunit TorlysBOLPrintPostCheck;
        TorlysDocPrint: Codeunit "TorlysDocumentPrint";
        LookupUserId: Codeunit TorlysLookupUserID;
}
