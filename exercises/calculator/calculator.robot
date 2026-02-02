*** Comments ***
The Calculator must be opened manually.


*** Settings ***
Documentation       Test Cases for calculator

Resource            calculator_keywords.resource

Test Setup          Focus Calculator
Test Teardown       Clear Calculator


*** Test Cases ***
Exercise 1 - Addition 5 + 6 = 11
    [Documentation]    Warm-up: run a simple test and get it green.
    ...    Then change the expected value to make it fail (red),
    ...    and fix it again (green).
    Press Keys    ${5_BUTTON}
    Press Keys    ${PLUS_BUTTON}
    Press Keys    ${6_BUTTON}
    Press Keys    ${EQUALS_BUTTON}
    Result Should Be Equal    11

Exercise 2 - Subtraction 9 - 4 = 5
    [Documentation]    Second green test to confirm stability.
    ...    Focus is still on setup, not on advanced design.
    Press Keys    ${9_BUTTON}
    Press Keys    ${MINUS_BUTTON}
    Press Keys    ${4_BUTTON}
    Press Keys    ${EQUALS_BUTTON}
    Result Should Be Equal    5

Exercise 3 - Mini Challenge (Pair Work)
    [Documentation]    In pairs: pick any 2-digit number and add 7.
    ...    Update the button presses + expected result.
    ...    Keep it green without adding sleeps.
    Press Keys    ${2_BUTTON}
    Press Keys    ${3_BUTTON}
    Press Keys    ${PLUS_BUTTON}
    Press Keys    ${7_BUTTON}
    Press Keys    ${EQUALS_BUTTON}
    Result Should Be Equal    30
