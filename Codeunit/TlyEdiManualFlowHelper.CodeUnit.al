codeunit 57008 TlyEdiManualFlowHelper
{
    // Make this procedure available as a public OData V4 Action
    [ServiceEnabled]
    procedure TriggerEDIReceive(ChannelCode: Code[20]; ProcessFollowingParam: Boolean)
    var
        EDISetup: Record "ANVEDI Setup";
        EDIIntegration: Codeunit "ANVEDI Integration";

    begin
        // Optional: Ensure setup exists
        EDISetup.Get();

        // Replicating what ANVEDI Job Handler does internally:
        EDIIntegration.BEGIN_USER_TRANSACTION('Receiving data via n8n');

        // Call the integration engine function directly
        EDIIntegration.RECEIVE_COMMUNICATIONCHANNEL(ChannelCode, ProcessFollowingParam, '');

        // Finalize transaction safely
        EDIIntegration.END_USER_TRANSACTION(false, EDISetup."Job Queue Error Handling" = EDISetup."Job Queue Error Handling"::"Collect (Report first Error)");
    end;
}