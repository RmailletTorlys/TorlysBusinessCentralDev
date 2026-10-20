// // February 2, 2026 - DVP copied this from NAV and made slight changes
// // TLY-SD - 04/14/2026 - SD added "CalculateInventoryAvailability" as was missed at go live and cleaned up some of the other procedures
// // TLY-SD - 10/15/2026 - SD made changes

// //this is just our file for writing the code and making sure there are no errors,
// //have to send to DVP for them to load with their extensions
// //TORLYS = CU 52231
// //DVP = CU 50231

// codeunit 52231 TlyNTNInventorySynch
// {
//     Subtype = Normal;

//     var
//         DVPNTNSetup: Record "NTN Setup";

//     procedure CalculateInventoryAvailability(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) CalculatedAvailableInventory: Decimal
//     var
//         Item: Record Item;
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         CalculatedAvailableInventory := 0;
//         Item.Reset();

//         if VariantCode <> '' then begin
//             Item.SetFilter("Variant Filter", VariantCode);
//         end;

//         if LocationCode <> '' then begin
//             // if LocationCode = 'TOR' then
//             // Item.SetFilter("Location Filter", 'TOR|TMT')
//             // else
//             Item.SetFilter("Location Filter", LocationCode); //TLY-SD - 10/15/2026 - only show the actual location
//         end;

//         if Item.Get(ItemNo) then begin
//             Item.CalcFields(Item.Inventory, Item."Qty. to Ship", Item."Qty. to Ship (Transfer)");
//             CalculatedAvailableInventory := Item.Inventory - Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)";
//         end;

//         exit(CalculatedAvailableInventory); //this is the main number on the item page and cart page
//     end;

//     procedure CalculateBucket1Avail(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityAvailableBucket1: Decimal
//     var
//         Item: Record Item;
//         EndDate: Date;
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         QuantityAvailableBucket1 := 0;
//         Item.Reset();

//         if VariantCode <> '' then begin
//             Item.SetFilter("Variant Filter", VariantCode);
//         end;

//         if LocationCode <> '' then begin
//             // if LocationCode = 'TOR' then begin
//             // Item.SetFilter("Location Filter", 'TOR|TMT');
//             // end else begin
//             Item.SetFilter("Location Filter", LocationCode); //TLY-SD - 10/15/2026 - only show the actual location since cant transfer this fast
//             // end;
//         end;

//         if Item.Get(ItemNo) then begin
//             EndDate := CalcDate('7D', WorkDate());
//             Item.SetRange("Date Filter", WorkDate(), EndDate);
//             Item.CalcFields(Item.Inventory, Item."Qty. on Sales Order", Item."Qty. to Ship", Item."Qty. to Ship (Transfer)", Item."Qty. in Transit", Item."Qty. on Purch. Order");
//             // QuantityAvailableBucket1 := Item.Inventory - CalculateQuantityToShip(Item."No.", VariantCode, LocationCode)
//             //                             - Item."Qty. on Sales Order" + Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)"
//             //                             + Item."Qty. in Transit" + Item."Qty. on Purch. Order";
//             QuantityAvailableBucket1 := Item.Inventory - CalculateQuantityToShipSO(Item."No.", VariantCode, LocationCode)
//                                         - CalculateQuantityToShipTO(Item."No.", VariantCode, LocationCode)
//                                         + Item."Qty. in Transit" + Item."Qty. on Purch. Order";
//         end;

//         exit(QuantityAvailableBucket1);
//     end;

//     procedure CalculateBucket2Avail(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityAvailableBucket2: Decimal
//     var
//         Item: Record Item;
//         EndDate: Date;
//         StartDate: Date;
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         QuantityAvailableBucket2 := 0;
//         Item.Reset();

//         if VariantCode <> '' then begin
//             Item.SetFilter("Variant Filter", VariantCode);
//         end;

//         if LocationCode <> '' then begin
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT') //TLY-SD - 10/15/2026 - add in TMT to the TOR number since can take a few days to get into TOR
//             else if LocationCode = 'CAL' then
//                 Item.SetFilter("Location Filter", 'CAL|TOR|TMT') //TLY-SD - 10/15/2026 - add in TOR/TMT to the CAL number since can take a few days to get into CAL
//         end;

//         if Item.Get(ItemNo) then begin
//             StartDate := CalcDate('8D', WorkDate());
//             EndDate := CalcDate('14D', WorkDate());
//             Item.SetRange("Date Filter", WorkDate(), EndDate);
//             Item.CalcFields(Item.Inventory, Item."Qty. on Sales Order", Item."Qty. to Ship", Item."Qty. to Ship (Transfer)", Item."Qty. in Transit", Item."Qty. on Purch. Order");
//             QuantityAvailableBucket2 := Item.Inventory - CalculateQuantityToShipSOall(Item."No.", VariantCode, LocationCode)
//                                         - CalculateQuantityToShipTOall(Item."No.", VariantCode, LocationCode)
//                                         + Item."Qty. in Transit" + Item."Qty. on Purch. Order";
//         end;

