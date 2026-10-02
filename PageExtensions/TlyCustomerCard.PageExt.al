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
                Editable = (UserDept = UserDept::"Accounts Receivable");
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
                Importance = Additional;
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }

            field("Salesperson Code 2"; Rec."Salesperson Code 2")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Code 2';
                Visible = true;
                ToolTip = 'This field is the second salesperson assigned to the customer account.';
                Importance = Additional;
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }

            field("Salesperson Commission 2"; Rec."Salesperson Commission 2")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Commission 2';
                Visible = true;
                ToolTip = 'This field is the commission percentage assigned to the second salesperson.';
                Importance = Additional;
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }

            field("Salesperson Code 3"; Rec."Salesperson Code 3")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Code 3';
                Visible = true;
                ToolTip = 'This field is the third salesperson assigned to the customer account.';
                Importance = Additional;
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }

            field("Salesperson Commission 3"; Rec."Salesperson Commission 3")
            {
                ApplicationArea = All;
                Caption = 'Salesperson Commission 3';
                Visible = true;
                ToolTip = 'This field is the commission percentage assigned to the third salesperson.';
                Importance = Additional;
                Editable = (UserDept = UserDept::"Accounts Receivable");
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
                Editable = (UserDept = UserDept::"Accounts Receivable");
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
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }

            field("Date Closed"; Rec."Date Closed")
            {
                ApplicationArea = All;
                Caption = 'Date Closed';
                Visible = true;
                ToolTip = 'This field is the date the customer account was closed.';
                Importance = Additional;
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }

        }

        moveafter("Date Closed"; "Blocked", "Balance (LCY)", "Balance Due (LCY)")

        addafter("Balance Due (LCY)")
        {
            field("Balance Due ($) - Bucket 1"; Rec."Balance Due (LCY) - Bucket 1")
            {
                ApplicationArea = All;
                Caption = 'Balance Due ($) - 1-30D';
                ToolTip = 'Balance Due ($) - 1-30D';
                DecimalPlaces = 2;
                Visible = true;
                Importance = Additional;
                Editable = false;
                trigger OnDrillDown()
                begin
                    Rec.OpenCustomerLedgerEntries(true);
                end;
            }
            field("Balance Due ($) - Bucket 2"; Rec."Balance Due (LCY) - Bucket 2")
            {
                ApplicationArea = All;
                Caption = 'Balance Due ($) - 31-60D';
                ToolTip = 'Balance Due ($) - 31-60D';
                DecimalPlaces = 2;
                Visible = true;
                Importance = Additional;
                Editable = false;
                trigger OnDrillDown()
                begin
                    Rec.OpenCustomerLedgerEntries(true);
                end;
            }
            field("Balance Due ($) - Bucket 3"; Rec."Balance Due (LCY) - Bucket 3")
            {
                ApplicationArea = All;
                Caption = 'Balance Due ($) - 61-90D';
                ToolTip = 'Balance Due ($) - 61-90D';
                DecimalPlaces = 2;
                Visible = true;
                Importance = Additional;
                Editable = false;
                trigger OnDrillDown()
                begin
                    Rec.OpenCustomerLedgerEntries(true);
                end;
            }
            field("Balance Due ($) - Bucket 4"; Rec."Balance Due (LCY) - Bucket 4")
            {
                ApplicationArea = All;
                Caption = 'Balance Due ($) - 91D+';
                ToolTip = 'Balance Due ($) - 91D+';
                DecimalPlaces = 2;
                Visible = true;
                Importance = Additional;
                Editable = false;
                trigger OnDrillDown()
                begin
                    Rec.OpenCustomerLedgerEntries(true);
                end;
            }
            field("Outstanding Orders"; Rec."Outstanding Orders")
            {
                ApplicationArea = All;
                Caption = 'Outstanding Orders';
                Visible = true;
                ToolTip = 'This field is the number of outstanding orders for the customer account.';
                Editable = false;
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
                Editable = false;
            }

            field("Credit Limit Modified By"; Rec."Credit Limit Modified By")
            {
                ApplicationArea = All;
                Caption = 'Credit Limit Modified By';
                Visible = true;
                ToolTip = 'This field is the user who last modified the credit limit.';
                Importance = Additional;
                Editable = false;
            }

            field("Prev. Credit Limit (LCY)"; Rec."Previous Credit Limit (LCY)")
            {
                ApplicationArea = All;
                Caption = 'Prev. Credit Limit (LCY)';
                Visible = true;
                ToolTip = 'This field is the previous credit limit of the customer account.';
                Importance = Additional;
                Editable = false;
            }

            field("Temp. Credit Limit (LCY)"; Rec."Temp. Credit Limit (LCY)")
            {
                ApplicationArea = All;
                Caption = 'Temp. Credit Limit (LCY)';
                Visible = true;
                ToolTip = 'This field is the temporary credit limit of the customer account.';
                Importance = Additional;
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }

            field("Temp. Credit Limit Expiry Date"; Rec."Temp. Credit Limit Expiry Date")
            {
                ApplicationArea = All;
                Caption = 'Temp. Credit Limit Expiry Date';
                Visible = true;
                ToolTip = 'This field is the date the temporary credit limit expires.';
                Importance = Additional;
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }
        }
        moveafter("Temp. Credit Limit Expiry Date"; "Document Sending Profile")

        addafter("Document Sending Profile")
        {
            field("SystemCreatedBy"; LookupUserId.UserId(Rec."SystemCreatedBy"))
            {
                ApplicationArea = All;
                Caption = 'Created By';
                Visible = true;
                ToolTip = 'This field is the user who created the customer account.';
                Importance = Additional;
                Editable = false;
            }

            field("SystemCreatedAt"; Rec."SystemCreatedAt")
            {
                ApplicationArea = All;
                Caption = 'Created At';
                Visible = true;
                ToolTip = 'This field is the date the customer account was created.';
                Importance = Additional;
                Editable = false;
            }

            field(SystemModifiedBy; LookupUserId.UserId(Rec.SystemModifiedBy))
            {
                Caption = 'Modified By';
                ToolTip = 'Modified By';
                ApplicationArea = All;
                Importance = Additional;
                Editable = false;
            }
            field("SystemModifiedAt"; Rec."SystemModifiedAt")
            {
                ApplicationArea = All;
                Caption = 'Modified At';
                Visible = true;
                ToolTip = 'This field is the date the customer account was last modified.';
                Importance = Additional;
                Editable = false;
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
                Editable = (UserDept = UserDept::"Accounts Receivable");
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
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }
        }

        moveafter("Credit Warnings"; "Tax Liable", "Tax Area Code", "Tax Identification Type", "Registration Number", "VAT Registration No.", "Tax Exemption No.")

        addafter("Customer Posting Group")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Global Dimension 1 Code';
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Global Dimension 2 Code';
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }
        }

        movefirst(PricesandDiscounts; "Customer Price Group")

        addafter("Customer Price Group")
        {
            field("Default Price List Code"; Rec."Default Price List Code")
            {
                ApplicationArea = All;
                Caption = 'Default Price List Code';
                Visible = true;
                ToolTip = 'This field is the default price list assigned to the customer account.';
                Editable = (UserDept = UserDept::IT);
            }
            field("Remove Regular Price On PL"; Rec."Remove Regular Price On PL")
            {
                ApplicationArea = All;
                Caption = 'Remove Regular Price On PL';
                Visible = true;
                ToolTip = 'Remove Regular Price On PL';
                Editable = (UserDept = UserDept::IT);
            }
            field("Full Pallet Price On PL"; Rec."Stocking Pallet Price On PL")
            {
                ApplicationArea = All;
                Caption = 'Full Pallet Price On PL';
                Visible = true;
                ToolTip = 'Full Pallet Price On PL';
                Editable = (UserDept = UserDept::IT);
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
                Editable = (UserDept = UserDept::"Customer Serivce");
            }

            field("Restocking Fee Minimum"; Rec."Restocking Fee Minimum")
            {
                ApplicationArea = All;
                Caption = 'Restocking Fee Minimum';
                DecimalPlaces = 2;
                ToolTip = 'Specifies the minimum amount of the item that is restocked when the item is restocked.';
                Editable = (UserDept = UserDept::"Customer Serivce");
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
                    Editable = (UserDept = UserDept::"Accounts Receivable");
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
                    Editable = (UserDept = UserDept::Marketing);
                }

                field("Power Up Level"; Rec."Power Up Level")
                {
                    ApplicationArea = All;
                    Caption = 'Power Up Level';
                    ToolTip = 'Specifies the level of the power up.';
                    Editable = (UserDept = UserDept::Marketing);
                }

                field("Program Fees Amount (LCY)"; Rec."Program Fees Amount (LCY)")
                {
                    ApplicationArea = All;
                    Caption = 'Program Fees Amount';
                    DecimalPlaces = 2;
                    ToolTip = 'Specifies the amount of the program fees that you have paid for the customer.';
                    Editable = (UserDept = UserDept::Marketing);
                }

                field("Co-op Entitlement %"; Rec."Co-op Entitlement %")
                {
                    ApplicationArea = All;
                    Caption = 'Co-op Entitlement %';
                    DecimalPlaces = 2 : 1;
                    ToolTip = 'Specifies the percentage of the customer''s total payment that is allocated to the customer''s co-op.';
                    Editable = (UserDept = UserDept::Marketing);
                }

                field("Sample Allowance %"; Rec."Sample Allowance %")
                {
                    ApplicationArea = All;
                    Caption = 'Sample Allowance %';
                    DecimalPlaces = 2 : 1;
                    ToolTip = 'Specifies the percentage of the customer''s total payment that is allocated to the customer''s sample.';
                    Editable = (UserDept = UserDept::Marketing);
                }
                field("Marketing Items Zero Charge"; Rec."Marketing Items Zero Charge")
                {
                    ApplicationArea = All;
                    Caption = 'Marketing Items Zero Charge';
                    Editable = false;
                    ToolTip = 'Marketing Items Zero Charge';
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
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }

            field("On Hold Count"; Rec."On Hold Count")
            {
                ApplicationArea = All;
                Caption = 'On Hold Count';
                ToolTip = 'Specifies the number of times that the customer has been put on hold.';
                Importance = Additional;
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }

            field("NSF Count"; Rec."NSF Count")
            {
                ApplicationArea = All;
                Caption = 'NSF Count';
                ToolTip = 'Specifies the number of times that the customer has been marked with NSF cheques.';
                Importance = Additional;
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }
        }

        moveafter("Ship-to Code"; "Location Code", "Shipment Method Code", "Shipping Agent Code", "Shipping Agent Service Code", "Reserve", "Shipping Advice")

        addafter("Shipping Advice")
        {
            field("Freight Zone Code"; Rec."Freight Zone Code")
            {
                ApplicationArea = All;
                Caption = 'Freight Zone Code';
                ToolTip = 'Specifies the freight zone that the customer is assigned to.';
                Visible = false;
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }
            field("Shipping Instructions"; Rec."Shipping Instructions")
            {
                ApplicationArea = All;
                Caption = 'Shipping Instructions';
                ToolTip = 'Shipping Instructions';
                Visible = false;
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }
            field("Shipping Comment"; Rec."Shipping Comment")
            {
                ApplicationArea = All;
                Caption = 'Shipping Comment';
                ToolTip = 'Shipping Comment';
                Visible = false;
                Editable = (UserDept = UserDept::"Accounts Receivable");
            }
        }

        moveafter("Shipping Comment"; "Shipping Time")

        //start of fields that are visible on the screen therefore need the Editable property
        modify("No.")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Name")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Search Name")
        {
            ApplicationArea = All;
            Visible = true;
            ToolTip = 'This field is the name of the customer account.';
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Salesperson Code")
        {
            Importance = Standard;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify(Blocked)
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Balance (LCY)")
        {
            Caption = 'Total Balance ($)';
            Editable = false;
        }

        modify("Credit Limit (LCY)")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Document Sending Profile")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("NTN Web Enabled")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("NTN Order Processing")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("NTN Catalog Group Code")
        {
            Editable = (UserDept = UserDept::"IT");
        }

        modify("NTN Head Office")
        {
            Editable = (UserDept = UserDept::"IT");
        }

        modify("NTN Head Office Cust. No.")
        {
            Editable = (UserDept = UserDept::"IT");
        }

        modify("Address")
        {
            Importance = Promoted;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Address 2")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("City")
        {
            Importance = Promoted;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("County")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Country/Region Code")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Post Code")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify(ShowMap)
        {
            Importance = Additional;
            Editable = false;
        }

        modify("Phone No.")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify(MobilePhoneNo)
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Fax No.")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Primary Contact No.")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify(ContactName)
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Language Code")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Bill-to Customer No.")
        {
            Importance = Promoted;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Tax Liable")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Tax Area Code")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Tax Identification Type")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Registration Number")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("VAT Registration No.")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Tax Exemption No.")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Gen. Bus. Posting Group")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Customer Posting Group")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Customer Price Group")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Currency Code")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Application Method")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Payment Terms Code")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Payment Method Code")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Print Statements")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Last Statement No.")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Block Payment Tolerance")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Ship-to Code")
        {
            Importance = Promoted;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Location Code")
        {
            Importance = Promoted;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Shipment Method Code")
        {
            Visible = false;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Shipping Agent Code")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Shipping Agent Service Code")
        {
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Reserve")
        {
            Visible = false;
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Shipping Advice")
        {
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }

        modify("Shipping Time")
        {
            Visible = false;
            Importance = Additional;
            Editable = (UserDept = UserDept::"Accounts Receivable");
        }
        //end of fields that are visible on the screen therefore need the Editable property

        modify("E-Mail")
        {
            Visible = false;
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

        modify("NTN Login Template")
        {
            Visible = false;
        }

        modify("NTN NAV Created Date")
        {
            Visible = false;
        }

        modify("NTN NAV Modified Date")
        {
            Visible = false;
        }

        modify("NTN Previously Modified Date")
        {
            Visible = false;
        }

        modify("NTN NAV Modified by")
        {
            Visible = false;
        }

        modify("SCX Residential")
        {
            Visible = false;
        }

        modify("SCX Fields")
        {
            Visible = false;
        }
    }

    actions
    {
        addafter(ShipToAddresses_Promoted)
        {
            actionref(Displays_Promoted; Displays)
            { }
        }

        addafter("Item References_Promoted")
        {
            actionref(ChangeLog; "Change Log")
            { }
        }

        addfirst(Category_Report)
        {
            actionref(SendStatementReview1; SendStatementReview)
            { }
        }

        addlast(processing)
        {
            // action(SendStatementReview)
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Print/Send Statement';
            //     Image = Email;

            //     trigger OnAction()
            //     var
            //         Cust: Record Customer;
            //         Choice: Integer;
            //         Options: Label 'Email,Print/Preview,Cancel';
            //         ReportId: Integer;
            //         Params: Text;
            //         RecRef: RecordRef;
            //         TmpBlob: Codeunit "Temp Blob";
            //         InStr: InStream;
            //         Email: Codeunit Email;
            //         EmailMsg: Codeunit "Email Message";
            //         FileName: Text;
            //         SubjectTxt: Text;
            //         BodyHtml: Text;
            //         ToAddr: Text;
            //         Rendered: Boolean;
            //         Err: Text;
            //         outstr: OutStream;
            //     begin
            //         Cust.Get(Rec."No.");
            //         ReportId := 50036;

            //         Choice := StrMenu(Options, 1);

            //         if Choice = 3 then
            //             exit;



            //         Cust.SetRange("No.", Rec."No.");
            //         RecRef.GetTable(Cust);

            //         Params := Report.RunRequestPage(ReportId);
            //         if Params = '' then
            //             exit;

            //         case Choice of
            //             1:
            //                 begin
            //                     // EMAIL FLOW (your existing logic)
            //                     Clear(TmpBlob);
            //                     TmpBlob.CreateOutStream(OutStr);
            //                     Rendered := TryRenderToPdf(ReportId, Params, RecRef, TmpBlob, Err);
            //                     if not Rendered then
            //                         Error('Could not render Customer Statement. Details: %1', Err);


            //                     TmpBlob.CreateInStream(InStr);

            //                     ToAddr := Cust."E-Mail";
            //                     if ToAddr = '' then
            //                         Error('Customer %1 has no email address.', Cust."No.");

            //                     SubjectTxt := StrSubstNo('Statement for %1 (%2)', Cust.Name, Cust."No.");
            //                     BodyHtml :=
            //                         StrSubstNo(
            //                             '<p>Hello %1,</p>' +
            //                             '<p>Please find your latest account statement attached.</p>' +
            //                             '<p>Regards,<br/>%2</p>',
            //                             Cust.Name, UserId());

            //                     FileName := StrSubstNo('Statement_%1_%2.pdf', Cust."No.", Format(Today(), 0, 9));

            //                     EmailMsg.Create(ToAddr, SubjectTxt, BodyHtml, true);
            //                     EmailMsg.AddAttachment(FileName, 'application/pdf', InStr);

            //                     Email.OpenInEditor(EmailMsg);
            //                 end;

            //             2:
            //                 begin
            //                     // PRINT / PREVIEW / EXPORT FLOW
            //                     Report.RunModal(ReportId, true, false, Cust);
            //                     // Report.Execute(ReportId, Params, RecRef);
            //                 end;
            //         end;
            //     end;
            // }
            action(SendStatementReview)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Print/Send Statement';
                Image = Email;

                trigger OnAction()
                var
                    Cust: Record Customer;
                    Params: Text;
                    TmpBlob: Codeunit "Temp Blob";
                    InStr: InStream;
                    Choice: Integer;
                    OutStr: OutStream;
                    Email: Codeunit Email;
                    EmailMsg: Codeunit "Email Message";
                    SubjectTxt: Text;
                    BodyHtml: Text;
                    Options: Label 'Email,Print/Preview,Cancel';
                    // Must use a report variable
                    StatementReport: Report "Customer Statements TLY";
                begin
                    if not Cust.Get(Rec."No.") then exit;

                    Choice := StrMenu(Options, 1);
                    if (Choice = 0) or (Choice = 3) then exit;

                    // 1. Apply filter to the record
                    Cust.SetRange("No.", Rec."No.");

                    // 2. Get parameters from the request page
                    // Passing Cust.GetView() ensures the filter stays in the XML
                    // Params := StatementReport.RunRequestPage(Cust.GetFilters());
                    // if Params = '' then exit;

                    // Clear(StatementReport);

                    case Choice of
                        1: // EMAIL
                            begin
                                Params := StatementReport.RunRequestPage(Cust.GetFilters());
                                if Params = '' then exit;
                                Clear(StatementReport);
                                Clear(TmpBlob);
                                TmpBlob.CreateOutStream(OutStr);

                                // Call SaveAs on the INSTANCE, not the static Report object
                                StatementReport.SaveAs(Params, ReportFormat::Pdf, OutStr);

                                TmpBlob.CreateInStream(InStr);
                                SubjectTxt := StrSubstNo('Statement for %1 (%2)', Cust.Name, Cust."No.");
                                BodyHtml :=
                                    StrSubstNo(
                                        '<p>Hello %1,</p>' +
                                        '<p>Please find your latest account statement attached.</p>' +
                                        '<p>Regards,<br/>%2</p>',
                                        Cust.Name, UserId());
                                EmailMsg.Create(Cust."E-Mail", SubjectTxt, BodyHtml, true);
                                EmailMsg.AddAttachment('Statement.pdf', 'application/pdf', InStr);
                                Email.OpenInEditorModally(EmailMsg);
                            end;

                        2: // PRINT / PREVIEW
                            begin
                                // Execute handles both the XML parameters and the UI flow
                                // StatementReport.Execute(Params);
                                // Report.Run(Report::"Customer Statements TLY", true, false, Cust);
                                // if not Cust.Get(Rec."No.") then exit;

                                // 2. Apply the filter so the Request Page knows which customer to show
                                // Cust.SetRange("No.", Rec."No.");

                                // 3. Run the report directly
                                // Parameter 1: Report ID
                                // Parameter 2: TRUE (This shows the standard Request Page with Preview/Print/Email)
                                // Parameter 3: FALSE (Don't force it to a specific system printer)
                                // Parameter 4: Cust (Passes the filtered record)
                                Report.Run(Report::"Customer Statements TLY", true, false, Cust);
                            end;
                    end;
                end;
            }
        }

        addafter(ShipToAddresses)
        {
            action(Displays)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Customer Displays';
                Image = Database;
                RunObject = Page TlyCustomerDisplays;
                RunPageLink = "Customer No." = field("No.");
                ToolTip = 'View or edit customer display programs for this customer.';
            }
        }

        addafter("Item References")
        {
            action("Change Log")
            {
                Caption = 'Change Log';
                ToolTip = 'Change Log';
                ApplicationArea = All;
                Image = ChangeLog;
                RunObject = Page "Change Log Entries";
                RunPageLink = "Primary Key Field 1 Value" = field("No.");
            }
        }

        modify("Report Statement_Promoted")
        {
            Visible = false;
        }
    }

    var
        LookupUserId: Codeunit TlyLookupUserID;
        ShortcutDimCode: array[8] of Code[20];
        CustLedgEntry: Record "Cust. Ledger Entry";
        DocumentMailing: Codeunit "Document-Mailing";
        R: Report 10072;
        UserSetup: Record "User Setup";
        UserDept: Enum TlyUserDepartment;

    trigger OnOpenPage()
    begin
        Rec.SetRange(Rec."Bucket 1 Filter", WorkDate() - 30, WorkDate() - 1);
        Rec.SetRange(Rec."Bucket 2 Filter", WorkDate() - 60, WorkDate() - 31);
        Rec.SetRange(Rec."Bucket 3 Filter", WorkDate() - 90, WorkDate() - 61);
        Rec.SetRange(Rec."Bucket 4 Filter", 0D, WorkDate() - 91);

        //TLY-SD - 10/01/2026 - start
        //change from page level security to field level security
        // CurrPage.Editable := false;

        // if UserSetup.Get(UserId) then begin
        //     if (UserSetup.Department = UserSetup.Department::IT) or (UserSetup.Department = UserSetup.Department::"Accounts Receivable") then
        //         CurrPage.Editable := true;
        // end;
        CurrPage.Editable := true;

        if UserSetup.Get(UserId) then begin
            UserDept := UserSetup.Department;
        end;
        //TLY-SD - 10/01/2026 - end
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    local procedure ValidateShortcutDimension(DimIndex: Integer)
    var
    begin
        Rec.ValidateShortcutDimCode(DimIndex, ShortcutDimCode[DimIndex]);
    end;

    [TryFunction]
    local procedure RenderToPdfInternal(ReportId: Integer; RequestPageXml: Text; RecRef: RecordRef; var TmpBlob: Codeunit "Temp Blob")
    var
        OutStr: OutStream;
    begin
        TmpBlob.CreateOutStream(OutStr);

        Report.SaveAs(
            ReportId,
            RequestPageXml,
            ReportFormat::Pdf,
            OutStr,
            RecRef);
    end;

    local procedure TryRenderToPdf(ReportId: Integer; RequestPageXml: Text; RecRef: RecordRef; var TmpBlob: Codeunit "Temp Blob"; var ErrorText: Text): Boolean
    begin
        if RenderToPdfInternal(ReportId, RequestPageXml, RecRef, TmpBlob) then
            exit(true);

        ErrorText := GetLastErrorText();
        exit(false);
    end;
}