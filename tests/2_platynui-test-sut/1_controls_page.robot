*** Settings ***
Documentation       Test Cases for Control Page

Resource            platynui_workshop/platynui_test_sut.resource

Test Setup          Mouse Click    ${NAV_CONTROLS_LISTITEM}


*** Test Cases ***
Exercise 1: Click "Regular" Button
    [Documentation]    Click "Regular" Button and check that it is clicked.
    Activate    ${REGULAR_BUTTON}
    Ensure Exists    ${STATUSBAR_TEXT}\[@Name="Status: Regular button clicked"]

Exercise 2a: Activate "Flight Mode" Switch (Variante 1)
    [Documentation]    Check if Flight Mode is active - if not, activate it!
    # TogglePattern.ToggleState tells you if the CheckBox is activated (1) or deactivated (0)
    ${state}    Get Property Value    ${FLIGHT_SWITCH_CHECKBOX}    TogglePattern.ToggleState
    IF    not ${state}
        Mouse Click    ${FLIGHT_SWITCH_CHECKBOX}
    ELSE
        No Operation
    END

Exercise 2b: Activate "Flight Mode" Switch (Variante 2)
    [Documentation]    Check if Flight Mode is active - if not, activate it!
    # TogglePattern.ToggleState tells you if the CheckBox is activated (1) or deactivated (0)
    ${state}    Get Property Value    ${FLIGHT_SWITCH_CHECKBOX}    TogglePattern.ToggleState
    IF    not ${state}    Mouse Click    ${FLIGHT_SWITCH_CHECKBOX}

Exercise 3: Select "Large" RadioButton
    [Documentation]    Select "Large" RadioButton and ensure that it is selected.
    Mouse Click    ${NAV_CONTROLS_LISTITEM}
    Mouse Click    ${LARGE_RADIOBUTTON}
    # TogglePattern.ToggleState tells you if the RadioButton is activated (1) or deactivated (0)
    Get Property Value    ${LARGE_RADIOBUTTON}    TogglePattern.ToggleState    ==    ${1}

Exercise 4a: Select A Specific Date And Time
    [Documentation]    Select today's date, 16:30 and verify that it is displayed in the StatusBar (Footer).
    Mouse Click    ${DAY_SPINNER_EDIT}
    Type Keys    .    <CONTROL+a>    <DELETE>
    Type Keys    .    10
    Mouse Click    ${MONTH_SPINNER_EDIT}
    Type Keys    .    <CONTROL+a>    <DELETE>
    Type Keys    .    02
    Mouse Click    ${YEAR_SPINNER_EDIT}
    Type Keys    .    <CONTROL+a>    <DELETE>
    Type Keys    .    2026
    Mouse Click    ${HOUR_SPINNER_EDIT}
    Type Keys    .    <CONTROL+a>    <DELETE>
    Type Keys    .    16
    Mouse Click    ${MINUTE_SPINNER_EDIT}
    Type Keys    .    <CONTROL+a>    <DELETE>
    Type Keys    .    30
    Activate    ${DATE_TIME_SELECT_BUTTON}
    ${footer_text}    Get Property Value    ${STATUSBAR_TEXT}    Name
    Should Be Equal    ${footer_text}    Status: Selected 10/2/2026 16:30

Exercise 4b: Select A Specific Date And Time
    [Documentation]    Select today's date, 16:30 and verify that it is displayed in the StatusBar (Footer).
    Fill In Date    ${DAY_SPINNER_EDIT}    10
    Fill In Date    ${MONTH_SPINNER_EDIT}    02
    Fill In Date    ${YEAR_SPINNER_EDIT}    2026
    Fill In Date    ${HOUR_SPINNER_EDIT}    16
    Fill In Date    ${MINUTE_SPINNER_EDIT}    30
    Activate    ${DATE_TIME_SELECT_BUTTON}
    ${footer_text}    Get Property Value    ${STATUSBAR_TEXT}    Name
    Should Be Equal    ${footer_text}    Status: Selected 10/2/2026 16:30

Exercise 4c: Select A Specific Date And Time
    [Documentation]    Select today’s date, 16:30 and verify it is displayed in the footer.
    FOR    ${field}    ${value}    IN
    ...    ${DAY_SPINNER_EDIT}    10
    ...    ${MONTH_SPINNER_EDIT}    02
    ...    ${YEAR_SPINNER_EDIT}    2026
    ...    ${HOUR_SPINNER_EDIT}    16
    ...    ${MINUTE_SPINNER_EDIT}    30
        Fill In Date    ${field}    ${value}
    END
    Activate    ${DATE_TIME_SELECT_BUTTON}
    ${footer_text}    Get Property Value    ${STATUSBAR_TEXT}    Name
    Should Be Equal    ${footer_text}    Status: Selected 10/2/2026 16:30

Exercise 4d: Select A Specific Date And Time
    [Documentation]    Select today’s date, 16:30 and verify it is displayed in the footer.
    Set Text    ${DAY_SPINNER_EDIT}    10
    Set Text    ${MONTH_SPINNER_EDIT}    02
    Set Text    ${YEAR_SPINNER_EDIT}    2026
    Set Text    ${HOUR_SPINNER_EDIT}    16
    Set Text    ${MINUTE_SPINNER_EDIT}    30
    Activate    ${DATE_TIME_SELECT_BUTTON}
    ${footer_text}    Get Property Value    ${STATUSBAR_TEXT}    Name
    Should Be Equal    ${footer_text}    Status: Selected 10/2/2026 16:30
