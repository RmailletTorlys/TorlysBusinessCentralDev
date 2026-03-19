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
    DataAccessIntent = ReadOnly;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(account_number; Rec."No.")
                {
                    Caption = 'Account Number';
                }
                field(shipToCode; Rec."Ship-to Code")
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

                field(Contact; Rec.Contact)
                {
                    Caption = 'Contact';
                }

                field(parent_account_number; Rec."Bill-to Customer No.")
                {
                    Caption = 'Parent Account Number';
                }

                field("Salesperson_Code"; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }

                field(Chain; Rec."Chain Name")
                {
                    Caption = 'Chain';
                }

                field(Gen_Bus_Posting_Group; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }

                field(Vat_Bus_Posting_Group; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                }

                field(Customer_Posting_Group; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                }

                field(Department; ShortcutDimCode[2])
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

                field(Torlys_Club; Rec.Club)
                {
                    Caption = 'Torlys Club';
                }

                field(Salesperson_Code_2; Rec."Salesperson Code 2")
                {
                    Caption = 'Salesperson Code 2';
                }

                field(Salesperson_Code_3; Rec."Salesperson Code 3")
                {
                    Caption = 'Salesperson Code 3';
                }

                field(DBA; Rec.DBA)
                {
                    Caption = 'DBA';
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