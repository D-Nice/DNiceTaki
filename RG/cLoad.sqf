startmoneh = 700000;
donatormoneh = 3000000;
silvermoneh = 6000000;
goldmoneh = 12000000;
platinummoneh = 25000000;
vipmoneh = 50000000;
adminmoneh = 80000000;

/*if (isStaff) then {
	startmoneh = adminmoneh;
	INV_CarryingCapacity = 1000;
};*/

private["_uid"];
_uid = getPlayerUID player;

if (_uid in donators1) then {
    startmoneh = donatormoneh;
}
else { if (_uid in donators2) then {
    startmoneh = silvermoneh;
	INV_CarryingCapacity = 100;
}
else { if (_uid in donators3) then {
    startmoneh = goldmoneh;
	INV_CarryingCapacity = 200;
}
else { if (_uid in donators4) then {
	INV_CarryingCapacity = 300;
    startmoneh = platinummoneh;
}
else { if (_uid in donatorsVIP) then {
    startmoneh = VIPmoneh;
	INV_CarryingCapacity = 500;
};};};};};

if (isAdmins) then {
	startmoneh = adminmoneh;
	INV_CarryingCapacity = 1000;
};

//sleep 1;
//player groupChat "Initializing Loading Player Stats If your stats has not yet loaded after this process please relog.";
//sleep 1;
hint "Loading Stats... Please Wait";
//player groupChat "Loading";
//Requests info from server in order to download stats
//player groupChat "Loading. .";
//hint "Stats Loading 10%";
//player groupChat "Loading. . .";
//sleep 1;
//hint "Stats Loading 20%";
//hint "Stats Loading";

sleep 2;
switch (playerSide) do
{
	case west:
	{
		[_uid, _uid, "moneyAccountWest", "NUMBER"] call sendToServer;
		[_uid, _uid, "MagazinesPlayerWest", "ARRAY"] call sendToServer;
		[_uid, _uid, "WeaponsPlayerWest", "ARRAY"] call sendToServer;
		[_uid, _uid, "LicensesWest", "ARRAY"] call sendToServer;
		[_uid, _uid, "InventoryWest", "ARRAY"] call sendToServer;
    	[_uid, _uid, "privateStorageWest", "ARRAY"] call sendToServer;
		[_uid, _uid, "FactoryWest", "ARRAY"] call sendToServer;
		[_uid, _uid, "positionPlayerWest", "ARRAY"] call sendToServer;
	};
	
	case east:
	{
		[_uid, _uid, "moneyAccountEast", "NUMBER"] call sendToServer;
		[_uid, _uid, "MagazinesPlayerEast", "ARRAY"] call sendToServer;
		[_uid, _uid, "WeaponsPlayerEast", "ARRAY"] call sendToServer;
		[_uid, _uid, "LicensesEast", "ARRAY"] call sendToServer;
		[_uid, _uid, "InventoryEast", "ARRAY"] call sendToServer;
    	[_uid, _uid, "privateStorageEast", "ARRAY"] call sendToServer;
		[_uid, _uid, "FactoryEast", "ARRAY"] call sendToServer;
		[_uid, _uid, "positionPlayerEast", "ARRAY"] call sendToServer;
	};
	
	case resistance:
	{
		[_uid, _uid, "moneyAccountRes", "NUMBER"] call sendToServer;
		[_uid, _uid, "MagazinesPlayerRes", "ARRAY"] call sendToServer;
		[_uid, _uid, "WeaponsPlayerRes", "ARRAY"] call sendToServer;
		[_uid, _uid, "LicensesRes", "ARRAY"] call sendToServer;
		[_uid, _uid, "InventoryRes", "ARRAY"] call sendToServer;
		[_uid, _uid, "privateStorageRes", "ARRAY"] call sendToServer;
		[_uid, _uid, "FactoryRes", "ARRAY"] call sendToServer;
		[_uid, _uid, "positionPlayerRes", "ARRAY"] call sendToServer;
	};
	
	case civilian:
	{
		[_uid, _uid, "moneyAccountCiv", "NUMBER"] call sendToServer;
		[_uid, _uid, "MagazinesPlayerCiv", "ARRAY"] call sendToServer;
		[_uid, _uid, "WeaponsPlayerCiv", "ARRAY"] call sendToServer;
		[_uid, _uid, "LicensesCiv", "ARRAY"] call sendToServer;
		[_uid, _uid, "InventoryCiv", "ARRAY"] call sendToServer;
    	[_uid, _uid, "privateStorageCiv", "ARRAY"] call sendToServer;
		[_uid, _uid, "FactoryCiv", "ARRAY"] call sendToServer;
		[_uid, _uid, "positionPlayerCiv", "ARRAY"] call sendToServer;
	};
};
//if(playerSide == west) then
//{
//};
//sleep 1;
//hint "Stats Loading 50%";
//call loadFromDBClient;
//player groupChat "Loading. . . .";
//if(playerSide == east) then
//{

//};
//sleep 1;
//hint "Stats Loading 40%";
//player groupChat "Loading. . . .";
//if(playerSide == resistance) then
//{

//};
//sleep 1;
//hint "Stats Loading 80%";
//player groupChat "Loading. . . . .";
//if(playerSide == civilian) then
//{

//};
//call A_actions;
//sleep 1;
//hint "Stats Loading 100%";
//player groupChat "Loading. . . . . .";

//===========================================================================

//sleep 1;
//END
sleep 4;
player groupChat "Player Stats Loading Complete. If your stats have not yet loaded please relog immediately or risk losing your previous stats";

hint "Loading COMPLETE!";
sleep 10;
if (isNil "bankstatsareloaded") then {
		[player, startmoneh] call set_bank_valuez;
};
statsLoaded = 1;


if ((isdon) && !("donator" call INV_HasLicense)) then {INV_LicenseOwner = INV_LicenseOwner + ["donator"];
			server globalchat "DONATOR ACCOUNT DETECTED: Donator License Added"};

if ((isvip) && !("viplicense" call INV_HasLicense)) then {INV_LicenseOwner = INV_LicenseOwner + ["viplicense"];
			server globalchat "VIP DONATOR ACCOUNT DETECTED: VIP Donator License Added"};

if ((ispmc) && !("pmc_license_journeyman" call INV_HasLicense) && (playerside == civilian)) then {INV_LicenseOwner = INV_LicenseOwner + ["pmc_license_journeyman"];
			server globalchat "PMC ACCOUNT DETECTED: PMC License Added"};
			
if (_uid == "76561198068079024") then {INV_LicenseOwner = INV_LicenseOwner + ["mgslicense"];
			server globalchat "FOXHOUND MEMBER DETECTED: METAL GEAR License Added";
};
if (_uid == "76561198072033337") then {INV_LicenseOwner = INV_LicenseOwner + ["jarlicense"];
			server globalchat "A wild SS Jarhead appears: Jarhead License Added";
};
if (_uid == "76561198046673227") then {INV_LicenseOwner = INV_LicenseOwner + ["bonglicense"];
			server globalchat "Friendly Neighborhood Drug Dealer Identified: Bong Reseller License Added";
};






