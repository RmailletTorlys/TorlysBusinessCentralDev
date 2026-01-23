
pageextension 50021 TlyCustomerCard extends "Customer Card"
{

    layout
    {
        moveafter("No."; Name, "Search Name")
        addafter("Search Name")
        {
            field("Collector ID"; Rec."Collector ID")
            {
                ApplicationArea = All;
                Caption = 'Collector ID';
                Visible = true;
                ToolTip = 'This field is the Primary Credit Collector assigned to the customer account.';
            }
        }

        moveafter("Collector ID"; "Salesperson Code")

        addafter("Salesperson Code")
        {
            field("Salesperson Commission"; Rec."Salesperson Commission")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Commission';
                Visible = true;
                ToolTip = 'This field is the commission percentage assigned to the salesperson.';

            }

            field("Salesperson Code 2"; Rec."Salesperson Code 2")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Code 2';
                Visible = true;
                ToolTip = 'This field is the second salesperson assigned to the customer account.';
                Importance = Additional;
            }

            field("Salesperson Commission 2"; Rec."Salesperson Commission 2")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Commission 2';
                Visible = true;
                ToolTip = 'This field is the commission percentage assigned to the second salesperson.';
                Importance = Additional;
            }

            field("Salesperson Code 3"; Rec."Salesperson Code 3")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Code 3';
                Visible = true;
                ToolTip = 'This field is the third salesperson assigned to the customer account.';
                Importance = Additional;
            }

            field("Salesperson Commission 3"; Rec."Salesperson Commission 3")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Commission 3';
                Visible = true;
                ToolTip = 'This field is the commission percentage assigned to the third salesperson.';
                Importance = Additional;
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
                Importance = Additional;

                trigger OnValidate()
                begin
                    ValidateShortcutDimension(3);
                end;
            }

            field("Date Opened"; Rec."Date Opened")
            {
                ApplicationArea = All;
                Caption = 'Date Opened';
                Visible = true;
                ToolTip = 'This field is the date the customer account was opened.';
                Importance = Additional;
            }

            field("Date Closed"; Rec."Date Closed")
            {
                ApplicationArea = All;
                Caption = 'Date Closed';
                Visible = true;
                ToolTip = 'This field is the date the customer account was closed.';
                Importance = Additional;
            }

        }

        moveafter("Date Closed"; "Blocked", "Balance (LCY)", "Balance Due (LCY)")

        addafter("Balance Due (LCY)")
        {
            field("Outstanding Orders"; Rec."Outstanding Orders")
            {
                ApplicationArea = All;
                Caption = 'Outstanding Orders';
                Visible = true;
                ToolTip = 'This field is the number of outstanding orders for the customer account.';
            }
        }

        moveafter("Outstanding Orders"; "Credit Limit (LCY)")
        addafter("Credit Limit (LCY)")
        {
            field("Credit Limit Modified Date"; Rec."Credit Limit Modified Date")
            {
                ApplicationArea = All;
                Caption = 'Credit Limit Modified Date';
                Visible = true;
                ToolTip = 'This field is the date the credit limit was last modified.';
                Importance = Additional;
            }

            field("Credit Limit Modified By"; Rec."Credit Limit Modified By")
            {
                ApplicationArea = All;
                Caption = 'Credit Limit Modified By';
                Visible = true;
                ToolTip = 'This field is the user who last modified the credit limit.';
                Importance = Additional;
            }

            field("Prev. Credit Limit (LCY)"; Rec."Previous Credit Limit (LCY)")
            {
                ApplicationArea = All;
                Caption = 'Prev. Credit Limit (LCY)';
                Visible = true;
                ToolTip = 'This field is the previous credit limit of the customer account.';
                Importance = Additional;
            }

            field("Temp. Credit Limit (LCY)"; Rec."Temp. Credit Limit (LCY)")
            {
                ApplicationArea = All;
                Caption = 'Temp. Credit Limit (LCY)';
                Visible = true;
                ToolTip = 'This field is the temporary credit limit of the customer account.';
                Importance = Additional;
            }

            field("Temp. Credit Limit Expiry Date"; Rec."Temp. Credit Limit Expiry Date")
            {
                ApplicationArea = All;
                Caption = 'Temp. Credit Limit Expiry Date';
                Visible = true;
                ToolTip = 'This field is the date the temporary credit limit expires.';
                Importance = Additional;
            }

            field("SystemCreatedBy"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                ApplicationArea = All;
                Caption = 'Created By';
                Visible = true;
                ToolTip = 'This field is the user who created the customer account.';
                Importance = Additional;
            }

            field("SystemCreatedAt"; Rec."SystemCreatedAt")
            {
                ApplicationArea = All;
                Caption = 'Created At';
                Visible = true;
                ToolTip = 'This field is the date the customer account was created.';
                Importance = Additional;
            }

            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Importance = Additional;
            }
            field("SystemModifiedAt"; Rec."SystemModifiedAt")
            {
                ApplicationArea = All;
                Caption = 'Modified At';
                Visible = true;
                ToolTip = 'This field is the date the customer account was last modified.';
                Importance = Additional;
            }
        }

        moveafter("Address 2"; "City", "County", "Country/Region Code", "Post Code", ShowMap, "Phone No.")

        addafter("Phone No.")
        {
            field("Website"; Rec."Home Page")
            {
                ApplicationArea = All;
                Caption = 'Website';
                ToolTip = 'This field is the website of the customer account.';
            }
        }


        moveafter(Website; MobilePhoneNo, "Fax No.", "E-Mail", "Language Code")

        addafter("Bill-to Customer No.")
        {
            field("Credit Warnings"; Rec."Credit Warnings")
            {
                ApplicationArea = All;
                Caption = 'Credit Warnings';
                ToolTip = 'Specifies the number of times that the customer''s credit limit has been exceeded.';
            }
        }

        moveafter("Credit Warnings"; "Tax Liable", "Tax Area Code", "Tax Identification Type", "Registration Number", "VAT Registration No.", "Tax Exemption No.")

        addafter("Customer Posting Group")

        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Global Dimension 1 Code';
            }
        }

        addfirst(PricesandDiscounts)
        {
            field("Default Price List Code"; Rec."Default Price List Code")
            {
                ApplicationArea = All;
                Caption = 'Default Price List Code';
                Visible = true;
                ToolTip = 'This field is the default price list assigned to the customer account.';
            }
            field("Display Regular Price On PL"; Rec."Display Regular Price On PL")
            {
                ApplicationArea = All;
                Caption = 'Display Regular Price On PL';
                Visible = true;
                ToolTip = 'Display Regular Price On PL';
            }
        }

        addafter("Currency Code")
        {
            field("Restocking Fee %"; Rec."Restocking Fee %")
            {
                ApplicationArea = All;
                Caption = 'Restocking Fee %';
                DecimalPlaces = 2 : 1;
                ToolTip = 'Specifies the percentage of the item that is restocked when the item is restocked.';
            }

            field("Restocking Fee Minimum"; Rec."Restocking Fee Minimum")
            {
                ApplicationArea = All;
                Caption = 'Restocking Fee Minimum';
                DecimalPlaces = 2;
                ToolTip = 'Specifies the minimum amount of the item that is restocked when the item is restocked.';
            }

            group(Marketing)
            {
                Caption = 'Marketing';

                field(ShortcutDimCode5; ShortcutDimCode[5])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,5';
                    ToolTip = 'Global Dimension 5 Code';
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5),
                                                                "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = true;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimension(5);
                    end;
                }

                field("Club"; Rec."Club")
                {
                    ApplicationArea = All;
                    CaptionClass = 'Club';
                    ToolTip = 'Club';
                    Visible = true;
                }

                field("Power Up Level"; Rec."Power Up Level")
                {
                    ApplicationArea = All;
                    Caption = 'Power Up Level';
                    ToolTip = 'Specifies the level of the power up.';
                }

                field("Program Fees Amount (LCY)"; Rec."Program Fees Amount (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Program Fees Amount';
                    DecimalPlaces = 2;
                    ToolTip = 'Specifies the amount of the program fees that you have paid for the customer.';
                }

                field("Co-op Entitlement %"; Rec."Co-op Entitlement %")
                {
                    ApplicationArea = All;
                    Caption = 'Co-op Entitlement %';
                    DecimalPlaces = 2 : 1;
                    ToolTip = 'Specifies the percentage of the customer''s total payment that is allocated to the customer''s co-op.';
                }

                field("Sample Allowance %"; Rec."Sample Allowance %")
                {
                    ApplicationArea = All;
                    Caption = 'Sample Allowance %';
                    DecimalPlaces = 2 : 1;
                    ToolTip = 'Specifies the percentage of the customer''s total payment that is allocated to the customer''s sample.';
                }
            }

        }

        movefirst(Payments; "Application Method", "Payment Terms Code", "Payment Method Code", "Print Statements", "Last Statement No.", "Block Payment Tolerance")

        addafter("Block Payment Tolerance")
        {
            field("A/R Notes"; Rec."A/R Notes")
            {
                ApplicationArea = All;
                Caption = 'A/R Notes';
                ToolTip = 'Specifies the notes that you have entered for the customer.';
                Importance = Additional;
            }

            field("On Hold Count"; Rec."On Hold Count")
            {
                ApplicationArea = All;
                Caption = 'On Hold Count';
                ToolTip = 'Specifies the number of times that the customer has been put on hold.';
                Importance = Additional;
            }

            field("NSF Count"; Rec."NSF Count")
            {
                ApplicationArea = All;
                Caption = 'NSF Count';
                ToolTip = 'Specifies the number of times that the customer has been marked with NSF cheques.';
                Importance = Additional;
            }
        }

        moveafter("Ship-to Code"; "Location Code", "Reserve", "Shipping Advice")

        addafter("Shipping Agent Code")
        {
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                ApplicationArea = All;
                Caption = 'Freight Zone Code';
                ToolTip = 'Specifies the freight zone that the customer is assigned to.';
            }
            field("Shipping Instructions"; Rec."Shipping Instructions")
            {
                ApplicationArea = All;
                Caption = 'Shipping Instructions';
                ToolTip = 'Shipping Instructions';
            }
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                ApplicationArea = All;
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
            }
        }

        moveafter("Shipping Comment"; "Shipping Time")

        modify(Blocked)
        {
            Importance = Additional;
        }

        modify("Country/Region Code")
        {
            Importance = Additional;
        }

        modify(MobilePhoneNo)
        {
            Importance = Additional;
        }

        modify(County)
        {
            Importance = Additional;
        }

        modify("Post Code")
        {
            Importance = Additional;
        }

        modify(ShowMap)
        {
            Importance = Additional;
        }

        modify("Fax No.")
        {
            Importance = Additional;
        }

        modify("E-Mail")
        {
            Importance = Additional;
        }

        modify("Language Code")
        {
            Importance = Additional;
        }

        modify("Primary Contact No.")
        {
            Importance = Additional;
        }

        modify(ContactName)
        {
            Importance = Additional;
        }

        modify("Search Name")
        {
            ApplicationArea = All;
            Visible = true;
            ToolTip = 'This field is the name of the customer account.';
        }

        modify("IC Partner Code")
        {
            Visible = false;
        }
        modify(BalanceAsVendor)
        {
            Visible = false;
        }
        modify("Privacy Blocked")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Document Sending Profile")
        {
            Visible = false;
        }
        modify(TotalSales2)
        {
            Visible = false;
        }
        modify(AdjCustProfit)
        {
            Visible = false;
        }
        modify(AdjProfitPct)
        {
            Visible = false;
        }
        modify("Last Date Modified")
        {
            Visible = false;
        }
        modify("Disable Search by Name")
        {
            Visible = false;
        }
        modify("Home Page")
        {
            Visible = false;
        }
        modify("Format Region")
        {
            Visible = false;
        }
        modify(GLN)
        {
            Visible = false;
        }
        modify("Use GLN in Electronic Document")
        {
            Visible = false;
        }
        modify("Copy Sell-to Addr. to Qte From")
        {
            Visible = false;
        }
        modify("Price Calculation Method")
        {
            Visible = false;
        }
        modify("Customer Price Group")
        {
            Visible = false;
        }
        modify("Customer Disc. Group")
        {
            Visible = false;
        }
        modify("Allow Line Disc.")
        {
            Visible = false;
        }
        modify("Invoice Disc. Code")
        {
            Visible = false;
        }
        modify("Prepayment %")
        {
            Visible = false;
        }
        modify("Partner Type")
        {
            Visible = false;
        }
        modify("Intrastat Partner Type")
        {
            Visible = false;
        }
        modify("Reminder Terms Code")
        {
            Visible = false;
        }
        modify("Fin. Charge Terms Code")
        {
            Visible = false;
        }
        modify("Cash Flow Payment Terms Code")
        {
            Visible = false;
        }
        modify("Preferred Bank Account Code")
        {
            Visible = false;
        }
        modify("Bank Communication")
        {
            Visible = false;
        }
        modify("Check Date Format")
        {
            Visible = false;
        }
        modify("Check Date Separator")
        {
            Visible = false;
        }
        modify("Exclude from Pmt. Practices")
        {
            Visible = false;
        }
        modify("Shipping Agent Service Code")
        {
            Visible = false;
        }
        modify("Base Calendar Code")
        {
            Visible = false;
        }
        modify("Customized Calendar")
        {
            Visible = false;
        }
        modify("Combine Shipments")
        {
            Visible = false;
        }
        modify("CustSalesLCY - CustProfit - AdjmtCostLCY")
        {
            Visible = false;
        }
        modify("Address")
        {
            Importance = Promoted;
        }
        modify("City")
        {
            Importance = Promoted;
        }
        modify("Bill-to Customer No.")
        {
            Importance = Promoted;
        }
        modify("Application Method")
        {
            Importance = Additional;
        }
        modify("Payment Method Code")
        {
            Importance = Additional;
        }
        modify("Print Statements")
        {
            Importance = Additional;
        }
        modify("Last Statement No.")
        {
            Importance = Additional;
        }
        modify("Block Payment Tolerance")
        {
            Importance = Additional;
        }
        modify("Ship-to Code")
        {
            Importance = Promoted;
        }
        modify("Location Code")
        {
            Importance = Promoted;
        }
        modify("Reserve")
        {
            Importance = Additional;
        }
        modify("Shipping Advice")
        {
            Importance = Additional;
        }
        modify("Shipping Time")
        {
            Importance = Additional;
        }
        modify("Registration Number")
        {
            Importance = Additional;
        }
    }

    actions
    {
        addafter(ShipToAddresses)
        {
            action(Displays)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer Displays';
                Image = Database;
                RunObject = Page TlyCustomerDisplayList;
                RunPageLink = "CustNo." = field("No.");
                ToolTip = 'View or edit customer display programs for this customer.';
            }
        }

        addafter(ShipToAddresses_Promoted)
        {
            actionref(Displays_Promoted; Displays) { }
        }
    }

    protected var
        ShortcutDimCode: array[8] of Code[20];

    var
        LookupUserId: Codeunit TlyLookupUserID;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    local procedure ValidateShortcutDimension(DimIndex: Integer)
    var
    begin
        Rec.ValidateShortcutDimCode(DimIndex, ShortcutDimCode[DimIndex]);
    end;
}