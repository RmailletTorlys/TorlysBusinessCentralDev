page 56015 "TransferLineAPI"
{
    APIGroup = 'logistics';
    APIPublisher = 'myCompany';
    APIVersion = 'v2.0';
    EntityName = 'transferLine';
    EntitySetName = 'transferLines';
    PageType = API;
    SourceTable = "Transfer Line";
    DelayedInsert = true;
    ODataKeyFields = SystemId; // Required for Power Automate triggers

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(transferFromCode; Rec."Transfer-from Code")
                {
                    Caption = 'Transfer-from Code';
                }
                field(transferToCode; Rec."Transfer-to Code")
                {
                    Caption = 'Transfer-to Code';
                }
                field(shipmentDate; Rec."Shipment Date")
                {
                    Caption = 'Shipment Date';
                }
                field(NetWeight; Rec."Net Weight")
                {
                    Caption = 'Net Weight';
                }
            }
        }
    }
}
