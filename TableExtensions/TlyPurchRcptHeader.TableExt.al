<<<<<<< HEAD:TableExtensions/TlyPurchRcptHeader.TableExt.al
tableextension 50120 TlyPurchRcptHeader extends "Purch. Rcpt. Header"
=======
tableextension 50120 TorlysPurchaseReceiptHeader extends "Purch. Rcpt. Header"
>>>>>>> 5d97453bc243d6e4cb3019687424c0f4e6bb89a7:TableExtensions/TorlysPurchaseReceiptHeader.TableExt.al
{
    fields
    {

        field(50010; "Last Archived Date"; Date)
        {
            Caption = 'Last Archived Date';
            DataClassification = CustomerContent;
        }



    }
}