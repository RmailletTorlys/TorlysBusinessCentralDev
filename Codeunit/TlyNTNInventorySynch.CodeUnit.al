// // February 2, 2026 - DVP copied this from NAV and made slight changes
// // they didnt add the main calc "CalculateInventoryAvailability"
// // April 14, 2026 - SD added back "CalculateInventoryAvailability"
// // also took this and added to our extensions (as opposed to DVPs) so we can modify as we see fit

// codeunit 52231 TlyNTNInventorySynch
// {
//     Subtype = Normal;

//     var
//         DVPNTNSetup: Record "NTN Setup";

//     procedure CalculateInventoryAvailability(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) CalculatedAvailableInventory: Decimal
//     //this is for the specfic location only
//     //this is the main number on the item page and cart page
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

//         if VariantCode <> '' then
//             Item.SetFilter("Variant Filter", VariantCode);

//         if LocationCode <> '' then
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT')
//             else
//                 Item.SetFilter("Location Filter", LocationCode);

//         if Item.Get(ItemNo) then begin
//             Item.CalcFields(Item.Inventory, Item."Qty. to Ship", Item."Qty. to Ship (Transfer)");
//             CalculatedAvailableInventory := Item.Inventory - Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)";
//         end;

//         exit(CalculatedAvailableInventory);
//     end;

//     procedure CalculateBucket1Avail(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityAvailableBucket1: Decimal
//     //this is for the specfic location only
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
//             if LocationCode = 'TOR' then begin
//                 Item.SetFilter("Location Filter", 'TOR|TMT');
//             end else begin
//                 Item.SetFilter("Location Filter", LocationCode);
//             end;
//         end;

//         if Item.Get(ItemNo) then begin
//             EndDate := CalcDate('7D', WorkDate());
//             Item.SetRange("Date Filter", WorkDate(), EndDate);
//             Item.CalcFields(Item.Inventory, Item."Qty. on Sales Order", Item."Qty. to Ship", Item."Qty. to Ship (Transfer)", Item."Qty. in Transit", Item."Qty. on Purch. Order");
//             QuantityAvailableBucket1 := Item.Inventory - CalculateQuantityToShip(Item."No.", VariantCode, LocationCode)
//                                         - Item."Qty. on Sales Order" + Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)"
//                                         + Item."Qty. in Transit" + Item."Qty. on Purch. Order";
//         end;

//         exit(QuantityAvailableBucket1);
//     end;

//     procedure CalculateBucket2Avail(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityAvailableBucket2: Decimal
//     //this is for the specfic location only
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

//         if LocationCode <> '' then
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT')
//             else if LocationCode = 'CAL' then
//                 Item.SetFilter("Location Filter", 'CAL|TOR|TMT') //adding all the locations because expectation is we can transfer it
//             else
//                 Item.SetFilter("Location Filter", LocationCode);

//         if Item.Get(ItemNo) then begin
//             StartDate := CalcDate('8D', WorkDate());
//             EndDate := CalcDate('14D', WorkDate());
//             Item.SetRange("Date Filter", WorkDate(), EndDate);
//             Item.CalcFields(Item.Inventory, Item."Qty. on Sales Order", Item."Qty. to Ship", Item."Qty. to Ship (Transfer)", Item."Qty. in Transit", Item."Qty. on Purch. Order");
//             QuantityAvailableBucket2 := Item.Inventory - CalculateQuantityToShipALL(Item."No.", VariantCode, LocationCode)
//                                         - Item."Qty. on Sales Order" + Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)"
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

//         if LocationCode <> '' then
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT')
//             else if LocationCode = 'CAL' then
//                 Item.SetFilter("Location Filter", 'CAL|TOR|TMT') //adding all the locations because expectation is we can transfer it
//             else
//                 Item.SetFilter("Location Filter", LocationCode);

//         if Item.Get(ItemNo) then begin
//             StartDate := CalcDate('15D', WorkDate());
//             EndDate := CalcDate('21D', WorkDate());
//             Item.SetRange("Date Filter", WorkDate(), EndDate);
//             Item.CalcFields(Item.Inventory, Item."Qty. on Sales Order", Item."Qty. to Ship", Item."Qty. to Ship (Transfer)", Item."Qty. in Transit", Item."Qty. on Purch. Order");
//             QuantityAvailableBucket3 := Item.Inventory - CalculateQuantityToShipALL(Item."No.", VariantCode, LocationCode)
//                                         - Item."Qty. on Sales Order" + Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)"
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

