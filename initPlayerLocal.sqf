[
    "Zeus",
    "Hide Terrain Objects",
    {
        params ["_position","_droppedObject"];
        private _dialogResult =
        [
            "Hide Terrain Objects",
            [
                [
                    "Show or Hide Objects?", ["Hide", "Show"]
                ],
                [
                    "Objects",
                    [
                        "Buildings",
                        "Walls & Fences",
                        "Vegetation",
                        "Everything"
                    ]
                ],
                ["Radius", "", "50"]
            ]
        ] call Ares_fnc_ShowChooseDialog;

        if (_dialogResult isEqualTo []) exitWith {};

        _dialogResult params ["_hideOrShowValue", "_objectValue", "_radiusString"];
        private _hide = _hideOrShowValue isEqualTo 0;
        private _radius = parseNumber _radiusString;
        private _types = ["House"];
        switch (_objectValue) do {
            case 1 : {
                _types = ["Wall", "Fence"];
            };
            case 2 : {
                _types = ["Tree", "Bush", "Rock", "Rocks"];
            };
            case 3 : {
                _types = [];
            };
        };
        
        [
            0,
            {
                params ["_position", "_types", "_radius", "_hide"];
                {
                    _x hideObjectGlobal _hide;
                    _x allowDamage !_hide;
                } forEach nearestTerrainObjects [_position, _types, _radius];
            },
            [_position, _types, _radius, _hide]
        ] call CBA_fnc_globalExecute;
    }
] call Ares_fnc_RegisterCustomModule;