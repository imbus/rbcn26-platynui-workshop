*** Settings ***
Documentation       Test Cases for the PlatynUI Test SUT

Resource            platynui_test_sut.resource


*** Test Cases ***
Click "Regular" Button
    [Documentation]    Click "Regular" Button and check that it is clicked.
    Activate    ${PLATYNUI_SUT_REGULAR_BUTTON}
    Ensure Exists    ${PLATYNUI_SUT_STATUSBAR_TEXT}\[@Name="Status: Regular clicked"]

Activate "Flight Mode" Switch (Variante 1)
    [Documentation]    Check if Flight Mode is active - if not, activate it!
    Mouse Click    ${PLATYNUI_SUT_FLIGHT_SWITCH_CHECKBOX}
    # TogglePattern.ToggleState tells you if the CheckBox is activated (1) or deactivated (0)
    Get Property Value    ${PLATYNUI_SUT_FLIGHT_SWITCH_CHECKBOX}    TogglePattern.ToggleState    ==    ${1}
    ${state}    Get Property Value    ${PLATYNUI_SUT_FLIGHT_SWITCH_CHECKBOX}    TogglePattern.ToggleState
    IF    ${state} == 0
        Mouse Click    ${PLATYNUI_SUT_FLIGHT_SWITCH_CHECKBOX}
    ELSE
        No Operation
    END

Activate "Flight Mode" Switch (Variante 2)
    [Documentation]    Check if Flight Mode is active - if not, activate it!
    Mouse Click    ${PLATYNUI_SUT_FLIGHT_SWITCH_CHECKBOX}
    # TogglePattern.ToggleState tells you if the CheckBox is activated (1) or deactivated (0)
    Get Property Value    ${PLATYNUI_SUT_FLIGHT_SWITCH_CHECKBOX}    TogglePattern.ToggleState    ==    ${1}
    ${state}    Get Property Value    ${PLATYNUI_SUT_FLIGHT_SWITCH_CHECKBOX}    TogglePattern.ToggleState
    IF    not ${state}    Mouse Click    ${PLATYNUI_SUT_FLIGHT_SWITCH_CHECKBOX}

Select "Large" RadioButton
    [Documentation]    Select "Large" RadioButton and ensure that it is selected.
    Mouse Click    ${PLATYNUI_SUT_NAV_CONTROLS_LISTITEM}
    Mouse Click    ${PLATYNUI_SUT_LARGE_RADIOBUTTON}
    # TogglePattern.ToggleState tells you if the RadioButton is activated (1) or deactivated (0)
    Get Property Value    ${PLATYNUI_SUT_LARGE_RADIOBUTTON}    TogglePattern.ToggleState    ==    ${1}