//         exit(QuantityAvailableBucket2);
//     end;

//     procedure CalculateBucket3Avail(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityAvailableBucket3: Decimal
//     var
//         Item: Record Item;
//         EndDate: Date;
//         StartDate: Date;
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         QuantityAvailableBucket3 := 0;
//         Item.Reset();

//         if VariantCode <> '' then begin
//             Item.SetFilter("Variant Filter", VariantCode);
//         end;

//         if LocationCode <> '' then begin
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT') //TLY-SD - 10/15/2026 - add in TMT to the TOR number since can take a few days to get into TOR
//             else if LocationCode = 'CAL' then
//                 Item.SetFilter("Location Filter", 'CAL|TOR|TMT') //TLY-SD - 10/15/2026 - add in TOR/TMT to the CAL number since can take a few days to get into CAL
//         end;

//         if Item.Get(ItemNo) then begin
//             StartDate := CalcDate('15D', WorkDate());
//             EndDate := CalcDate('21D', WorkDate());
//             Item.SetRange("Date Filter", WorkDate(), EndDate);
//             Item.CalcFields(Item.Inventory, Item."Qty. on Sales Order", Item."Qty. to Ship", Item."Qty. to Ship (Transfer)", Item."Qty. in Transit", Item."Qty. on Purch. Order");
//             QuantityAvailableBucket3 := Item.Inventory - CalculateQuantityToShipSOall(Item."No.", VariantCode, LocationCode)
//                                         - CalculateQuantityToShipTOall(Item."No.", VariantCode, LocationCode)
//                                         + Item."Qty. in Transit" + Item."Qty. on Purch. Order";
//         end;

//         exit(QuantityAvailableBucket3);
//     end;

//     procedure CalculateBucket4Avail(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityAvailableBucket4: Decimal
//     var
//         Item: Record Item;
//         EndDate: Date;
//         StartDate: Date;
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         QuantityAvailableBucket4 := 0;
//         Item.Reset();

//         if VariantCode <> '' then begin
//             Item.SetFilter("Variant Filter", VariantCode);
//         end;

//         if LocationCode <> '' then begin
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT') //TLY-SD - 10/15/2026 - add in TMT to the TOR number since can take a few days to get into TOR
//             else if LocationCode = 'CAL' then
//                 Item.SetFilter("Location Filter", 'CAL|TOR|TMT') //TLY-SD - 10/15/2026 - add in TOR/TMT to the CAL number since can take a few days to get into CAL
//         end;

//         if Item.Get(ItemNo) then begin
//             StartDate := CalcDate('22D', WorkDate());
//             EndDate := CalcDate('28D', WorkDate());
//             Item.SetRange("Date Filter", WorkDate(), EndDate);
//             Item.CalcFields(Item.Inventory, Item."Qty. on Sales Order", Item."Qty. to Ship", Item."Qty. to Ship (Transfer)", Item."Qty. in Transit", Item."Qty. on Purch. Order");
//             QuantityAvailableBucket4 := Item.Inventory - CalculateQuantityToShipSOall(Item."No.", VariantCode, LocationCode)
//                                         - CalculateQuantityToShipTOall(Item."No.", VariantCode, LocationCode)
//                                         + Item."Qty. in Transit" + Item."Qty. on Purch. Order";
//         end;

//         exit(QuantityAvailableBucket4);
//     end;

//     procedure CalculateBucket5Avail(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityAvailableBucket5: Decimal
//     var
//         Item: Record Item;
//         EndDate: Date;
//         StartDate: Date;
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         QuantityAvailableBucket5 := 0;
//         Item.Reset();

//         if VariantCode <> '' then begin
//             Item.SetFilter("Variant Filter", VariantCode);
//         end;

//         if LocationCode <> '' then begin
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT') //TLY-SD - 10/15/2026 - add in TMT to the TOR number since can take a few days to get into TOR
//             else if LocationCode = 'CAL' then
//                 Item.SetFilter("Location Filter", 'CAL|TOR|TMT') //TLY-SD - 10/15/2026 - add in TOR/TMT to the CAL number since can take a few days to get into CAL
//         end;

