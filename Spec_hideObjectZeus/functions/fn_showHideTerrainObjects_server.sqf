params ["_position", "_types", "_radius", "_hide"];

{
    _x hideObjectGlobal _hide;
} forEach nearestTerrainObjects [_position, _types, _radius];

true
