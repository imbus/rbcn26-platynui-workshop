*** Settings ***
Documentation       PlatynUI Library, Variables and Keywords

Library             PlatynUI


*** Variables ***
# Main Window
${MAIN_WINDOW}                  Window[@Name="Widgets Gallery (QML)"]

## Main Window TitleBar and Buttons
${MINIMIEREN_BUTTON}            ${MAIN_WINDOW}/TitleBar/Button[@Name="Minimieren"]
${MAXIMIEREN_BUTTON}            ${MAIN_WINDOW}/TitleBar/Button[@Name="Maximieren"]
${SCHLIEßEN_BUTTON}             ${MAIN_WINDOW}/TitleBar/Button[@Name="Schließen"]

## Status Bar (Footer)
${STATUSBAR}                    ${MAIN_WINDOW}/StatusBar
${STATUSBAR_TEXT}               ${STATUSBAR}/Text

## Navigation Menu
${NAV_MENU_LIST}                ${MAIN_WINDOW}//List[@Name="Navigation Menu"]
${NAV_CONTROLS_LISTITEM}        ${NAV_MENU_LIST}/ListItem[@Name="Controls Page"]
${NAV_LISTVIEW_LISTITEM}        ${NAV_MENU_LIST}/ListItem[@Name="ListView Page"]
${NAV_TABLEVIEW_LISTITEM}       ${NAV_MENU_LIST}/ListItem[@Name="TableView Page"]
${NAV_TEXTEDIT_LISTITEM}        ${NAV_MENU_LIST}/ListItem[@Name="TextEdit Page"]
${NAV_MOUSE_LISTITEM}           ${NAV_MENU_LIST}/ListItem[@Name="Mouse Page"]
${NAV_ABOUT_LISTITEM}           ${NAV_MENU_LIST}/ListItem[@Name="About Page"]

## Controls Page Content
${BUTTONS_GROUP}                ${MAIN_WINDOW}//Group[@Name="Buttons Group"]
${CHECKBOX_COMBOBOX_GROUP}      ${MAIN_WINDOW}//Group[@Name="CheckBox - ComboBox - Switch Group"]
${RADIOBUTTONS_GROUP}           ${MAIN_WINDOW}//Group[@Name="RadioButtons Group"]

### Buttons
${REGULAR_BUTTON}               ${BUTTONS_GROUP}/Button[@Name="Regular Button"]
${PRIMARY_BUTTON}               ${BUTTONS_GROUP}/Button[@Name="Primary Button with Icon"]
${TOOL_BUTTON}                  ${BUTTONS_GROUP}/Button[@Name="Tool Button"]

### Checkbox - ComboBox - Switch
${REGULAR_CHECKBOX}             ${CHECKBOX_COMBOBOX_GROUP}/CheckBox[@Name="Checked Checkbox"]
${SELECT_COMBOBOX}              ${CHECKBOX_COMBOBOX_GROUP}/CheckBox[@Name="Select ComboBox"]
${FLIGHT_SWITCH_CHECKBOX}       ${CHECKBOX_COMBOBOX_GROUP}/CheckBox[@Name="Flight Mode Switch"]

### Radio Buttons
${SMALL_RADIOBUTTON}            ${RADIOBUTTONS_GROUP}/RadioButton[@Name="Small"]
${MEDIUM_RADIOBUTTON}           ${RADIOBUTTONS_GROUP}/RadioButton[@Name="Medium"]
${LARGE_RADIOBUTTON}            ${RADIOBUTTONS_GROUP}/RadioButton[@Name="Large"]

### Date / Time
${DATE_TIME_GROUP}              ${MAIN_WINDOW}//Group[@Name="Date/Time Group"]
${DAY_SPINNER_EDIT}             ${DATE_TIME_GROUP}/Spinner[@Name="Day"]/Edit
${MONTH_SPINNER_EDIT}           ${DATE_TIME_GROUP}/Spinner[@Name="Month"]/Edit
${YEAR_SPINNER_EDIT}            ${DATE_TIME_GROUP}/Spinner[@Name="Year"]/Edit
${HOUR_SPINNER_EDIT}            ${DATE_TIME_GROUP}/Spinner[@Name="Hour"]/Edit
${MINUTE_SPINNER_EDIT}          ${DATE_TIME_GROUP}/Spinner[@Name="Minute"]/Edit
${DATE_TIME_SELECT_BUTTON}      ${DATE_TIME_GROUP}/Button[@Name="Select Date and Time"]

### Slider / Progress
${SLIDER_PROGRESS_GROUP}        ${MAIN_WINDOW}//Group[@Name="Slider / Progress Group"]
${PROGRESS_SLIDER}              ${SLIDER_PROGRESS_GROUP}/Slider[@Name="Progress Slider"]


*** Keywords ***
Fill In Date
    [Documentation]    Select a Date / Time Edit and type in the value.
    [Arguments]    ${field}    ${value}
    Mouse Click    ${field}
    Type Keys    .    <CONTROL+a>    <DELETE>
    Type Keys    .    ${value}
