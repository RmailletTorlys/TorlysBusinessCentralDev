page 56100 salesiCustomer
{
    PageType = API;
    Caption = 'salesi Customer';
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesiCustomer';
    EntitySetName = 'salesiCustomers';
    SourceTable = "Customer";
    SourceTableView = where("No." = filter('<>Y-*&<>Z-*'));
    DelayedInsert = true;
    Editable = false;
    DataAccessIntent = ReadOnly;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(CustomerNo; Rec."No.")
                {
                    Caption = 'Customer No.';
                }

                field(DefaultShipToCode; Rec."Ship-to Code")
                {
                    Caption = 'Default Ship-to Code';
                }

                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                }

                field(DBA; Rec.DBA)
                {
                    Caption = 'DBA';
                }

                field(Address1; Rec.Address)
                {
                    Caption = 'Address 1';
                }

                field(Address2; Rec."Address 2")
                {
                    Caption = 'Address 2';
                }

                field(City; Rec.City)
                {
                    Caption = 'City';
                }

                field(County; Rec.County)
                {
                    Caption = 'County';
                }

                field(Country; Rec."Country/Region Code")
                {
                    Caption = 'Country';
                }

                field(PostCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }

                field(PhoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }

                field(FaxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                }

                field(Email; Rec."E-Mail")
                {
                    Caption = 'Email';
                }

                field(Website; Rec."Home Page")
                {
                    Caption = 'Website';
                }

                // field(Contact; '')
                // {
                //     Caption = 'Contact';
                // }

                field(BillToCustomerNo; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                }

                field(SalespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }

                field(SalespersonCode2; Rec."Salesperson Code 2")
                {
                    Caption = 'Salesperson Code 2';
                }

                field(SalespersonCode3; Rec."Salesperson Code 3")
                {
                    Caption = 'Salesperson Code 3';
                }

                field(BuyingGroup; ShortcutDimCode[5])
                {
                    Caption = 'Buying Group';
                }

                // field(Gen_Bus_Posting_Group; '')
                // {
                //     Caption = 'Gen. Bus. Posting Group';
                // }

                // field(Vat_Bus_Posting_Group; '')
                // {
                //     Caption = 'VAT Bus. Posting Group';
                // }

                // field(Customer_Posting_Group; Rec."Customer Posting Group")
                // {
                //     Caption = 'Customer Posting Group';
                // }

                field(Region; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Region';
                }

                field(Location; Rec."Location Code")
                {
                    Caption = 'Location';
                }

                field(Channel; ShortcutDimCode[3])
                {
                    Caption = 'Channel';
                }

                field(Torlys_Club; Rec.Club)
                {
                    Caption = 'Club';
                }
            }
        }
    }

    var
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;
}