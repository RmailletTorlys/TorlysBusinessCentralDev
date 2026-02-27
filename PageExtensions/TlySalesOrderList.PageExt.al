pageextension 59305 TlySalesOrderList extends "Sales Order List"
{
    layout
    {
        moveafter("No."; "Status")

        addafter("Status")
        {
            field("On Hold"; Rec."On Hold")
            {
                Caption = 'On Hold';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
                ToolTip = 'Display if an order is currently on Credit Hold';
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
        moveafter("Order Date"; "Shipment Date", "Sell-to Customer No.", "Ship-to Code", "Sell-to Customer Name")

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
        moveafter("Ship-to County"; "Salesperson Code")

        addafter("Salesperson Code")
        {
            field("Collector ID"; CollectorID)
            {
                Caption = 'Collector ID';
                ToolTip = 'Collector ID';
                ApplicationArea = All;
                Visible = true;
                Editable = false;
            }
        }

        moveafter("Collector ID"; "Shortcut Dimension 1 Code", "Location Code", "External Document No.")
        // moveafter("Salesperson Code"; "Shortcut Dimension 1 Code", "Location Code", "External Document No.")

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
                Visible = true;
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
                Visible = true;
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

        moveafter("Order Comment"; "Shipping Agent Code", "Payment Terms Code", "Amt. Ship. Not Inv. (LCY) Base", Amount)

        addafter(Amount)
        {
            field("No. Printed"; Rec."No. Printed")
            {
                Caption = 'No. Printed';
                ToolTip = 'No. Printed';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
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
            field("Modified By"; LookupUserId.UserId(Rec."SystemModifiedBy"))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
            field("Modified At"; Rec."SystemModifiedAt")
            {
                Caption = 'Modified At';
                ToolTip = 'Modified At';
                ApplicationArea = All;
                Editable = false;
                Visible = true;
            }
        }

        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
        }

        modify("Assigned User ID")
        {
            Visible = false;
        }

        modify("Completely Shipped")
        {
            Visible = false;
        }

        modify("Document Date")
        {
            Visible = false;
        }

        modify("Amt. Ship. Not Inv. (LCY)")
        {
            Visible = false;
        }

        modify("Amount Including VAT")
        {
            Visible = false;
        }

        modify("Shipment Date")
        {
            Visible = true;
        }

        modify("Ship-to Code")
        {
            Visible = true;
        }

        modify("Salesperson Code")
        {
            Visible = true;
        }

        modify("Shipping Agent Code")
        {
            Visible = true;
        }
        modify("Payment Terms Code")
        {
            Visible = true;
        }
    }

    actions
    {
        addbefore(Category_New)
        {
            group("Credit Hold")
            {
                Visible = true;
                Caption = 'Credit Hold';
                actionref("Remove from Hold"; "Remove Credit Hold")
                {
                }
                actionref("Add to Hold"; "Place On Credit Hold")
                {
                }
            }
        }
        addfirst("F&unctions")
        {
            action("Remove Credit Hold")
            {
                ToolTip = 'Removes the Credit hold on an Order.';
                Caption = 'Remove Credit Hold';
                Image = Report;
                ApplicationArea = All;
                trigger OnAction()
                var
                    SelectedOrders: Record "Sales Header";
                begin
                    CurrPage.SetSelectionFilter(SelectedOrders);

                    if SelectedOrders.FindSet() then
                        repeat
                            TorlysCreditHold.RemoveCreditHold(SelectedOrders, SelectedOrders)
                        until SelectedOrders.Next() = 0;
                end;
            }
            action("Place On Credit Hold")
            {
                ToolTip = 'Places selected Order(s) on Credit Hold.';
                Caption = 'Place On Credit Hold';
                Image = Report;
                ApplicationArea = All;
                trigger OnAction()
                var
                    SelectedOrders: Record "Sales Header";
                begin
                    CurrPage.SetSelectionFilter(SelectedOrders);

                    if SelectedOrders.FindSet() then
                        repeat
                            TorlysCreditHold.PlaceOnCreditHold(SelectedOrders, SelectedOrders)
                        until SelectedOrders.Next() = 0;
                end;
            }
        }
    }

    views
    {
        modify(ShippedNotInvoiced)
        {
            visible = false;
        }
        modify(SalesOrdersOpen)
        {
            visible = false;
        }
        modify(ReadyToShip)
        {
            visible = false;
        }
        modify(PartiallyShipped)
        {
            visible = false;
        }
        modify(Delayed)
        {
            visible = false;
        }
        modify(Released)
        {
            visible = false;
        }

        addlast
        {
            // view(Seperator1)
            // {
            //     Caption = '--------------------';
            // }
            view(CRHoldPast)
            {
                Caption = 'CR Hold - Past';
                Filters = where("Temporary Hold" = filter('No'), "Status" = const(Released), "On Hold" = filter('CR'), "Shipment Date" = filter('<T'));
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::"Accounts Receivable");
            }
            view(CRHoldToday)
            {
                Caption = 'CR Hold - Today';
                Filters = where("Temporary Hold" = filter('No'), "Status" = const(Released), "On Hold" = filter('CR'), "Shipment Date" = filter('T'));
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::"Accounts Receivable");
            }
            view(CRHoldTomorrow)
            {
                Caption = 'CR Hold - Tomorrow';
                Filters = where("Temporary Hold" = filter('No'), "Status" = const(Released), "On Hold" = filter('CR'), "Shipment Date" = filter('T+1D'));
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::"Accounts Receivable");
            }
            view(CRHoldFuture)
            {
                Caption = 'CR Hold - Future';
                Filters = where("Temporary Hold" = filter('No'), "Status" = const(Released), "On Hold" = filter('CR'), "Shipment Date" = filter('>T+1D'));
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::"Accounts Receivable");
            }
            view(CRHoldDirect)
            {
                Caption = 'CR Hold - DIRECT';
                Filters = where("Temporary Hold" = filter('No'), "Status" = const(Released), "On Hold" = filter('CR'), "Location Code" = filter('DIRECT'));
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::"Accounts Receivable");
            }
            // view(Seperator2)
            // {
            //     Caption = '--------------------';
            // }
            view(MKRequiredNotStaged0)
            {
                Caption = 'MK Required, Not Staged (0)';
                Filters = where("MK Required" = filter('Yes'), "MK Staged" = filter('No'), "No. Printed" = filter(0));
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::Sampling) or (UserDepartment = UserDepartment::"Warehouse TOR");
            }
            view(MKRequiredNotStagedNo0)
            {
                Caption = 'MK Required, Not Staged (>0)';
                Filters = where("MK Required" = filter('Yes'), "MK Staged" = filter('No'), "No. Printed" = filter(> 0));
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::Sampling) or (UserDepartment = UserDepartment::"Warehouse TOR");
            }
            view(MKRequiredStaged)
            {
                Caption = 'MK Required, Staged';
                Filters = where("MK Required" = filter('Yes'), "MK Staged" = filter('Yes'));
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::Sampling) or (UserDepartment = UserDepartment::"Warehouse TOR");
            }
            // view(Seperator3)
            // {
            //     Caption = '--------------------';
            // }
            view(ShipTodayNotReleased)
            {
                Caption = 'Ship Today, Not Released';
                Filters = where("Shipment Date" = filter('T'), "Status" = const(Open));
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::"Customer Serivce");
            }
            view(ShipTodayAll)
            {
                Caption = 'Ship Today, All';
                Filters = where("Shipment Date" = filter('T'));
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::"Customer Serivce");
            }
            view(ShipTomorrowAll)
            {
                Caption = 'Ship Tomorrow, All';
                Filters = where("Shipment Date" = filter('T+1D'));
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::"Customer Serivce");
            }
            view(TSSNotReleased)
            {
                Caption = 'TSS, Not Released';
                Filters = where("No." = filter('NTN*|SS*'), "Status" = const(Open));
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::"Customer Serivce");
            }
            // view(Seperator4)
            // {
            //     Caption = '--------------------';
            // }
            view(ToBeInvoiced)
            {
                Caption = 'To Be Invoiced';
                Filters = where("Shipped Not Invoiced" = filter('Yes'), "Shipment Date" = filter('<T'));
                OrderBy = ascending("Shipment Date", "Sell-to Customer No.", "Ship-to Code");
                Visible = (UserDepartment = UserDepartment::IT) or (UserDepartment = UserDepartment::"Accounts Receivable") or (UserDepartment = UserDepartment::"Warehouse CAL") or (UserDepartment = UserDepartment::"Warehouse TOR");
            }
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
        TorlysCreditHold: Codeunit TlyCreditHold;
        CollectorID: Code[20];
        UserDepartment: Enum TlyUserDepartment;

    protected var
        ShortcutDimCode: array[8] of Code[20];

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId) then
            UserDepartment := UserSetup.Department;
        // Message('%1', UserSetup."Default Location Code");
    end;

    trigger OnAfterGetRecord()
    var
        Customer: Record Customer;
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);

        Customer.Reset();
        if Rec."Sell-to Customer No." <> '' then begin
            Customer.Get(Rec."Sell-to Customer No.");
            CollectorID := Customer."Collector ID";
        end else begin
            CollectorID := '';
        end;
    end;
}