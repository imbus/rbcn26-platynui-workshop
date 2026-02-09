*** Settings ***
Documentation       Test Cases for Mouse Page

Resource            platynui_workshop/platynui_test_sut.resource

Test Setup          Mouse Click    ${NAV_MOUSE_LISTITEM}
Test Teardown       Mouse Click    ${RESET_APPLICATION_BUTTON}


*** Test Cases ***
Exercise 1: Change The Trail Color
    [Documentation]    Change the Trail Color to "Purple".
    Mouse Click    ${NAV_MOUSE_LISTITEM}
    Mouse Click    ${MP_TRAIL_COLOR_COMBOBOX}
    # ${test}    Get Property Value    ${MP_TRAIL_COLOR_PURPLE_EDIT}    Role
    # Log To Console    ${test}
    Mouse Click    ${MP_TRAIL_COLOR_PURPLE_EDIT}

Exercise 2: Detect Double Click
    [Documentation]    Use "Double Click" and check that the text "DOUBLE CLICK!" appears.
    No Operation
