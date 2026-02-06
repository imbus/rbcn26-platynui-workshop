*** Settings ***
Library    JsonRpcRemote    uri=tcp://192.168.64.9:8271    library_name=PlatynUI

*** Variables ***
# --- Window ---
${CALC_WINDOW}                  Window[@Name="Rechner" or @Name="Calculator"]
${CLOSE_BUTTON}                 ${CALC_WINDOW}//Button[@AutomationId="Close"]

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


*** Test Cases ***
Exercise 2 - Subtraction 9 - 4 = 5
    [Documentation]    Calculate 9 - 4 and verify the result.
    Activate    ${9_BUTTON}
    Activate    ${MINUS_BUTTON}
    Activate    ${4_BUTTON}
    Activate    ${EQUALS_BUTTON}
    ${text}=    Get Property Value    ${RESULT_TEXT}    Name
    Should Be Equal    ${text}    5
    Sleep    3s
    Activate    ${CLOSE_BUTTON}    # Close calculator