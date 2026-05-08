page 56101 salessiShipToAddress
{
    PageType = API;
    Caption = 'salesi Ship-to Address';
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesiShipToAddress';
    EntitySetName = 'salesiShipToAddresses';
    SourceTable = "Ship-to Address";
    SourceTableView = where("Customer No." = filter('<>Y-*&<>Z-*'), "Code" = filter('<>*SHOW&<>Y-*&<>Z-*'));
    DelayedInsert = true;
    Editable = false;
    DataAccessIntent = ReadOnly;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(account_number; Rec."Customer No.")
                {
                    Caption = 'Account Number';
                }

                field(ShipTo; Rec.Code)
                {
                    Caption = 'Ship-to Code';
                }

                field(Name; Rec.Name)
                {
                    Caption = 'Name';
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

                field(PostCode; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }

                field(Country; Rec."Country/Region Code")
                {
                    Caption = 'Country';
                }

                field(PhoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }

                field(FaxNo; '')
                {
                    Caption = 'Fax No.';
                }

                field(Email; '')
                {
                    Caption = 'E-Mail';
                }

                field(Website; '')
                {
                    Caption = 'Website';
                }

                field(Contact; '')
                {
                    Caption = 'Contact';
                }

                // field(parent_account_number; Customer."Bill-to Customer No.")
                field(parent_account_number; Rec."Customer No.")
                {
                    Caption = 'Parent Account Number';
                }

                field(Salesperson_Code; Customer."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }

                field(Chain; ShortcutDimCode[5])
                {
                    Caption = 'Chain Name';
                }

                field(Gen_Bus_Posting_Group; Customer."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }

                field(VAT_Bus_Posting_Group; Customer."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                }

                field(Customer_Posting_Group; Customer."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                }

                field(Department; ShortcutDimCode[1])
                {
                    Caption = 'Department';
                }

                field(Location; Rec."Location Code")
                {
                    Caption = 'Location';
                }

                field(Customer_Type; ShortcutDimCode[3])
                {
                    Caption = 'Customer Type';
                }

                field(Torlys_Club; Customer.Club)
                {
                    Caption = 'Torlys Club';
                }

                field(Salesperson_Code_2; Customer."Salesperson Code 2")
                {
                    Caption = 'Salesperson Code 2';
                }

                field(Salesperson_Code_3; Customer."Salesperson Code 3")
                {
                    Caption = 'Salesperson Code 3';
                }

                field(DBA; Customer.DBA)
                {
                    Caption = 'DBA';
                }
            }
        }
    }
    var
        Customer: Record Customer;
        ShortcutDimCode: array[8] of Code[20];

    trigger OnAfterGetRecord()
    begin
        Customer.Reset();
        Clear(ShortcutDimCode);
        if Rec."Customer No." <> '' then
            if Customer.Get(Rec."Customer No.") then
                Customer.ShowShortcutDimCode(ShortcutDimCode)
    end;
}
