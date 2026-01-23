reportextension 51500 "TorlysProForma" extends "Standard Sales - Pro Forma Inv"
{
    dataset
    {
        addfirst(Header)
        {
            dataitem(CopyLoop; Integer)
            {
                DataItemTableView = sorting(Number);
                column(NoCopies; Number)
                {

                }

                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, NoCopiesVar + 1);
                end;
            }
        }
        addlast(header)
        {
            dataitem("Sales Tax Amount Line"; "Sales Tax Amount Line")
            {
                column(Tax_Jurisdiction_Code; "Tax Jurisdiction Code")
                {

                }
            }
        }
        add(Header)
        {
            column(Your_Reference; "Your Reference")
            {

            }
            column(Tag_Name; "Tag Name")
            {

            }
            column(Shipment_Date; Format("Shipment Date", 0, '<day>/<month>/<year>'))
            {

            }
            column(Bill_to_Customer_No_; "Bill-to Customer No.")
            {

            }
            column(External_Document_No_; "External Document No.")
            {

            }
            column(Order_Date; Format("Order Date", 0, '<day>/<month>/<year>'))
            {

            }
            column(Caladdress1; Caladdress[1])
            {

            }
            column(Caladdress2; Caladdress[2])
            {

            }
            column(Caladdress3; Caladdress[3])
            {

            }
            column(Caladdress4; Caladdress[4])
            {

            }
            column(Caladdress5; Caladdress[5])
            {

            }
        }
        add(line)
        {
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            {

            }
            column(No_; "No.")
            {

            }
        }
        add(Totals)
        {
            column(Pieces; Pieces)
            {

            }
        }

        modify(Header)
        {
            trigger OnBeforePreDataItem()
            begin
                If PrintCompany then
                    formataddress.Company(CompanyAddress, CompanyInformation)
                else
                    Clear(CompanyAddress);
            end;

            trigger OnAfterAfterGetRecord()
            begin
                if "Salesperson Code" = '' then
                    clear(SalesPurchPerson)
                else
                    SalesPurchPerson.get("Salesperson Code");

                if "Payment Terms Code" = '' then
                    clear(PaymentTerms)
                else
                    PaymentTerms.get("Payment Terms Code");

                If "Shipment Method Code" = '' then
                    clear(ShipmentMethod)
                else
                    ShipmentMethod.get("Shipment Method Code");

                if not customer.get("Sell-to Customer No.") then
                    Clear(customer);

                Caladdress[1] := '';
                Caladdress[2] := '';
                Caladdress[3] := '';
                Caladdress[4] := '';
                Caladdress[5] := '';

                If "Location Code" = 'CAL' then begin
                    Caladdress[1] := 'Shipping Address/Ship From';
                    Caladdress[2] := 'TORLYS Inc. (Calgary)';
                    Caladdress[3] := '1845 - 104 Avenue NE';
                    Caladdress[4] := 'Calgary, Alberta, Canada';
                    Caladdress[5] := 'T3J 0R2';
                end
            end;
        }
        modify(Line)
        {
            trigger OnAfterPreDataItem()
            begin
                Pieces := 0;
            end;

            trigger OnAfterAfterGetRecord()
            begin
                // If "Quantity Shipped" <> 0 then begin
                //     Item.get("No.");

                //     PerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET');
                //     PerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE');

                //     tempQuantity := ROUND("Quantity Shipped" * "Qty. per Unit of Measure", 0.01, '<');
                //     QtyShippedPallet := 0;

                //     while tempQuantity >= PerPallet do begin
                //         QtyShippedPallet := QtyShippedPallet + 1;
                //         tempQuantity := tempQuantity - PerPallet;
                //     end;

                //     CalculatedCase := tempQuantity / PerCase;
                //     QtyShippedCase := Round(CalculatedCase, 1.0, '<');
                //     QtyShippedSingles := Round((tempQuantity - (QtyShippedCase * PerCase)), 1.0, '>');

                //     Pieces := QtyShippedSingles + QtyShippedCase;

                //     If QtyShippedPallet <> 0 then
                //         Pieces += PerPallet / PerCase * QtyShippedPallet;
                // end else
                //     Pieces := 0;

                tempsalesline := "Line";

                If IgnoreBackorder then begin
                    tempsalesline.Quantity := tempsalesline."Qty. to Ship";
                    tempsalesline."Outstanding Quantity" := tempsalesline."qty. to ship";

                    tempsalesline."Quantity (Base)" := tempsalesline."Qty. to Ship";
                    tempsalesline."Outstanding Qty. (Base)" := tempsalesline."qty. to ship";
                end;

                tempsalesline.Insert();

                If IgnoreBackorder then begin
                    tempsalesline.Quantity := tempsalesline."Qty. to Ship";
                    tempsalesline."Outstanding Quantity" := tempsalesline."qty. to ship";

                    tempsalesline."Quantity (Base)" := tempsalesline."Qty. to Ship";
                    tempsalesline."Outstanding Qty. (Base)" := tempsalesline."qty. to ship";
                end;

                tempsalesline.Modify();

                Pieces += "Qty. to Ship Case";

                If "Qty. to Ship Pallet" > 0 then begin
                    If Type = Type::Item then
                        SetQtyConst("No.");
                    // Pieces += ("Qty. to Ship Pallet" * (PerPallet / PerCase));
                    Pieces += ("Qty. to Ship Pallet" * (QtyPerPallet / QtyPerCase));
                end;

                If ("Qty. to Ship Case" = 0) and ("Qty. to Ship Pallet" = 0) then
                    Pieces += "Qty. to Ship";
            end;
        }
    }

    procedure SetQtyConst(No_: Code[20])
    begin
        Item.Get(No_);
        // PerPallet := UoMHelper.GetQuantityUoM(Item."No.", 'PALLET');
        // PerCase := UoMHelper.GetQuantityUoM(Item."No.", 'CASE');
        QtyPerCase := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'CASE'); //get the SF per case
        QtyPerPallet := UOMMgt.GetQtyPerUnitOfMeasure(Item, 'PALLET'); //get the SF per pallet
    end;

    var
        Caladdress: array[5] of text;
        // PerPallet: Decimal;
        // PerCase: Decimal;
        SalesPurchPerson: Record "Salesperson/Purchaser";
        PaymentTerms: Record "Payment Terms";
        ShipmentMethod: Record "Shipment Method";
        customer: Record Customer;
        tempsalesline: Record "Sales Line" temporary;
        QtyPerPallet: Integer;
        QtyPerCase: Integer;
        NoCopiesVar: Integer;
        ItemUOM: Record "Item Unit of Measure";
        Pieces: Decimal;
        UOMMgt: Codeunit "Unit of Measure Management";
        // UoMHelper: Codeunit "Quantity Rounding Helper";        
        tempQuantity: Decimal;
        QtyShippedPallet: Decimal;
        QtyShippedCase: Decimal;
        QtyShippedSingles: Decimal;
        CalculatedCase: Decimal;
        PrintCompany: Boolean;
        PrintFooter: Boolean;
        TaxFlag: Boolean;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        IgnoreBackorder: Boolean;
        CostInsteadOfPrice: Boolean;
        UseListPrice: Boolean;
        UsePurchasesTariff: Boolean;
        RemoveFreight: Boolean;
        RemoveDuty: Boolean;
        BackoutDuty: Boolean;
        OrderShipped: Boolean;
        formataddress: Codeunit "Format Address";
}