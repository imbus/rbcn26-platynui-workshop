*** Comments ***
The Calculator must be opened manually.


*** Settings ***
Documentation       Test Cases for calculator (with some bugs :P)

Resource            calculator_keywords.resource

Test Setup          Focus Calculator
Test Teardown       Clear Calculator


*** Test Cases ***
Exercise 1 - Addition 5 + 6 = 11
    [Documentation]    Warm-up: run a simple test and get it green.
    ...    Then change the expected value to make it fail (red),
    ...    and fix it again (green).
    Type Keys    ${5_BUTTON}
    Type Keys    ${PLUS_BUTTON}
    Type Keys    ${6_BUTTON}
    Type Keys    ${EQUALS_BUTTON}
    Result Should Be Equal    12

Exercise 2 - Subtraction 9 - 4 = 5
    [Documentation]    Second green test to confirm stability.
    ...    Focus is still on setup, not on advanced design.
    Type Keys    ${9_BUTTON}
    Type Keys    ${PLUS_BUTTON}
    Type Keys    ${4_BUTTON}
    Type Keys    ${EQUALS_BUTTON}
    Result Should Be Equal    5

Exercise 3 - Mini Challenge (Pair Work)
    [Documentation]    In pairs: pick any 2-digit number and add 7.
    ...    Update the button presses + expected result.
    ...    Keep it green without adding sleeps.
    Type Keys    ${2_BUTTON}
    Type Keys    ${3_BUTTON}
    Type Keys    ${PLUS_BUTTON}
    Type Keys    ${8_BUTTON}
    Type Keys    ${EQUALS_BUTTON}
    Result Should Be Equal    30
