codeunit 50010 "TorlysLookupUserID"
{
    procedure UserId(var UserGuid: Guid): Code[50]
    var
        UserDetails: Record "User";
    begin
        UserDetails.Get(UserGuid);
        exit(UserDetails."User Name");
    end;
}