*** Settings ***
Documentation       Variables and Keywords for calculator tests

Library             PlatynUI


*** Variables ***
# --- Window ---
${CALC_WINDOW}                  Window[@Name="Rechner" or @Name="Calculator"]
${ALWAYS_ON_TOP_BUTTON}         ${CALC_WINDOW}//Button[@AutomationId="NormalAlwaysOnTopButton"]
${EXIT_ALWAYS_ON_TOP_BUTTON}    ${CALC_WINDOW}//Button[@AutomationId="ExitAlwaysOnTopButton"]

# --- Buttons (Windows Calculator / UIA AutomationIds) ---
${0_BUTTON}                     ${CALC_WINDOW}//Button[@AutomationId="num0Button"]
${1_BUTTON}                     ${CALC_WINDOW}//Button[@AutomationId="num1Button"]
${2_BUTTON}                     ${CALC_WINDOW}//Button[@AutomationId="num2Button"]
${3_BUTTON}                     ${CALC_WINDOW}//Button[@AutomationId="num3Button"]
${4_BUTTON}                     ${CALC_WINDOW}//Button[@AutomationId="num4Button"]
${5_BUTTON}                     ${CALC_WINDOW}//Button[@AutomationId="num5Button"]
${6_BUTTON}                     ${CALC_WINDOW}//Button[@AutomationId="num6Button"]
${7_BUTTON}                     ${CALC_WINDOW}//Button[@AutomationId="num7Button"]
${8_BUTTON}                     ${CALC_WINDOW}//Button[@AutomationId="num8Button"]
${9_BUTTON}                     ${CALC_WINDOW}//Button[@AutomationId="num9Button"]

${DIVIDE_BUTTON}                ${CALC_WINDOW}//Button[@AutomationId="divideButton"]
${MULTIPLY_BUTTON}              ${CALC_WINDOW}//Button[@AutomationId="multiplyButton"]
${MINUS_BUTTON}                 ${CALC_WINDOW}//Button[@AutomationId="minusButton"]
${PLUS_BUTTON}                  ${CALC_WINDOW}//Button[@AutomationId="plusButton"]
${EQUALS_BUTTON}                ${CALC_WINDOW}//Button[@AutomationId="equalButton"]
${CLEAR_BUTTON}                 ${CALC_WINDOW}//Button[@AutomationId="clearButton"]

# --- Result ---
${RESULT_TEXT}                  ${CALC_WINDOW}//Text[@AutomationId="NormalOutput"]


*** Keywords ***
Focus Calculator
    [Documentation]    Brings the Calculator window to the foreground.
    ...    This prevents sending clicks/keys to the wrong application.
    Activate    ${CALC_WINDOW}

Clear Calculator
    [Documentation]    Resets Calculator input using the Clear button.
    Activate    ${CLEAR_BUTTON}

Result Should Be Equal
    [Documentation]    Asserts that the current calculator result equals the expected value.
    ...    The assertion is strict (exact match).
    [Arguments]    ${expected}
    ${text}=    Get Property Value    ${RESULT_TEXT}    Name
    Should Be Equal    ${text}    ${expected}
