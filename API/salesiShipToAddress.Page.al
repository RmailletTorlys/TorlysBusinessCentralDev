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
    DelayedInsert = true;

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

                field(FaxNo; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                }

                field(Email; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                }

                field(Website; Rec."Home Page")
                {
                    Caption = 'Website';
                }

                field(Contact; Rec.Contact)
                {
                    Caption = 'Contact';
                }

                field(parent_account_number; Rec."Customer No.")
                {
                    Caption = 'Parent Account Number';
                }

                field(Salesperson_Code; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';
                }

                field(Chain; CustomerRec."Chain Name")
                {
                    Caption = 'Chain Name';
                }

                field(Gen_Bus_Posting_Group; CustomerRec."Gen. Bus. Posting Group")
                {
                    Caption = 'Gen. Bus. Posting Group';
                }

                field(VAT_Bus_Posting_Group; CustomerRec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                }

                field(Customer_Posting_Group; CustomerRec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                }

                field(Department; ShortcutDimCode[3])
                {
                    Caption = 'Department';
                }

                field(Location; Rec."Location Code")
                {
                    Caption = 'Location';
                }

                field(Customer_Type; ShortcutDimCode[2])
                {
                    Caption = 'Customer Type';
                }

                field(Torlys_Club; CustomerRec.Club)
                {
                    Caption = 'Torlys Club';
                }

                field(Salesperson_Code_2; CustomerRec."Salesperson Code 2")
                {
                    Caption = 'Salesperson Code 2';
                }

                field(Salesperson_Code_3; CustomerRec."Salesperson Code 3")
                {
                    Caption = 'Salesperson Code 3';
                }

                field(DBA; CustomerRec.DBA)
                {
                    Caption = 'DBA';
                }
            }
        }
    }
    var
        CustomerRec: Record Customer;
        ShortcutDimCode: array[8] of Code[20];


    trigger OnAfterGetRecord()
    begin
        CustomerRec.Reset();
        if Rec."Customer No." <> '' then begin
            CustomerRec.Get(Rec."Customer No.");
            CustomerRec.ShowShortcutDimCode(ShortcutDimCode);
        end;

    end;

}
