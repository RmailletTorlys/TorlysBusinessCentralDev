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
            RequestFilterFields = "Customer No.", "Ship-to Code", "Salesperson Code", "Display Type", "Item Category Code";
            RequestFilterHeading = 'Customer Display Report';

            column(No_; "Customer No.")
            { }
            column(Ship_to_Code; "Ship-to Code")
            { }
            column(Name; "Name")
            { }
            // column(Salesperson_Code; TM)
            column(Salesperson_Code; "Salesperson Code")
            { }
            column(Salesperson_Name; SalespersonName)
            { }
            column(Display_Type; "Display Type")
            { }
            column(Item_Category_Code; "Item Category Code")
            { }
            column(Item_Category_Description; "Item Category Description")
            { }
            column(Comments; Comments)
            { }

            trigger OnAfterGetRecord()
            var
                Salesperson: Record "Salesperson/Purchaser";
            begin
                // Customer.get(TlyCustomerDisplays."Customer No.");
                // TM := Customer."Salesperson Code";
                TlyCustomerDisplays.CalcFields(TlyCustomerDisplays."Salesperson Code");
                if TlyCustomerDisplays."Salesperson Code" <> '' then begin
                    Salesperson.Get(TlyCustomerDisplays."Salesperson Code");
                    SalespersonName := Salesperson."Name";
                end else begin
                    SalespersonName := '';
                end;
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
        //     Customer: Record Customer;
        //     TM: Text;
        SalespersonName: Text[50];
}