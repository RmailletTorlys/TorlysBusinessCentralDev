pageextension 50142 TlyPostedSalesShipmentList extends "Posted Sales Shipments"
{
    layout
    {
        addafter("No.")
        {

            field("Order No."; Rec."Order No.")
            {
                Caption = 'Order No.';
                ToolTip = 'Order No.';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Order Date"; Rec."Order Date")
            {
                Caption = 'Order Date';
                ToolTip = 'Order Date';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
        }
        moveafter("Order Date"; "Posting Date", "Sell-to Customer No.", "Ship-to Code", "Sell-to Customer Name")

        addafter("Sell-to Customer Name")
        {
            field("Ship-to Address"; Rec."Ship-to Address")
            {
                Caption = 'Ship-to Address';
                ToolTip = 'Ship-to Address';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Ship-to City"; Rec."Ship-to City")
            {
                Caption = 'Ship-to City';
                ToolTip = 'Ship-to City';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Ship-to County"; Rec."Ship-to County")
            {
                Caption = 'Ship-to County';
                ToolTip = 'Ship-to County';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
        }

        moveafter("Ship-to County"; "Shortcut Dimension 1 Code", "Location Code", "External Document No.")

        addafter("External Document No.")
        {
            field("Tag Name"; Rec."Tag Name")
            {
                Caption = 'Tag Name';
                ToolTip = 'Tag Name';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field(ShortcutDimCode3; ShortcutDimCode[3])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,3';
                ToolTip = 'Global Dimension 3 Code';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                Visible = false;
                Editable = false;
            }
            field("Channel Code"; Rec."Channel Code")
            {
                Caption = 'Channel Code';
                ToolTip = 'Channel Code';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Order Type"; Rec."Order Type")
            {
                Caption = 'Order Type';
                ToolTip = 'Order Type';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Temporary Hold"; Rec."Temporary Hold")
            {
                Caption = 'Temporary Hold';
                ToolTip = 'Temporary Hold';
                ApplicationArea = All;
                Visible = false;
                Editable = false;
            }
        }

        addafter("Temporary Hold")
        {
            field("Shipping Instructions"; Rec."Shipping Instructions")
            {
                Caption = 'Shipping Instructions';
                ToolTip = 'Shipping Instructions';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
            field("Order Comment"; Rec."Order Comment")
            {
                Caption = 'Order Comment';
                ToolTip = 'Order Comment';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
        }

        addafter("Order Comment")
        {
            field("Created By"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                Caption = 'Created By';
                ToolTip = 'Created By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Created At"; Rec."SystemCreatedAt")
            {
                Caption = 'Created At';
                ToolTip = 'Created At';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        modify("No.")
        {
            Width = 12;
        }

        modify("Ship-to Code")
        {
            Visible = true;
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
        }

        // modify("External Document No.")
        // {
        //     Visible = true;
        // }

        modify("Document Date")
        {
            Visible = false;
        }

        modify("Posting Date")
        {
            Visible = true;
        }

        modify("Shipment Date")
        {
            Visible = false;
        }

        modify("Currency Code")
        {
            Visible = false;
        }

        modify("No. Printed")
        {
            Visible = false;
        }

    }

    actions
    {
        addlast(Category_Category7)
        {
            actionref(PrintProforma_Promoted; PrintProforma)
            { }

            actionref(PrintB13Sales_Promoted; PrintB13Sales)
            { }

            actionref(PrintB13Purchases_Promoted; PrintB13Purchases)
            { }

            actionref(PrintLaceyAct_Promoted; PrintLaceyAct)
            { }

            actionref(PrintTCSA_Promoted; PrintTCSA)
            { }

            actionref(PrintSteelAluminium_Promoted; PrintSteelAluminum)
            { }
        }

        addafter(AttachAsPDF)
        {
            action(PrintProforma)
            {
                ApplicationArea = All;
                Caption = 'Print Proforma';
                Image = PrintVAT;
                ToolTip = 'Print Proforma';
                trigger OnAction()
                begin

                    Message('proforma');
                end;
            }

            action(PrintB13Sales)
            {
                ApplicationArea = All;
                Caption = 'Print B13 Sales';
                Image = PrintVAT;
                ToolTip = 'Print B13 Sales';
                trigger OnAction()
                begin
                    Message('B13 sales');
                end;
            }

            action(PrintB13Purchases)
            {
                ApplicationArea = All;
                Caption = 'Print B13 Purchases';
                Image = PrintVAT;
                ToolTip = 'Print B13 Purchases';
                trigger OnAction()
                begin
                    Message('B13 purchases');
                end;
            }

            action(PrintLaceyAct)
            {
                ApplicationArea = All;
                Caption = 'Print Lacey Act';
                Image = PrintVAT;
                ToolTip = 'Print Lacey Act';
                trigger OnAction()
                begin
                    Message('lacey');
                end;
            }

            action(PrintTCSA)
            {
                ApplicationArea = All;
                Caption = 'Print TCSA';
                Image = PrintVAT;
                ToolTip = 'Print TCSA';
                trigger OnAction()
                begin
                    Message('tcsa');
                end;
            }

            action(PrintSteelAluminum)
            {
                ApplicationArea = All;
                Caption = 'Print Steel Aluminum Derivative';
                Image = PrintVAT;
                ToolTip = 'Print Steel Aluminum Derivative';
                trigger OnAction()
                begin
                    Message('Aluminum');
                end;
            }
        }

        modify(AttachAsPDF_Promoted)
        {
            Visible = false;
        }

        modify(SendCustom_Promoted)
        {
            Visible = false;
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;

    protected var
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

}