//         if LocationCode <> '' then
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT')
//             else if LocationCode = 'CAL' then
//                 Item.SetFilter("Location Filter", 'CAL|TOR|TMT') //adding all the locations because expectation is we can transfer it
//             else
//                 Item.SetFilter("Location Filter", LocationCode);

//         if Item.Get(ItemNo) then begin
//             StartDate := CalcDate('22D', WorkDate());
//             EndDate := CalcDate('28D', WorkDate());
//             Item.SetRange("Date Filter", WorkDate(), EndDate);
//             Item.CalcFields(Item.Inventory, Item."Qty. on Sales Order", Item."Qty. to Ship", Item."Qty. to Ship (Transfer)", Item."Qty. in Transit", Item."Qty. on Purch. Order");
//             QuantityAvailableBucket4 := Item.Inventory - CalculateQuantityToShipALL(Item."No.", VariantCode, LocationCode)
//                                         - Item."Qty. on Sales Order" + Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)"
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

//         if LocationCode <> '' then
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT')
//             else if LocationCode = 'CAL' then
//                 Item.SetFilter("Location Filter", 'CAL|TOR|TMT') //adding all the locations because expectation is we can transfer it
//             else
//                 Item.SetFilter("Location Filter", LocationCode);

//         if Item.Get(ItemNo) then begin
//             StartDate := CalcDate('29D', WorkDate());
//             EndDate := CalcDate('35D', WorkDate());
//             Item.SetRange("Date Filter", WorkDate(), EndDate);
//             Item.CalcFields(Item.Inventory, Item."Qty. on Sales Order", Item."Qty. to Ship", Item."Qty. to Ship (Transfer)", Item."Qty. in Transit", Item."Qty. on Purch. Order");
//             QuantityAvailableBucket5 := Item.Inventory - CalculateQuantityToShipALL(Item."No.", VariantCode, LocationCode)
//                                     - Item."Qty. on Sales Order" + Item."Qty. to Ship" - Item."Qty. to Ship (Transfer)"
//                                     + Item."Qty. in Transit" + Item."Qty. on Purch. Order";
//         end;

//         exit(QuantityAvailableBucket5);
//     end;

//     procedure CalculateQuantityToShip(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityToShip: Decimal
//     var
//         Item: Record Item;
//     begin
//         //this is for the specfic location only
//         //which is good for bucket 1, but for bucket 2-5 should be all locations
//         //don't expose CAL inventory to TOR
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         QuantityToShip := 0;
//         Item.Reset();

//         if VariantCode <> '' then begin
//             Item.SetFilter("Variant Filter", VariantCode);
//         end;

//         if LocationCode <> '' then begin
//             if LocationCode = 'TOR' then begin
//                 Item.SetFilter("Location Filter", 'TOR|TMT');
//             end else begin
//                 Item.SetFilter("Location Filter", LocationCode);
//             end;
//         end;

//         if Item.Get(ItemNo) then begin
//             Item.CalcFields(Item."Qty. to Ship");
//             QuantityToShip := Item."Qty. to Ship";
//         end;

//         exit(QuantityToShip);
//     end;

//     procedure CalculateQuantityToShipALL(ItemNo: Code[20]; VariantCode: Code[10]; LocationCode: Code[10]) QuantityToShipALL: Decimal
//     var
//         Item: Record Item;
//     begin
//         //this is for all locations
//         //which is good for bucket 2-5
//         if not DVPNTNSetup.ReadPermission then begin
//             Message('You do not have permission to read the NTN Setup record.');
//             exit(0);
//         end;

//         if not DVPNTNSetup.Get() then begin
//             exit(0);
//         end;

//         QuantityToShipALL := 0;
//         Item.Reset();

//         if VariantCode <> '' then
//             Item.SetFilter("Variant Filter", VariantCode);

//         if LocationCode <> '' then
//             if LocationCode = 'TOR' then
//                 Item.SetFilter("Location Filter", 'TOR|TMT')
//             else if LocationCode = 'CAL' then
//                 Item.SetFilter("Location Filter", 'CAL|TOR|TMT')
//             else
//                 Item.SetFilter("Location Filter", LocationCode);

//         if Item.Get(ItemNo) then begin
//             Item.CalcFields(Item."Qty. to Ship");
//             QuantityToShipALL := Item."Qty. to Ship";
//         end;

//         exit(QuantityToShipALL);
//     end;
// }