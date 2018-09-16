params ["_position", "_types", "_radius", "_hide"];

{
    _x hideObjectGlobal _hide;
    _x allowDamage !_hide;
} forEach nearestTerrainObjects [_position, _types, _radius];

true
