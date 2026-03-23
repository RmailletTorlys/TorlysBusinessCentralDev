page 56007 "TlySalespersonPurchaser API"
{
    PageType = API;
    SourceTable = "Salesperson/Purchaser";
    APIPublisher = 'torlys';
    APIGroup = 'sales';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'salespersonPurchaser';
    EntitySetName = 'salespersonPurchasers';
    DelayedInsert = true;
    Editable = false;
    DataAccessIntent = ReadOnly;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(code; Rec.Code)
                {
                    Caption = 'Code';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(jobTitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                }
                field(department; Rec."Order Shipping Location")
                {
                    Caption = 'Department';
                }

                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }

                field(email; Rec."Search E-Mail")
                {
                    Caption = 'Email';
                }

                field(manager; Rec.Manager)
                {
                    Caption = 'Manager';
                }

                field(viewMargin; Rec."View Margin - Intranet")
                {
                    Caption = 'View Margin - Intranet';
                }

                field(viewMgrPricing; Rec."View Mgr Pricing - Intranet")
                {
                    Caption = 'View Manager - Intranet';
                }

                field(isWebContact; Rec."NTN Is Web Contact")
                {
                    Caption = 'Is Web Contact';
                }
            }
        }
    }
}