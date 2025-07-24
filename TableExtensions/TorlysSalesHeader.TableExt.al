tableextension 50036 "TorlysSalesHeader" extends "Sales Header"
{
    fields
    {
        field(50001; "Salesperson Commission"; Decimal)
        {
            Caption = 'Salesperson Commission';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50002; "Salesperson Code 2"; code[20])
        {
            Caption = 'Salesperson Code 2';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }

        field(50003; "Salesperson Commission 2"; Decimal)
        {
            Caption = 'Salesperson Commission 2';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50004; "Salesperson Code 3"; code[20])
        {
            Caption = 'Salesperson Code 3';
            TableRelation = "Salesperson/Purchaser";
            DataClassification = CustomerContent;
        }

        field(50005; "Salesperson Commission 3"; Decimal)
        {
            Caption = 'Salesperson Commission 3';
            DecimalPlaces = 2;
            DataClassification = CustomerContent;
        }

        field(50006; "Order Time"; Time)
        {
            Caption = 'Order Time';
            DataClassification = CustomerContent;
        }

        field(50007; "Order Type"; Code[25])
        {
            Caption = 'Order Type';
            TableRelation = "Torlys Lookup Values" where(Type = const("Order Type"));
            DataClassification = CustomerContent;
        }

        field(50008; "Tag Name"; code[20])
        {
            Caption = 'Tag Name';
            DataClassification = CustomerContent;
        }

        field(50009; "Temporary Hold"; Boolean)
        {
            Caption = 'Temporary Hold';
            DataClassification = CustomerContent;
        }

        field(50010; "No. Pick Lists Printed"; Integer)
        {
            Caption = 'No. Pick Lists Printed';
            DataClassification = CustomerContent;
        }

        field(50011; "Pick Slip Printed By"; code[20])
        {
            Caption = 'Pick Slip Printed By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50012; "Pick Slip Printed Date"; Date)
        {
            Caption = 'Pick Slip Printed Date';
            DataClassification = CustomerContent;
        }

        field(50013; "Pick Slip Printed Time"; Time)
        {
            Caption = 'Pick Slip Printed Time';
            DataClassification = CustomerContent;
        }

        field(50014; "Popup Modify By"; code[20])
        {
            Caption = 'Popup Modify By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50015; "Popup Modify Date"; Date)
        {
            Caption = 'Popup Modify Date';
            DataClassification = CustomerContent;
        }

        field(50016; "Popup Modify Time"; Time)
        {
            Caption = 'Popup Modify Time';
            DataClassification = CustomerContent;
        }

        field(50017; "Released"; Boolean)
        {
            Caption = 'Released';
            DataClassification = CustomerContent;
        }

        field(50020; "Qty. To ship"; Decimal)
        {
            Caption = 'Qty. To ship';
            CalcFormula = Sum("Sales Line"."Qty. to Ship" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }

        field(50021; "Outstanding Quantity"; Decimal)
        {
            Caption = 'Outstanding Quantity';
            CalcFormula = Sum("Sales Line"."Outstanding Quantity" WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
        }

        field(50022; "Roll out Order"; Boolean)
        {
            Caption = 'Roll out Order';
            DataClassification = CustomerContent;
        }

        field(50023; "CM Accuracy Approval By"; code[20])
        {
            Caption = 'CM Accuracy Approval By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50024; "CM Accuracy Approval Date"; Date)
        {
            Caption = 'CM Accuracy Approval Date';
            DataClassification = CustomerContent;
        }

        field(50025; "Do Not Mail Credit Note"; Boolean)
        {
            Caption = 'Do Not Mail Credit Note';
            DataClassification = CustomerContent;
        }

        field(50026; "Warehouse Associate Picked By"; code[20])
        {
            Caption = 'Warehouse Associate Picked By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50027; "Warehouse Associate Checked By"; code[20])
        {
            Caption = 'Warehouse Associate Checked By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50028; "Freight Zone Code"; Code[20])
        {
            Caption = 'Freight Zone Code';
            DataClassification = CustomerContent;
            TableRelation = "Torlys Freight Zones";

        }

        field(50029; "CM Approved By"; code[20])
        {
            Caption = 'CM Approved By';
            TableRelation = "User Details";
            DataClassification = CustomerContent;
        }

        field(50030; "CM Approved Date"; Date)
        {
            Caption = 'CM Approved Date';
            DataClassification = CustomerContent;
        }

        field(50031; "Order Method"; Code[25])
        {
            Caption = 'Order Method';
            DataClassification = CustomerContent;
            TableRelation = "Torlys Lookup Values" where(Type = const("Order Method"));
        }

        field(50032; "Total Excl. Tax"; Decimal)
        {
            Caption = 'Total Excl. Tax';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }

        field(50033; "Total Tax"; Decimal)
        {
            Caption = 'Total Tax';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }

        field(50034; "Total Incl. Tax"; Decimal)
        {
            Caption = 'Total Incl. Tax';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }

        field(50035; "To ship"; Boolean)
        {
            Caption = 'To ship';
            DataClassification = CustomerContent;
        }

        field(50036; "Region Code"; Code[10])
        {
            Caption = 'Region Code';
            DataClassification = CustomerContent;
        }

        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            begin
                CopyCommentsFromCustCardToSalesHeader();
            end;
        }
    }

    trigger OnAfterInsert()
    begin
        CopyCommentsFromCustCardToSalesHeader();
    end;


    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    var
        DimMgt: Codeunit "DimensionManagement";
    begin
        DimMgt.GetShortcutDimensions(Rec."Dimension Set ID", ShortcutDimCode);
    end;

    local procedure CopyCommentsFromCustCardToSalesHeader()
    var
        CommentLine: Record "Comment Line";
        SalesCommentLine: Record "Sales Comment Line";
        LineNo: Integer;
        IsHandled: Boolean;
    begin
        OnBeforeCopyCommentsFromCustCardToSalesHeader(IsHandled);
        if IsHandled then
            exit;

        if Rec."Sell-to Customer No." = '' then
            exit;

        CommentLine.Reset();
        CommentLine.SetRange("Table Name", Enum::"Comment Line Table Name"::Customer);
        CommentLine.SetRange("No.", Rec."Sell-to Customer No.");
        CommentLine.SetRange("Copy to Sales Order", true);
        if CommentLine.FindSet() then BEGIN
            SalesCommentLine.RESET;
            SalesCommentLine.SETCURRENTKEY("Document Type", "No.");
            SalesCommentLine.SETRANGE("Document Type", "Document Type");
            SalesCommentLine.SETRANGE("No.", "No.");
            IF SalesCommentLine.FIND('+') THEN
                LineNo := SalesCommentLine."Line No.";
            LineNo += 10000;
            repeat
                SalesCommentLine.Init();
                SalesCommentLine."Document Type" := Rec."Document Type";
                SalesCommentLine."No." := Rec."No.";
                SalesCommentLine."Comment Type" := CommentLine."Comment Type";
                SalesCommentLine."Line No." := LineNo;
                LineNo += 10000;
                SalesCommentLine.Date := CommentLine.Date;
                SalesCommentLine.Comment := CommentLine.Comment;
                SalesCommentLine."Print on Quote" := CommentLine."Print on Quote";
                SalesCommentLine."Print on Pick Ticket" := CommentLine."Print on Pick Ticket";
                SalesCommentLine."Print on Order Confirmation" := CommentLine."Print on Order Confirmation";
                SalesCommentLine."Print on Shipment" := CommentLine."Print on Shipment";
                SalesCommentLine."Print on Invoice" := CommentLine."Print on Invoice";
                SalesCommentLine."Print on Credit Memo" := CommentLine."Print on Credit Memo";
                SalesCommentLine."Print on Return Authorization" := CommentLine."Print on Return Authorization";
                SalesCommentLine."Print on Return Receipt" := CommentLine."Print on Return Receipt";
                SalesCommentLine.Insert();
            until CommentLine.Next() = 0;
        end;



        OnAfterCopyCommentsFromCustCardToSalesHeader();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCopyCommentsFromCustCardToSalesHeader(var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyCommentsFromCustCardToSalesHeader()
    begin
    end;
}