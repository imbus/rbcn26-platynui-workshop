*** Settings ***
Documentation       Test Cases for the PlatynUI Test SUT

Resource            test.resource


*** Test Cases ***
Select "Large" RadioButton
    [Documentation]    Select "Large" RadioButton and ensure that it is selected.
    Mouse Click    ${PLATYNUI_SUT_NAV_CONTROLS_LISTITEM}
    Mouse Click    ${PLATYNUI_SUT_LARGE_RADIOBUTTON}
    # TogglePattern.ToggleState tells you if the RadioButton ist activated (1) or deactivated (0)
    Get Property Value    ${PLATYNUI_SUT_LARGE_RADIOBUTTON}    TogglePattern.ToggleState    ==    ${1}
