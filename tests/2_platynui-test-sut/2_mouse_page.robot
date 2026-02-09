*** Settings ***
Documentation       Test Cases for Mouse Page

Resource            platynui_workshop/platynui_test_sut.resource

Test Setup          Mouse Click    ${NAV_MOUSE_LISTITEM}
# Test Teardown    Mouse Click    ${RESET_APPLICATION_BUTTON}


*** Test Cases ***
Exercise 1: Change The Trail Color
    [Documentation]    Change the Trail Color to "Purple".
    Mouse Click    ${NAV_MOUSE_LISTITEM}
    Mouse Double Click    ${MP_TRAIL_COLOR_COMBOBOX}
    Type Keys    .    Pu

Exercise 2: Detect Double Click
    [Documentation]    Use "Double Click" and check that the text "DOUBLE CLICK!" appears.
    Mouse Double Click    ${MP_DRAWING_AREA_GROUP}
    # ${text}    Get Property Value    ${STATUSBAR_TEXT}    Name
    # Should Be Equal    ${text}    Mouse Double Clicked
