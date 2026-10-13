<<<<<<< HEAD
codeunit 57008 "tlyEdiManualFlowHelper"
=======
codeunit 57008 TlyEdiManualFlowHelper
>>>>>>> 774b0c9a26cf97e6e2d619ff84b5419c2364ddf5
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