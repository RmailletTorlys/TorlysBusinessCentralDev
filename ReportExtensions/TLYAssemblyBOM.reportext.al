reportextension 52700 "TorlysBOM" extends "Assembly BOMs"
{
    dataset
    {
        add(Item)
        {
            column(BinLocationLabel; BinLocationLabel)
            {

            }
            column(BinLocation; BinLocation)
            {

            }
        }
        add("BOM Component")
        {
            column(BinLocationLabelBOM; BinLocationLabelBOM)
            {

            }
            column(BinLocationBOM; BinLocationBOM)
            {

            }
        }
        modify(Item)
        {
            trigger OnAfterAfterGetRecord()
            begin
                BinLocation := '';
                BinLocationLabel := '';
                BinContent.Reset();
                // BinContent.SetRange(BinContent."Location Code", "Transfer-from Code");
                BinContent.SetRange(BinContent."Item No.", "No.");
                If (BinContent.Find('-')) then begin
                    repeat
                        If StrPos(BinLocation, BinContent."Bin Code") = 0 then
                            BinLocation := CopyStr(BinLocation + ' ' + BinContent."Bin Code", 1, 100);

                    Until BinContent.Next() = 0;
                    BinLocationLabel := 'Bin(s): ';
                end;
            end;
        }

        modify("BOM Component")
        {
            trigger OnAfterAfterGetRecord()
            begin
                BinLocationBOM := '';
                BinLocationLabelBOM := '';
                BinContentBOM.Reset();
                // BinContent.SetRange(BinContent."Location Code", "Transfer-from Code");
                BinContentBOM.SetRange(BinContentBOM."Item No.", "No.");
                If (BinContentBOM.Find('-')) then begin
                    repeat
                        If StrPos(BinLocationBOM, BinContentBOM."Bin Code") = 0 then
                            BinLocationBOM := CopyStr(BinLocationBOM + ' ' + BinContentBOM."Bin Code", 1, 100);

                    Until BinContentBOM.Next() = 0;
                    BinLocationLabelBOM := 'Bin(s): ';
                end;
            end;
        }

        addafter("BOM Component")
        {
            dataitem("Comment Line"; "Comment Line")
            {
                DataItemTableView = sorting("Table Name", "No.", "Line No.");
                DataItemLinkReference = "Item";
                DataItemLink = "No." = field("No.");

                column(Comment; Comment)
                {

                }
            }
        }
    }

    var
        BinContent: Record "Bin Content";
        BinLocation: Code[100];
        BinLocationLabel: Text;
        BinContentBOM: Record "Bin Content";
        BinLocationBOM: Code[100];
        BinLocationLabelBOM: Text;
}