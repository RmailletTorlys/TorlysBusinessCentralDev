codeunit 50010 "TorlysLookupUserID"
{
    procedure UserId(var UserGuid: Guid): Code[50]
    var
        UserDetails: Record "User";
    begin
        if UserGuid = '00000000-0000-0000-0000-000000000000' then exit;
        UserDetails.Get(UserGuid);
        exit(UserDetails."User Name");
    end;
}