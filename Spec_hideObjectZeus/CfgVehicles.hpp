class CfgVehicles {
    class Logic;
    class Module_F : Logic {
    };

    class Spec_hideObjectZeus_module : Module_F {
        mapSize = 1;
        author = "SpecOp0";
        vehicleClass = "Modules";
        category = "Curator";
        side = 7;

        scope = 1;
        scopeCurator = 2;

        displayName = $STR_Spec_hideObjectZeus_moduleName;

        function = "Spec_hideObjectZeus_fnc_showHideTerrainObjects_module";
        functionPriority = 1;

        isGlobal = 0;
        isTriggerActivated = 0;
        isDisposable = 0;
    };
};