<<<<<<< HEAD:TableExtensions/TlyPurchInvLine.TableExt.al
tableextension 50123 TlyPurchInvLine extends "Purch. Inv. Line"
=======
tableextension 50123 TorlysPurchaseInvoiceLine extends "Purch. Inv. Line"
>>>>>>> 5d97453bc243d6e4cb3019687424c0f4e6bb89a7:TableExtensions/TorlysPurchaseInvoiceLine.TableExt.al
{
    fields
    {
        field(50001; "Quantity Case"; Integer)
        {
            Caption = 'Quantity Case';
            DataClassification = CustomerContent;
        }

        field(50002; "Quantity Pallet"; Integer)
        {
            Caption = 'Quantity Pallet';
            DataClassification = CustomerContent;
        }

        field(50003; "Qty. to Receive Case"; Integer)
        {
            Caption = 'Qty. to Receive Case';
            DataClassification = CustomerContent;
        }

        field(50004; "Qty. to Receive Pallet"; Integer)
        {
            Caption = 'Qty. to Receive Pallet';
            DataClassification = CustomerContent;
        }

        field(50005; "Return Qty. to Ship Case"; Integer)
        {
            Caption = 'Return Qty. to Ship Case';
            DataClassification = CustomerContent;
        }

        field(50006; "Return Qty. to Ship Pallet"; Integer)
        {
            Caption = 'Return Qty. to Ship Pallet';
            DataClassification = CustomerContent;
        }

        field(50007; "Booking No."; Code[20])
        {
            Caption = 'Booking No.';
            DataClassification = CustomerContent;
            TableRelation = TlyBookingInfo;
        }

        field(50008; "SH BOL No."; Code[20])
        {
            Caption = 'SH BOL No.';
            DataClassification = CustomerContent;
        }

        field(50009; "Previous ETA"; Date)
        {
            Caption = 'Previous ETA';
            DataClassification = CustomerContent;
        }

        field(50010; "Possible Loading Date"; Date)
        {
            Caption = 'Possible Loading Date';
            DataClassification = CustomerContent;
        }

        field(50011; "Expected Departure Date"; Date)
        {
            Caption = 'Expected Departure Date';
            DataClassification = CustomerContent;
        }

        field(50012; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
            DataClassification = CustomerContent;
        }

        field(50013; "Production Date"; Date)
        {
            Caption = 'Production Date';
            DataClassification = CustomerContent;
        }
        field(50014; "Confirmation No."; Text[20])
        {
            Caption = 'Confirmation No.';
            DataClassification = CustomerContent;
        }

    }
}