//         if Item.Get(ItemNo) then begin
//             StartDate := CalcDate('29D', WorkDate());
//             EndDate := CalcDate('35D', WorkDate());
//             Item.SetRange("Date Filter", WorkDate(), EndDate);
//             Item.CalcFields(Item.Inventory, Item."Qty. on Sales Order", Item."Qty. to Ship", Item."Qty. to Ship (Transfer)", Item."Qty. in Transit", Item."Qty. on Purch. Order");
//             QuantityAvailableBucket5 := Item.Inventory - CalculateQuantityToShipSOall(Item."No.", VariantCode, LocationCode)
//                                         - CalculateQuantityToShipTOall(Item."No.", VariantCode, LocationCode)
//                                         + Item."Qty. in Transit" + Item."Qty. on Purch. Order";
//         end;

//         exit(QuantityAvailableBucket5);
//     end;

//     procedure CalculateQuantityToShipSO(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityToShipSO: Decimal
//     var
//         Item: Record Item;
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         QuantityToShipSO := 0;
//         Item.Reset();

//         if VariantCode <> '' then begin
//             Item.SetFilter("Variant Filter", VariantCode);
//         end;

//         if LocationCode <> '' then begin
//             // if LocationCode = 'TOR' then begin
//             // Item.SetFilter("Location Filter", 'TOR|TMT');
//             // end else begin
//             Item.SetFilter("Location Filter", LocationCode); //TLY-SD - 10/15/2026 - only show the actual location
//             // end;
//         end;

//         if Item.Get(ItemNo) then begin
//             Item.CalcFields(Item."Qty. to Ship");
//             QuantityToShipSO := Item."Qty. to Ship";
//         end;

//         exit(QuantityToShipSO);
//     end;

//     procedure CalculateQuantityToShipSOall(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityToShipSOall: Decimal
//     var
//         Item: Record Item;
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         QuantityToShipSOall := 0;
//         Item.Reset();

//         if VariantCode <> '' then begin
//             Item.SetFilter("Variant Filter", VariantCode);
//         end;

//         if LocationCode <> '' then begin
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT') //TLY-SD - 10/15/2026 - add in TMT to the TOR number since can take a few days to get into TOR
//             else if LocationCode = 'CAL' then
//                 Item.SetFilter("Location Filter", 'CAL|TOR|TMT') //TLY-SD - 10/15/2026 - add in TOR/TMT to the CAL number since can take a few days to get into CAL
//         end;

//         if Item.Get(ItemNo) then begin
//             Item.CalcFields(Item."Qty. to Ship");
//             QuantityToShipSOall := Item."Qty. to Ship";
//         end;

//         exit(QuantityToShipSOall);
//     end;

//     procedure CalculateQuantityToShipTO(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityToShipTO: Decimal
//     var
//         Item: Record Item;
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         QuantityToShipTO := 0;
//         Item.Reset();

//         if VariantCode <> '' then begin
//             Item.SetFilter("Variant Filter", VariantCode);
//         end;

//         if LocationCode <> '' then begin
//             Item.SetFilter("Location Filter", LocationCode); //TLY-SD - 10/15/2026 - only show the actual location
//         end;

//         if Item.Get(ItemNo) then begin
//             Item.CalcFields(Item."Qty. to Ship (Transfer)");
//             QuantityToShipTO := Item."Qty. to Ship (Transfer)";
//         end;

//         exit(QuantityToShipTO);
//     end;

//     procedure CalculateQuantityToShipTOall(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityToShipTOall: Decimal
//     var
//         Item: Record Item;
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         QuantityToShipTOall := 0;
//         Item.Reset();

//         if VariantCode <> '' then begin
//             Item.SetFilter("Variant Filter", VariantCode);
//         end;

//         if LocationCode <> '' then begin
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT') //TLY-SD - 10/15/2026 - add in TMT to the TOR number since can take a few days to get into TOR
//             else if LocationCode = 'CAL' then
//                 Item.SetFilter("Location Filter", 'CAL|TOR|TMT') //TLY-SD - 10/15/2026 - add in TOR/TMT to the CAL number since can take a few days to get into CAL
//         end;

//         if Item.Get(ItemNo) then begin
//             Item.CalcFields(Item."Qty. to Ship (Transfer)");
//             QuantityToShipTOall := Item."Qty. to Ship (Transfer)";
//         end;

//         exit(QuantityToShipTOall);
//     end;

//     procedure GetBucket1v2Qty(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) Bucket1v2Qty: Decimal
//     var
//         Item: Record "Item";
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         Item.Reset();

//         if VariantCode <> '' then begin
//             Item.SetFilter("Variant Filter", VariantCode);
//         end;

//         if LocationCode <> '' then begin
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TMT')
//             else if LocationCode = 'CAL' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT')
//         end;

