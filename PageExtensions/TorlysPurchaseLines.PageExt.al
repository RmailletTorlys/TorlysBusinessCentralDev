pageextension 50518 TorlysPurchaseLines extends "Purchase Lines"
{
    layout
    {
        addafter("Document No.")
        {
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
            }

            field("Delivery Appointment Date"; Rec."Delivery Appointment Date")
            {
                Caption = 'Delivery Appointment Date';
                ToolTip = 'Delivery Appointment Date';
                ApplicationArea = All;

            }

            field("Production Date"; Rec."Production Date")
            {
                Caption = 'Production Date';
                ToolTip = 'Production Date';
                ApplicationArea = All;
            }

            field("Shipment Date"; Rec."Shipment Date")
            {
                Caption = 'Shipment Date';
                ToolTip = 'Shipment Date';
                ApplicationArea = All;
            }

            field("Whse Receipt Date"; Rec."Warehouse Receipt Date")
            {
                Caption = 'Warehouse Receipt Date';
                ToolTip = 'Warehouse Receipt Date';
                ApplicationArea = All;
            }

            field("Requested Receipt Date"; Rec."Requested Receipt Date")
            {
                Caption = 'Requested Receipt Date';
                ToolTip = 'Requested Receipt Date';
                ApplicationArea = All;
            }
        }

        moveafter("Requested Receipt Date"; "Expected Receipt Date")

        addafter("Expected Receipt Date")
        {

            field("Previous ETA Date"; Rec."Previous ETA Date")
            {
                Caption = 'Previous ETA Date';
                ToolTip = 'Previous ETA Date';
                ApplicationArea = All;
            }
        }

        modify("Buy-from Vendor Name")
        {
            Visible = false;
        }

        modify("Buy-from Vendor No.")
        {
            Visible = false;
        }

        modify(Type)
        {
            Visible = false;
        }

        modify("No.")
        {
            Visible = false;
        }

        modify(Description)
        {
            Visible = false;
        }

        modify("Location Code")
        {
            Visible = false;
        }

        modify(Quantity)
        {
            Visible = false;
        }

        modify("Reserved Qty. (Base)")
        {
            Visible = false;
        }

        modify("Unit of Measure Code")
        {
            Visible = false;
        }

        modify("Direct Unit Cost")
        {
            Visible = false;
        }

        modify("Line Amount")
        {
            Visible = false;
        }

        modify("Outstanding Quantity")
        {
            Visible = false;
        }
    }
}