pageextension 50036 TlyAssemblyBOM extends "Assembly BOM"
{
    actions
    {
        addlast(Category_Category4)
        {
            actionref(PrintBOM; "Print BOM")
            {
            }
        }

        addlast(processing)
        {
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