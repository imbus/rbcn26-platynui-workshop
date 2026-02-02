*** Settings ***
Documentation       Variables and Keywords for calculator tests

Library             PlatynUI


*** Variables ***
# --- Window ---
${CALC_WINDOW}      Window[@Name="Rechner" or @Name="Calculator"]

# --- Buttons (Windows Calculator / UIA AutomationIds) ---
${BTN_0}            ${CALC_WINDOW}//Button[@AutomationId="num0Button"]
${BTN_1}            ${CALC_WINDOW}//Button[@AutomationId="num1Button"]
${BTN_2}            ${CALC_WINDOW}//Button[@AutomationId="num2Button"]
${BTN_3}            ${CALC_WINDOW}//Button[@AutomationId="num3Button"]
${BTN_4}            ${CALC_WINDOW}//Button[@AutomationId="num4Button"]
${BTN_5}            ${CALC_WINDOW}//Button[@AutomationId="num5Button"]
${BTN_6}            ${CALC_WINDOW}//Button[@AutomationId="num6Button"]
${BTN_7}            ${CALC_WINDOW}//Button[@AutomationId="num7Button"]
${BTN_8}            ${CALC_WINDOW}//Button[@AutomationId="num8Button"]
${BTN_9}            ${CALC_WINDOW}//Button[@AutomationId="num9Button"]

${BTN_PLUS}         ${CALC_WINDOW}//Button[@AutomationId="plusButton"]
${BTN_MINUS}        ${CALC_WINDOW}//Button[@AutomationId="minusButton"]
${BTN_EQUALS}       ${CALC_WINDOW}//Button[@AutomationId="equalButton"]
${BTN_CLEAR}        ${CALC_WINDOW}//Button[@AutomationId="clearButton"]

# --- Result ---
${TXT_RESULT}       ${CALC_WINDOW}//Text[@AutomationId="NormalOutput"]


*** Keywords ***
Focus Calculator
    [Documentation]    Brings the Calculator window to the foreground.
    ...    This prevents sending clicks/keys to the wrong application.
    Activate    ${CALC_WINDOW}

Clear Calculator
    [Documentation]    Resets Calculator input using the Clear button.
    Press Keys    ${BTN_CLEAR}

Result Should Be Equal
    [Documentation]    Asserts that the current calculator result equals the expected value.
    ...    The assertion is strict (exact match).
    [Arguments]    ${expected}
    ${text}=    Get Property Value    ${TXT_RESULT}    Name
    Should Be Equal    ${text}    ${expected}
