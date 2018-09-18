params [ ["_logic",objNull,[objNull]], ["_affectedUnits",[],[[]]], ["_isActivated",true,[true]] ];
private _position = position _logic;

// let user decide which objects to hide or show
private _dialogResult =
[
    localize "STR_Spec_hideObjectZeus_moduleName",
    [
        [
            localize "STR_Spec_hideObjectZeus_showOrHideQuestion",
            [
                localize "STR_Spec_hideObjectZeus_showOrHideQuestion_hide",
                localize "STR_Spec_hideObjectZeus_showOrHideQuestion_show"
            ]
        ],
        [
            localize "STR_Spec_hideObjectZeus_objectTypeQuestion",
            [
                localize "STR_Spec_hideObjectZeus_objectTypeQuestion_buildings",
                localize "STR_Spec_hideObjectZeus_objectTypeQuestion_wallsAndFences",
                localize "STR_Spec_hideObjectZeus_objectTypeQuestion_vegetation",
                localize "STR_Spec_hideObjectZeus_objectTypeQuestion_everything"
            ]
        ],
        [localize "STR_Spec_hideObjectZeus_radius", "", "50"]
    ]
] call Ares_fnc_ShowChooseDialog;

if (_dialogResult isEqualTo []) exitWith {};

// parse result
_dialogResult params ["_hideOrShowValue", "_objectTypeValue", "_radiusString"];
private _hide = _hideOrShowValue isEqualTo 0;
private _radius = parseNumber _radiusString;
private _types = ["House"];
switch (_objectTypeValue) do {
    case 1 : {
        _types = ["Wall", "Fence"];
    };
    case 2 : {
        _types = ["Tree", "Bush", "Rock", "Hide"];
    };
    case 3 : {
        _types = [];
    };
};

// hide object must be called on server
[_position, _types, _radius, _hide] remoteExec ["Spec_hideObjectZeus_fnc_showHideTerrainObjects_server", 2];

true
