report 50041 "Display Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Local/Sales/History/DisplayReport.rdlc';
    Caption = 'Display Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(TlyCustomerDisplays; TlyCustomerDisplays)
        {
            RequestFilterFields = "Ship-to Code", "Display Type", "Item Category Code", "Customer No.";
            RequestFilterHeading = 'Customer Display Report';

            column(Ship_to_Code; "Ship-to Code")
            { }
            column(Display_Type; "Display Type")
            { }
            column(Item_Category_Code; "Item Category Code")
            { }
            column(Item_Category_Description; "Item Category Description")
            { }
            column(No_; "Customer No.")
            { }
            column(Salesperson_Code; TM)
            { }
            column(Comments; Comments)
            { }

            trigger OnAfterGetRecord()
            begin
                Customer.get(TlyCustomerDisplays."Customer No.");
                TM := Customer."Salesperson Code";
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {

            }
        }
    }
    var
        Customer: Record Customer;
        TM: Text;
}