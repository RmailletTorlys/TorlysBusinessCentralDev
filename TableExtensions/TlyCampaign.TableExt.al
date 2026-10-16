tableextension 55071 TlyCampaign extends "Campaign"
{
    fields
    {
        field(50001; "Default Price List Code"; Code[20])
        {
            Caption = 'Default Price List Code';
            ToolTip = 'Default Price List Code';
            DataClassification = CustomerContent;
            TableRelation = "Price List Header".Code where("Price List Type" = filter('National Promo'));
        }

        field(50002; "Open Order Count"; Integer)
        {
            Caption = 'Open Order Count';
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" where("Document Type" = const(Order), "Campaign No." = field("No.")));
            Editable = false;
        }

        field(50003; "Open Credit Count"; Integer)
        {
            Caption = 'Open Credit Count';
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" where("Document Type" = const("Credit Memo"), "Campaign No." = field("No.")));
            Editable = false;
        }

        field(50004; "Posted Invoice Count"; Integer)
        {
            Caption = 'Posted Invoice Count';
            FieldClass = FlowField;
            CalcFormula = count("Sales Invoice Header" where("Campaign No." = field("No.")));
            Editable = false;
        }

        field(50005; "Posted Credit Count"; Integer)
        {
            Caption = 'Posted Credit Count';
            FieldClass = FlowField;
            CalcFormula = count("Sales Cr.Memo Header" where("Campaign No." = field("No.")));
            Editable = false;
        }
    }
}