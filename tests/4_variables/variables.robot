*** Settings ***
Library      PlatynUI
Variables    calculator.py

*** Test Cases ***
Addition With Variables
    Activate    ${calculator.n5}
    Activate    ${calculator.plus}
    Activate    ${calculator.n6}
    Activate    ${calculator.equal}
    Get Property Value    ${calculator.result}    Name    should be    11
