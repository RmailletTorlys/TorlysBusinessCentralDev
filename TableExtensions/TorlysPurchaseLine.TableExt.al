tableextension 50039 TorlysPurchaseLine extends "Purchase Line"
{
    fields
    {
        field(50001; "Quantity Case"; Integer)
        {
            Caption = 'Case Quantity';
            DataClassification = CustomerContent;
        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Pallet Quantity';
            DataClassification = CustomerContent;
        }

        field(50003; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Case Quantity to Receive';
            DataClassification = CustomerContent;
        }

        field(50004; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Pallet Quantity to Receive';
            DataClassification = CustomerContent;
        }

        field(50005; "Qty. Received Case"; Integer)
        {
            Caption = 'Case Quantity Received';
            DataClassification = CustomerContent;
        }

        field(50006; "Qty. Received Pallet"; Integer)
        {
            Caption = 'Pallet Quantity Received';
            DataClassification = CustomerContent;
        }

        field(50007; "Manufacturing Code"; Code[20])
        {
            Caption = 'Manufacturing Code';
            DataClassification = CustomerContent;
        }

        field(50008; "Incoterms"; Code[20])
        {
            Caption = 'Incoterms';
            DataClassification = CustomerContent;
        }

        field(50009; "Container No."; Code[20])
        {
            Caption = 'Container No.';
            DataClassification = CustomerContent;
        }

        field(50010; "SH BoL No."; Code[20])
        {
            Caption = 'SH BoL No.';
            DataClassification = CustomerContent;
        }

        field(50011; "Urgent"; Boolean)
        {
            Caption = 'Urgent';
            DataClassification = CustomerContent;
            ToolTip = 'Urgent';
        }

        field(50012; "Strike"; Boolean)
        {
            Caption = 'Strike';
            DataClassification = CustomerContent;
            ToolTip = 'Strike';
        }

        field(50013; "Production Date"; Date)
        {
            Caption = 'Production Date';
            DataClassification = CustomerContent;
        }

        field(50014; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
            DataClassification = CustomerContent;
        }

        field(50015; "Previous ETA Date"; Date)
        {
            Caption = 'Previous ETA Date';
            DataClassification = CustomerContent;
        }

        field(50016; "Confirmation No."; Code[20])
        {
            Caption = 'Confirmation No.';
            DataClassification = CustomerContent;
        }

        field(50017; "Outstanding Qty."; Integer)
        {
            Caption = 'Outstanding Qty.';
            DataClassification = CustomerContent;
        }

        field(50018; "Special Price"; Decimal)
        {
            Caption = 'Special Price';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }

        field(50019; "Special Purchase Price"; Decimal)
        {
            Caption = 'Special Purchase Price';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }

        field(50020; "Direct Unit Cost Excl. Tax"; Decimal)
        {
            Caption = 'Direct Unit Cost Excl. Tax';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }

        field(50021; "Price Based On"; Code[20])
        {
            Caption = 'Price Based On';
            DataClassification = CustomerContent;
        }

        field(50022; "Price Confirmed"; Boolean)
        {
            Caption = 'Price Confirmed';
            DataClassification = CustomerContent;
        }

        field(50023; "Landed Cost CDN"; Decimal)
        {
            Caption = 'Landed Cost CDN';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }

        field(50024; "Line Amount Excl. Tax"; Decimal)
        {
            Caption = 'Line Amount Excl. Tax';
            DataClassification = CustomerContent;
            DecimalPlaces = 2;
        }

        field(50025; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            DataClassification = CustomerContent;
        }

        field(50026; "Project Code"; Code[20])
        {
            Caption = 'Project Code';
            DataClassification = CustomerContent;
        }

        field(50027; "LOB Code"; Code[20])
        {
            Caption = 'LOB Code';
            DataClassification = CustomerContent;
        }

    }

    [IntegrationEvent(false, false)]
    procedure OnValidateQuantityCase(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnValidateQuantityPallet(var Rec: Record "Purchase Line"; xRec: Record "Purchase Line"; CallingFieldNo: Integer; relatedQtyFieldNo: Integer)
    begin
    end;
}