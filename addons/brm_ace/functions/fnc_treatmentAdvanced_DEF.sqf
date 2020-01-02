#include "ace_script_component.hpp"
/*
 * Author: BromA
 * Callback for the defibrillation treatment action on success.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */

params ["_caller", "_target", "_selectionName", "_className", "_items"];

if (alive _target && {(_target getVariable [QGVAR(inCardiacArrest), false] || _target getVariable [QGVAR(inReviveState), false])}) then {
    if (local _target) then {
        ["brm_ace_main_treatmentAdvanced_DEFLocal", [_caller, _target]] call CBA_fnc_localEvent;
    } else {
        ["brm_ace_main_treatmentAdvanced_DEFLocal", [_caller, _target], _target] call CBA_fnc_targetEvent;
    };
};
true;
