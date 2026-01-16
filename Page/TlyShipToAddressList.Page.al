page 52007 TlyShipToAddressList
{
    PageType = List;
    SourceTable = "Ship-to Address";
    Editable = false;
    ApplicationArea = all;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            field("Code"; Rec."Code")
            {
                ApplicationArea = All;
                Caption = 'Code';
                ToolTip = 'Code of the ship-to address.';
            }
            field("Name"; Rec."Name")
            {
                ApplicationArea = All;
                Caption = 'Name';
                ToolTip = 'Name of the ship-to address.';
            }
            field("Address"; Rec."Address")
            {
                ApplicationArea = All;
                Caption = 'Address';
                ToolTip = 'Address of the ship-to address.';
            }
            field("Address 2"; Rec."Address 2")
            {
                ApplicationArea = All;
                Caption = 'Address 2';
                ToolTip = 'Second address line of the ship-to address.';
            }
            field("City"; Rec."City")
            {
                ApplicationArea = All;
                Caption = 'City';
                ToolTip = 'City of the ship-to address.';
            }
            field("Post Code"; Rec."Post Code")
            {
                ApplicationArea = All;
                Caption = 'Post Code';
                ToolTip = 'Post code of the ship-to address.';
            }
        }
    }
}