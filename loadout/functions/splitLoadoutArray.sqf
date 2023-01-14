/* 
	split a loadout array to single variables
	Pour exécuter sur une ou plusieurs unités sélectionnées dans Eden :
	[(get3DENSelected "object")] execVM "loadout\functions\splitLoadoutArray.sqf"
*/

params ["_units"];

private _strOut = "";

private _writeStr = {
	params ["_i","_loArray","_varArray"];
	if (count (_loArray#_i) > 0) then {
		{
			_strOut = _strOut + _x + "=" + str ((_loArray#_i)#_forEachIndex) + ";" + endl;
		} forEach _varArray;
	};
};

{
	
	_role = (_x get3DENAttribute "name")#0;
	if (_role isNotEqualTo "") then {
		_strOut = _strOut + "//" + _role + endl;
	} else {
		_strOut = _strOut + "//role not defined" + endl;
	};
	
	private _loArray = getUnitLoadout _x;

	private _varArray = ["_primaryWeapon","_pwMuzzleAtt","_pwPointer","_pwOptic","_pwMagFirstAmmo","_pwMagSecondAmmo","_pwBipod"];
	[0,_loArray,_varArray] call _writeStr;
	_varArray = ["_secondaryWeapon","_swMuzzleAtt","_swPointer","_swOptic","_swMagFirstAmmo","_swMagSecondAmmo","_swBipod"];
	[1,_loArray,_varArray] call _writeStr;
	_varArray = ["_handgun","_hgMuzzleAtt","_hgPointer","_hgOptic","_hgMagFirstAmmo","_hgMagSecondAmmo","_hgBipod"];
	[2,_loArray,_varArray] call _writeStr;
	_varArray = ["_uniformCls","_itemsU"];
	[3,_loArray,_varArray] call _writeStr;
	_varArray = ["_vestCls","_itemsV"];
	[4,_loArray,_varArray] call _writeStr;
	_varArray = ["_backpackCls","_itemsB"];
	[5,_loArray,_varArray] call _writeStr;
	if (count (_loArray#6) > 0) then {
		_strOut = _strOut + "_headgear" + "=" + str (_loArray#6) + ";" + endl;
	};
	if (count (_loArray#7) > 0) then {
		_strOut = _strOut + "_facewear" + "=" + str (_loArray#7) + ";" + endl;
	};
	_varArray = ["_binocCls","_binocMuzzleAtt","_binocPointer","_binocOptic","_binocMagFirstAmmo","_binocMagSecondAmmo","_binocBipod"];
	[8,_loArray,_varArray] call _writeStr;
	if (count (_loArray#9) > 0) then {
		_strOut = _strOut + "_items" + "=" + str (_loArray#9) + ";" + endl;
	};

} forEach _units;

//Copy variables to clipboard
copyToClipboard _strOut;