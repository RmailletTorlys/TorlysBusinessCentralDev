// codeunit 50006 "UpdateBillOfLadingOnShipHeader"
// {
//     Permissions = tabledata "Sales Shipment Header" = rm;

//     procedure UpdateBolNumber(ShipmentNo: Code[20]; BoLNo: Code[20])
//     var
//         SalesShipmentHeader: Record "Sales Shipment Header";
//     begin

//         // // We must always validate that the record exists before trying to modify it.
//         // if not SalesShipmentHeader.Get(ShipmentNo) then
//         //     Error('The sales shipment %1 could not be found.', ShipmentNo);

//         SalesShipmentHeader."BoL No." := BoLNo;

//         // Save the change to the database.
//         SalesShipmentHeader.Modify(true); // Pass 'true' to run table triggers.
//     end;

//     // procedure DeleteBolNumber(ShipmentNo: Code[20]; BoLNo: Code[20])
//     // var
//     //     SalesShipmentHeader: Record "Sales Shipment Header";
//     // begin
//     //     // We must always validate that the record exists before trying to modify it.
//     //     if not SalesShipmentHeader.Get(ShipmentNo) then
//     //         Error('The sales shipment %1 could not be found.', ShipmentNo);

//     //     if not (SalesShipmentHeader."BoL No." = BoLNo) then
//     //         Error('Error with the BoL Number. Contact the IT team for support.');

//     //     SalesShipmentHeader."BoL No." := '';

//     //     // Save the change to the database.
//     //     SalesShipmentHeader.Modify(true); // Pass 'true' to run table triggers.
//     // end;
// }