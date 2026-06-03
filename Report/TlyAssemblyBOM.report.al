report 50040 TlyAssemblyBOM
{
    DefaultLayout = RDLC;
    RDLCLayout = './Assembly/Reports/AssemblyBOMsTORLYS.rdlc';
    // AdditionalSearchTerms = 'Assembly BOMs TORLYS';
    ApplicationArea = Assembly;
    Caption = 'Assembly BOM';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Item; Item)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";//, "Search Description";
            column(CompanyName; COMPANYPROPERTY.DisplayName())
            {
            }
            column(ItemTableCaptionItemFilter; TableCaption + ': ' + ItemFilter)
            {
            }
            column(ItemFilter; ItemFilter)
            {
            }
            column(No_Item; "No.")
            {
            }
            column(Description_Item; Description)
            {
            }
            column(BOMsCaption; BOMsCaptionLbl)
            {
            }
            column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
            {
            }
            column(BOMCompAssemblyBOMCaption; BOMCompAssemblyBOMCaptionLbl)
            {
            }
            column(ParentBinLocation; ParentBinLocation)
            {
            }
            column(ParentMOQ; ParentMOQ)
            {
            }

            dataitem("BOM Component"; "BOM Component")
            {
                CalcFields = "Assembly BOM";
                DataItemLink = "Parent Item No." = field("No.");
                DataItemTableView = sorting("Parent Item No.", "Line No.");
                column(Position_BOMComp; Position)
                {
                    IncludeCaption = true;
                }
                column(Type_BOMComp; Type)
                {
                    IncludeCaption = true;
                }
                column(No_BOMComp; "No.")
                {
                    IncludeCaption = true;
                }
                column(Description_BOMComp; Description)
                {
                    IncludeCaption = true;
                }
                column(AssemblyBOM_BOMComp; Format("Assembly BOM"))
                {
                }
                column(Quantityper_BOMComp; "Quantity per")
                {
                    IncludeCaption = true;
                }
                column(UnitofMeasureCode_BOMComp; "Unit of Measure Code")
                {
                    IncludeCaption = true;
                }
                column(ChildBinLocation; ChildBinLocation)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    ParentBinLocation := '';
                    ParentBinContent.Reset();
                    // ParentBinContent.SetRange("Location Code", "Location Code");
                    ParentBinContent.SetRange("Item No.", "Parent Item No.");
                    if (ParentBinContent.Find('-')) then begin
                        repeat
                            If StrPos(ParentBinLocation, ParentBinContent."Bin Code") = 0 then begin
                                ParentBinLocation := ParentBinLocation + ' ' + ParentBinContent."Bin Code";
                            end;
                        until ParentBinContent.Next = 0;
                    end;

                    ChildBinLocation := '';
                    ChildBinContent.Reset();
                    // ChildBinContent.SetRange("Location Code", "Location Code");
                    ChildBinContent.SetRange("Item No.", "No.");
                    if (ChildBinContent.Find('-')) then begin
                        repeat
                            If StrPos(ChildBinLocation, ChildBinContent."Bin Code") = 0 then begin
                                ChildBinLocation := ChildBinLocation + ' ' + ChildBinContent."Bin Code";
                            end;
                        until ChildBinContent.Next = 0;
                    end;

                    ParentMOQ := '';
                    CommentLine.Reset;
                    CommentLine.SetRange("No.", "Parent Item No.");
                    CommentLine.SetFilter("Comment Type", 'MOQ');
                    if CommentLine.Find('-') then
                        ParentMOQ := CommentLine.Comment
                    else
                        ParentMOQ := '';
                end;
            }
        }
    }

    requestpage
    {
        AboutTitle = 'About BOMs';
        AboutText = 'Get an overview of assembly bills of materials (BOMs), including BOMs that are part of the main BOM.';

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        ItemFilter := Item.GetFilters();
    end;

    var
        ItemFilter: Text;
        BOMsCaptionLbl: Label 'BOMs';
        CurrReportPageNoCaptionLbl: Label 'Page';
        BOMCompAssemblyBOMCaptionLbl: Label 'BOM';
        ParentBinContent: Record "Bin Content";
        ParentBinLocation: Code[200];
        ChildBinContent: Record "Bin Content";
        ChildBinLocation: Code[200];
        ParentMOQ: Text;
        CommentLine: Record "Comment Line";
}