codeunit 50317 "Price Source Price Code" implements "Price Source"
{
    var
        PriceCode: Record "Item Category";
        ParentErr: Label 'Parent Source No. must be blank for Price Code source Type';

    procedure GetNo(var PriceSource: Record "Price Source")
    begin
        if PriceCode.GetBySystemId(PriceSource."Source ID") then begin
            PriceSource."Source No." := PriceCode.Code;
            FillAdditionalFields(PriceSource);
        end else
            PriceSource.InitSource();
    end;

    procedure GetId(var PriceSource: Record "Price Source")
    begin
        if PriceCode.Get(PriceSource."Source No.") then begin
            PriceSource."Source ID" := PriceCode.SystemId;
            FillAdditionalFields(PriceSource);
        end else
            PriceSource.InitSource();
    end;

    procedure IsForAmountType(AmountType: Enum "Price Amount Type"): Boolean
    begin
        exit(true);
    end;

    procedure IsSourceNoAllowed() Result: Boolean
    begin
        Result := true;
    end;

    procedure IsLookupOK(var PriceSource: Record "Price Source"): Boolean
    var
        xPriceSource: Record "Price Source";
    begin
        xPriceSource := PriceSource;
        if PriceCode.Get(xPriceSource."Source No.") then;
        if Page.RunModal(Page::"Item Sales Category Lookup", PriceCode) = ACTION::LookupOK then begin
            xPriceSource.Validate("Source No.", PriceCode.Code);
            PriceSource := xPriceSource;
            exit(true);
        end;
    end;

    procedure VerifyParent(var PriceSource: Record "Price Source") Result: Boolean
    begin
        if PriceSource."Parent Source No." <> '' then
            Error(ParentErr);
    end;

    procedure GetGroupNo(PriceSource: Record "Price Source"): Code[20]
    begin
        exit(PriceSource."Source No.");
    end;

    local procedure FillAdditionalFields(var PriceSource: Record "Price Source")
    begin
        PriceSource.Description := PriceCode.Description;
        PriceSource."Source Type" := "Price Source Type"::"Item Category";
        PriceSource."Price Type" := "Price Type"::"Sale";
    end;


}