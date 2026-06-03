pageextension 50036 TlyAssemblyBOM extends "Assembly BOM"
{
    actions
    {
        addlast(Category_Category4)
        {
            actionref(BinContent; "Bin Content")
            {
            }
        }

        addlast(Category_Category5)
        {
            actionref(PrintBOM; "Print BOM")
            {
            }
        }

        addlast(processing)
        {
            action("Bin Content")
            {
                Caption = 'Bin Content';
                ToolTip = 'Bin Content';
                ApplicationArea = All;
                Image = BinContent;
                RunObject = Page "Bin Content";
                RunPageLink = "Item No." = field("No.");
            }

            action("Print BOM")
            {
                ApplicationArea = Warehouse;
                Caption = 'Print BOM';
                Image = Print;
                ToolTip = 'Print BOM';
                trigger OnAction()
                var
                begin
                    TorlysDocPrint.PrintBOM(Rec);
                end;
            }
        }
    }
    var
        TorlysDocPrint: Codeunit TlyDocumentPrint;
}