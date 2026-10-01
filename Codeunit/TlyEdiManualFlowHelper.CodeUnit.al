codeunit 57007 TlyEdiManualFlowHelper
{
    [ServiceEnabled]
    procedure InvokeReceive(Channel: Text; ProcessFollowing: Boolean)
    var
        // Your target internal/non-public codeunit or logic handler
        InternalProcessor: Codeunit "ANVEDI Job Handler";
    begin
        // Call the internal routines safely from inside Business Central
        // (Assuming you can pass parameters or trigger functions it allows)
        InternalProcessor.RECEIVE(Channel, ProcessFollowing);
    end;
}