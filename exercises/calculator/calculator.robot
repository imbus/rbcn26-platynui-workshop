*** Comments ***
The Calculator must be opened manually.


*** Settings ***
Documentation       Test Cases for calculator

Resource            calculator_keywords.resource

Suite Teardown      Close Calculator
Test Setup          Focus Calculator
Test Teardown       Clear Calculator


*** Test Cases ***
Exercise 1 - Addition 5 + 6 = 11
    [Documentation]    Calculate 5 + 6 and verify the result.
    Activate    ${5_BUTTON}
    Activate    ${PLUS_BUTTON}
    Activate    ${6_BUTTON}
    Activate    ${EQUALS_BUTTON}
    Result Should Be Equal    11

Exercise 2 - Subtraction 9 - 4 = 5
    [Documentation]    Calculate 9 - 4 and verify the result.
    Activate    ${9_BUTTON}
    Activate    ${MINUS_BUTTON}
    Activate    ${4_BUTTON}
    Activate    ${EQUALS_BUTTON}
    Result Should Be Equal    5

Exercise 3 - Multiplication 2 * 8 = 16
    [Documentation]    Calculate 2 * 18 and verify the result.
    Activate    ${2_BUTTON}
    Activate    ${MULTIPLY_BUTTON}
    Activate    ${8_BUTTON}
    Activate    ${EQUALS_BUTTON}
    Result Should Be Equal    16

Exercise 4 - Division 30 / 10 = 3
    [Documentation]    Calculate 30 / 10 and verify the result.
    Activate    ${3_BUTTON}
    Activate    ${0_BUTTON}
    Activate    ${DIVIDE_BUTTON}
    Activate    ${1_BUTTON}
    Activate    ${0_BUTTON}
    Activate    ${EQUALS_BUTTON}
    Result Should Be Equal    3

Exercise 5 - Bring the calculator app "always on top"
    [Documentation]    Find a possibility to bring the calculator app "always on top".
    Activate    ${ALWAYS_ON_TOP_BUTTON}
    Ensure Exists    ${EXIT_ALWAYS_ON_TOP_BUTTON}

Exercise 6 - Exit the "always on top" state
    [Documentation]    Exit the "always on top" state.
    Activate    ${EXIT_ALWAYS_ON_TOP_BUTTON}
    Ensure Exists    ${ALWAYS_ON_TOP_BUTTON}
