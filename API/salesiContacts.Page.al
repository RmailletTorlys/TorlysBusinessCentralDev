page 56102 salesiContacts
{
    PageType = API;
    Caption = 'salesi Contacts';
    APIPublisher = 'torlys';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salesiContacts';
    EntitySetName = 'salesiContacts';
    SourceTable = "Contact";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(account_number; accountNumber)
                {
                    Caption = 'Account Number';
                }
                field(contact_backoffice_key; Rec."No.")
                {
                    Caption = 'Contact Backoffice Key';
                }

                field(First_Name; Rec."First Name")
                {
                    Caption = 'First Name';
                }

                field(Middle_Name; Rec."Middle Name")
                {
                    Caption = 'Last Name';
                }

                field(Surname; Rec.Surname)
                {
                    Caption = 'Surname';
                }

                field(full_name; Rec.Name)
                {
                    Caption = 'Full Name';
                }

                field(Job_Title; Rec."Job Title")
                {
                    Caption = 'Job Title';
                }

                field(Phone_No_; Rec."Phone No.")
                {
                    Caption = 'Phone No_';
                }

                field(Fax_No_; Rec."Fax No.")
                {
                    Caption = 'Fax No_';
                }

                field(Mobile_Phone_No_; Rec."Mobile Phone No.")
                {
                    Caption = 'Mobile Phone No_';
                }

                field("Email"; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                }

                field(Address; Rec.Address)
                {
                    Caption = 'Address';
                }

                field(Address_2; Rec."Address 2")
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

                field(Post_Code; Rec."Post Code")
                {
                    Caption = 'Post Code';
                }

                field(Country_Region; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';
                }

            }
        }
    }

    var
        ContactBusinessRec: Record "Contact Business Relation";
        accountNumber: Code[20];

    trigger OnAfterGetRecord()
    begin
        if ContactBusinessRec.Get(ContactBusinessRec."Contact No." = Rec."No.") then
            accountNumber := ContactBusinessRec."Contact No.";

    end;
}



