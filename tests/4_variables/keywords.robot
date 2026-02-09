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

Root Element Setting
    Set Root Element    Window[@Name="Rechner" or @Name="Calculator"]
    Activate   .//Button[@AutomationId="num5Button"]
    Activate   .//Button[@AutomationId="plusButton"]
    Activate   .//Button[@AutomationId="num6Button"]
    Activate   .//Button[@AutomationId="equalButton"]
    Get Property Value    .//Text[@AutomationId="NormalOutput"]    Name    equal    11

Get Text And Set Text
    Ensure Exists    Window[@Name="Widgets Gallery (QML)"]
    Set Root Element    Window[@Name="Widgets Gallery (QML)"]
    Ensure Exists    .//ListItem[@AutomationId="QGuiApplication.ApplicationWindow_QMLTYPE_74.ApplicationWindowContentControl.SplitView_QMLTYPE_82.navigationPane.navigationList.navItem_TextEdit"]
    Mouse Click    .//ListItem[@AutomationId="QGuiApplication.ApplicationWindow_QMLTYPE_74.ApplicationWindowContentControl.SplitView_QMLTYPE_82.navigationPane.navigationList.navItem_TextEdit"]
    Set Text    .//Edit[@AutomationId="QGuiApplication.ApplicationWindow_QMLTYPE_74.ApplicationWindowContentControl.SplitView_QMLTYPE_82.contentPane.pageStack.ScrollView_QMLTYPE_11.wrapTextEdit"]    Hello PlatynUI
    ${text}    Get Property Value    .//Edit[@AutomationId="QGuiApplication.ApplicationWindow_QMLTYPE_74.ApplicationWindowContentControl.SplitView_QMLTYPE_82.contentPane.pageStack.ScrollView_QMLTYPE_11.wrapTextEdit"]    Name
    Log    ${text}