//         if Item.Get(ItemNo) then begin
//             Item.CalcFields(Item.Inventory, Item."Qty. to Ship", Item."Qty. to Ship (Transfer)");
//             exit(Item.Inventory - Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)");
//         end;
//     end;

//     procedure GetBucket1v2Date(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) Bucket1v2Date: Date
//     var
//         Item: Record "Item";
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0D);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0D);
//         end;

//         if GetBucket1v2Qty(ItemNo, VariantCode, LocationCode) = 0 then
//             exit(0D);

//         if LocationCode <> '' then begin
//             if LocationCode = 'TOR' then
//                 exit(WorkDate() + 7)
//             else if LocationCode = 'CAL' then
//                 exit(WorkDate() + 14);
//         end;
//     end;

//     procedure GetBucket2v2Date(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) Bucket2v2Date: Date
//     var
//         TransferLine: Record "Transfer Line";
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0D);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0D);
//         end;

//         TransferLine.Reset();
//         TransferLine.SetCurrentKey("Receipt Date");
//         TransferLine.SetFilter("Item No.", ItemNo);
//         TransferLine.SetRange("Transfer-to Code", LocationCode);
//         TransferLine.SetFilter("Qty. in Transit", '<>0');
//         if TransferLine.Find('-') then
//             exit(TransferLine."Receipt Date");
//     end;

//     procedure GetBucket2v2Qty(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) Bucket2v2Qty: Decimal
//     var
//         TransferLine: Record "Transfer Line";
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         TransferLine.Reset();
//         TransferLine.SetFilter("Item No.", ItemNo);
//         TransferLine.SetRange("Transfer-to Code", LocationCode);
//         TransferLine.SetRange("Receipt Date", GetBucket2v2Date(ItemNo, VariantCode, LocationCode));
//         TransferLine.CalcSums("Qty. in Transit");
//         exit(TransferLine."Qty. in Transit");
//     end;

//     procedure GetBucket3v2Date(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) Bucket3v2Date: Date
//     var
//         TransferLine: Record "Transfer Line";
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0D);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0D);
//         end;

//         if GetBucket2v2Date(ItemNo, VariantCode, LocationCode) <> 0D then begin
//             TransferLine.Reset();
//             TransferLine.SetCurrentKey("Receipt Date");
//             TransferLine.SetFilter("Item No.", ItemNo);
//             TransferLine.SetRange("Transfer-to Code", LocationCode);
//             TransferLine.SetFilter("Qty. in Transit", '<>0');
//             TransferLine.SetRange("Receipt Date", GetBucket2v2Date(ItemNo, VariantCode, LocationCode) + 1, 20441201D);
//             if TransferLine.Find('-') then
//                 exit(TransferLine."Receipt Date");
//         end;
//     end;

//     procedure GetBucket3v2Qty(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) Bucket3v2Qty: Decimal
//     var
//         TransferLine: Record "Transfer Line";
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         TransferLine.Reset();
//         TransferLine.SetFilter("Item No.", ItemNo);
//         TransferLine.SetRange("Transfer-to Code", LocationCode);
//         TransferLine.SetRange("Receipt Date", GetBucket3v2Date(ItemNo, VariantCode, LocationCode));
//         TransferLine.CalcSums("Qty. in Transit");
//         exit(TransferLine."Qty. in Transit");
//     end;

//     procedure GetBucket4v2Date(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) Bucket4v2Date: Date
//     var
//         TransferLine: Record "Transfer Line";
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0D);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0D);
//         end;

//         if GetBucket3v2Date(ItemNo, VariantCode, LocationCode) <> 0D then begin
//             TransferLine.Reset();
//             TransferLine.SetCurrentKey("Receipt Date");
//             TransferLine.SetFilter("Item No.", ItemNo);
//             TransferLine.SetRange("Transfer-to Code", LocationCode);
//             TransferLine.SetFilter("Qty. in Transit", '<>0');
//             TransferLine.SetRange("Receipt Date", GetBucket3v2Date(ItemNo, VariantCode, LocationCode) + 1, 20441201D);
//             if TransferLine.Find('-') then
//                 exit(TransferLine."Receipt Date");
//         end;
//     end;

//     procedure GetBucket4v2Qty(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) Bucket4v2Qty: Decimal
//     var
//         TransferLine: Record "Transfer Line";
//     begin
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         TransferLine.Reset();
//         TransferLine.SetFilter("Item No.", ItemNo);
//         TransferLine.SetRange("Transfer-to Code", LocationCode);
//         TransferLine.SetRange("Receipt Date", GetBucket4v2Date(ItemNo, VariantCode, LocationCode));
//         TransferLine.CalcSums("Qty. in Transit");
//         exit(TransferLine."Qty. in Transit");
//     end;
// }