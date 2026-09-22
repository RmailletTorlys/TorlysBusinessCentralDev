page 50573 TlyNTNInventoryAvailabilityNEW
{
    Caption = 'NTN Inventory Availability NEW';
    PageType = List;
    SourceTable = "Location";
    SourceTableView = where(Code = filter('TOR|CAL'));
    ApplicationArea = Basic, Suite;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Item No."; ItemNo)
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
                    ToolTip = 'Item No.';
                    Editable = true;
                }

                field("Location Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    Caption = 'Location Code';
                    ToolTip = 'Location Code';
                    Editable = false;
                }

                field("Available Now"; GetAvailableNow)
                {
                    ApplicationArea = All;
                    Caption = 'Available Now';
                    ToolTip = 'Available Now';
                    Editable = false;
                }

                field("Bucket 1 v2 Date"; GetBucket1Date)
                {
                    ApplicationArea = All;
                    Caption = 'Bucket 1 v2 Date';
                    ToolTip = 'Bucket 1 v2 Date';
                    Editable = false;
                }

                field("Bucket 1 v2 Qty"; GetBucket1Qty)
                {
                    ApplicationArea = All;
                    Caption = 'Bucket 1 v2 Qty';
                    ToolTip = 'Bucket 1 v2 Qty';
                    Editable = false;
                }

                field("Bucket 2 v2 Date"; GetBucket2Date)
                {
                    ApplicationArea = All;
                    Caption = 'Bucket 2 v2 Date';
                    ToolTip = 'Bucket 2 v2 Date';
                    Editable = false;
                }

                field("Bucket 2 v2 Qty"; GetBucket2Qty)
                {
                    ApplicationArea = All;
                    Caption = 'Bucket 2 v2 Qty';
                    ToolTip = 'Bucket 2 v2 Qty';
                    Editable = false;
                }

                field("Bucket 3 v2 Date"; GetBucket3Date)
                {
                    ApplicationArea = All;
                    Caption = 'Bucket 3 v2 Date';
                    ToolTip = 'Bucket 3 v2 Date';
                    Editable = false;
                }

                field("Bucket 3 v2 Qty"; GetBucket3Qty)
                {
                    ApplicationArea = All;
                    Caption = 'Bucket 3 v2 Qty';
                    ToolTip = 'Bucket 3 v2 Qty';
                    Editable = false;
                }

                field("Bucket 4 v2 Date"; GetBucket4Date)
                {
                    ApplicationArea = All;
                    Caption = 'Bucket 4 v2 Date';
                    ToolTip = 'Bucket 4 v2 Date';
                    Editable = false;
                }

                field("Bucket 4 v2 Qty"; GetBucket4Qty)
                {
                    ApplicationArea = All;
                    Caption = 'Bucket 4 v2 Qty';
                    ToolTip = 'Bucket 4 v2 Qty';
                    Editable = false;
                }
            }
        }
    }

    var
        ItemNo: Code[20];
        Bucket1Date: Date;
        Bucket2Date: Date;

    trigger OnOpenPage()
    begin
        ItemNo := 'EE-F-9686-P#';
    end;

    procedure GetAvailableNow(): Decimal
    var
        Item: Record "Item";
    begin
        Item.Reset;
        Item.SetFilter("No.", ItemNo);
        Item.SetRange("Location Filter", Rec."Code");
        if Item.Find('-') then begin
            Item.CalcFields(Inventory);
            exit(Item.Inventory);
        end;
    end;

    procedure GetBucket1Date(): Date
    begin
        if GetBucket1Qty = 0 then
            exit(0D)
        else if Rec.Code = 'CAL' then
            exit(WorkDate() + 14)
        else if Rec.Code = 'TOR' then
            exit(WorkDate() + 7);
    end;

    procedure GetBucket1Qty(): Decimal
    var
        Item: Record "Item";
    begin
        if Rec.Code = 'CAL' then begin
            Item.Reset();
            Item.SetFilter("No.", ItemNo);
            Item.SetFilter("Location Filter", 'TOR');
            if Item.Find('-') then begin
                Item.CalcFields(Inventory);
                exit(Item.Inventory);
            end;
        end;

        if Rec.Code = 'TOR' then begin
            Item.Reset();
            Item.SetFilter("No.", ItemNo);
            Item.SetFilter("Location Filter", 'TMT');
            if Item.Find('-') then begin
                Item.CalcFields(Inventory);
                exit(Item.Inventory);
            end;
        end;
    end;

    procedure GetBucket2Date(): Date
    var
        TransferLine: Record "Transfer Line";
    begin
        TransferLine.Reset();
        TransferLine.SetCurrentKey("Receipt Date");
        TransferLine.SetFilter("Item No.", ItemNo);
        TransferLine.SetRange("Transfer-to Code", Rec.Code);
        TransferLine.SetFilter("Qty. in Transit", '<>0');
        if TransferLine.Find('-') then
            exit(TransferLine."Receipt Date");
    end;

    procedure GetBucket2Qty(): Decimal
    var
        TransferLine: Record "Transfer Line";
    begin
        TransferLine.Reset();
        TransferLine.SetFilter("Item No.", ItemNo);
        TransferLine.SetRange("Transfer-to Code", Rec.Code);
        TransferLine.SetRange("Receipt Date", GetBucket2Date);
        TransferLine.CalcSums("Qty. in Transit");
        exit(TransferLine."Qty. in Transit");
    end;

    procedure GetBucket3Date(): Date
    var
        TransferLine: Record "Transfer Line";
    begin
        if GetBucket2Date() <> 0D then begin
            TransferLine.Reset();
            TransferLine.SetCurrentKey("Receipt Date");
            TransferLine.SetFilter("Item No.", ItemNo);
            TransferLine.SetRange("Transfer-to Code", Rec.Code);
            TransferLine.SetFilter("Qty. in Transit", '<>0');
            TransferLine.SetRange("Receipt Date", GetBucket2Date() + 1, 20441201D);
            if TransferLine.Find('-') then
                exit(TransferLine."Receipt Date");
        end;
    end;

    procedure GetBucket3Qty(): Decimal
    var
        TransferLine: Record "Transfer Line";
    begin
        TransferLine.Reset();
        TransferLine.SetFilter("Item No.", ItemNo);
        TransferLine.SetRange("Transfer-to Code", Rec.Code);
        TransferLine.SetRange("Receipt Date", GetBucket3Date);
        TransferLine.CalcSums("Qty. in Transit");
        exit(TransferLine."Qty. in Transit");
    end;

    procedure GetBucket4Date(): Date
    var
        TransferLine: Record "Transfer Line";
    begin
        if GetBucket3Date() <> 0D then begin
            TransferLine.Reset();
            TransferLine.SetCurrentKey("Receipt Date");
            TransferLine.SetFilter("Item No.", ItemNo);
            TransferLine.SetRange("Transfer-to Code", Rec.Code);
            TransferLine.SetFilter("Qty. in Transit", '<>0');
            TransferLine.SetRange("Receipt Date", GetBucket3Date() + 1, 20441201D);
            if TransferLine.Find('-') then
                exit(TransferLine."Receipt Date");
        end;
    end;

    procedure GetBucket4Qty(): Decimal
    var
        TransferLine: Record "Transfer Line";
    begin
        TransferLine.Reset();
        TransferLine.SetFilter("Item No.", ItemNo);
        TransferLine.SetRange("Transfer-to Code", Rec.Code);
        TransferLine.SetRange("Receipt Date", GetBucket4Date);
        TransferLine.CalcSums("Qty. in Transit");
        exit(TransferLine."Qty. in Transit");
    end;
}