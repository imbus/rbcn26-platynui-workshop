*** Settings ***
Documentation       Test Cases for Mouse Page

Resource            platynui_test_sut.resource

Test Setup          Mouse Click    ${NAV_MOUSE_LISTITEM}
Test Teardown       Mouse Click    ${RESET_APPLICATION_BUTTON}


*** Test Cases ***
Exercise 1: Change The Trail Color
    [Documentation]    Change the Trail Color to "Purple".
    Mouse Click    ${NAV_MOUSE_LISTITEM}

Exercise 2: Detect Double Click
    [Documentation]    Use "Double Click" and check that the text "DOUBLE CLICK!" appears.
    No Operation
