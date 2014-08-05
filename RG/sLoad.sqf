private["_loadFromDBClient", "_sendToServer"];

_loadFromDBClient =
"
	private['_array','_varName','_varValue', '_uid'];
	_array = _this;
	_uid = _array select 0;
	if((getplayerUID player) != _uid) exitWith {};
	player commandChat format ['Stats found, Loading... please wait'];
	_varName = _array select 1;
	_varValue = _array select 2;
	
	
	if(playerSide == west) then
	{
		if(_varName == 'moneyAccountWest') then {
			if(!isNil '_varValue') then {
				[player, _varValue] call set_bank_valuez; 
				bankstatsareloaded = true;
			};
		};
		if(_varName == 'WeaponsplayerWest') then {{player addWeapon _x} forEach _varValue;};	
		if(_varName == 'MagazinesplayerWest') then {{player addMagazine _x} forEach _varValue;};	
		if(_varName == 'LicensesWest') then {INV_LicenseOwner = _varValue;};
		if(_varName == 'InventoryWest') then {[player, _varValue] call player_set_inventory;};
		if(_varName == 'privateStorageWest') then {[player,'private_storage', _varValue] call player_set_array;};
		if(_varName == 'FactoryWest') then {INV_Fabrikowner = _varValue;};
		if(_varName == 'positionPlayerWest') then {player setPosATL _varValue;};
	};
	if(playerSide == east) then
	{
		if(_varName == 'moneyAccountEast') then {
			if(!isNil '_varValue') then {
				[player, _varValue] call set_bank_valuez; 
				bankstatsareloaded = true;
			};
		};
		if(_varName == 'LicensesEast') then {INV_LicenseOwner = _varValue;};
		if(_varName == 'InventoryEast') then {[player, _varValue] call player_set_inventory;};
		if(_varName == 'WeaponsplayerEast') then {{player addWeapon _x} forEach _varValue;};	
		if(_varName == 'MagazinesplayerEast') then {{player addMagazine _x} forEach _varValue;};
		if(_varName == 'privateStorageEast') then {[player, 'private_storage', _varValue] call player_set_array;};
		if(_varName == 'FactoryEast') then {INV_Fabrikowner = _varValue;};
		if(_varName == 'positionPlayerEast') then {player setPosATL _varValue;};
	};
	if(playerSide == resistance) then
	{
		if(_varName == 'moneyAccountRes') then {
			if(!isNil '_varValue') then {
				[player, _varValue] call set_bank_valuez; 
				bankstatsareloaded = true;
			};
		};
		if(_varName == 'WeaponsplayerRes') then {{player addWeapon _x} forEach _varValue;};	
		if(_varName == 'MagazinesplayerRes') then {{player addMagazine _x} forEach _varValue;};	
		if(_varName == 'LicensesRes') then {INV_LicenseOwner = _varValue;};
		if(_varName == 'InventoryRes') then {[player, _varValue] call player_set_inventory;};
		if(_varName == 'privateStorageRes') then {[player, 'private_storage', _varValue] call player_set_array;};
		if(_varName == 'FactoryRes') then {INV_Fabrikowner = _varValue;};
		if(_varName == 'positionPlayerRes') then {player setPosATL _varValue;};
	};
	if(playerSide == civilian) then
	{
		if(_varName == 'moneyAccountCiv') then {
			if(!isNil '_varValue') then {
				[player, _varValue] call set_bank_valuez; 
				bankstatsareloaded = true;
			};
		};
		if(_varName == 'WeaponsplayerCiv') then {{player addWeapon _x} forEach _varValue;};	
		if(_varName == 'MagazinesplayerCiv') then {{player addMagazine _x} forEach _varValue;};	
		if(_varName == 'LicensesCiv') then {INV_LicenseOwner = _varValue;};
		if(_varName == 'InventoryCiv') then {[player, _varValue] call player_set_inventory;};
	    if(_varName == 'privateStorageCiv') then {[player, 'private_storage', _varValue] call player_set_array;};
		if(_varName == 'FactoryCiv') then {INV_Fabrikowner = _varValue;};
		if(_varName == 'positionPlayerCiv') then {player setPosATL _varValue;};
	};
";

loadFromDBClient = compile _loadFromDBClient;
//===========================================================================
_sendToServer =
"
	accountToServerLoad = _this;
	publicVariableServer 'accountToServerLoad';
";

sendToServer = compile _sendToServer;
//===========================================================================
"accountToClient" addPublicVariableEventHandler 
{
	(_this select 1) spawn loadFromDBClient;
};
//===========================================================================
statFunctionsLoaded = 1;
