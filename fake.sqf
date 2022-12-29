
comment "Exported from Arsenal by tanin69";

comment "[!] UNIT MUST BE LOCAL [!]";
if (!local this) exitWith {};

comment "Remove existing items";
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;
removeGoggles this;

comment "Add weapons";
this addWeapon "arifle_TRG21_F";
this addPrimaryWeaponItem "30Rnd_556x45_Stanag";

comment "Add containers";
this forceAddUniform "U_BG_Guerilla1_1";
this addVest "V_Chestrig_oli";
this addBackpack "B_Carryall_eaf_F";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {this addItemToUniform "30Rnd_556x45_Stanag";};
this addItemToUniform "Chemlight_blue";
for "_i" from 1 to 3 do {this addItemToVest "30Rnd_556x45_Stanag";};
this addItemToVest "HandGrenade";
this addItemToVest "MiniGrenade";
this addItemToVest "SmokeShell";
this addItemToVest "SmokeShellGreen";
this addItemToVest "Chemlight_blue";
this addItemToBackpack "ACE_M14";
this addHeadgear "H_Shemag_olive";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";

comment "Set identity";
[this,"GreekHead_A3_02","male04gre"] call BIS_fnc_setIdentity;

