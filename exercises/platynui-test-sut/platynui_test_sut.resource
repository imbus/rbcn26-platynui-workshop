*** Settings ***
Documentation       PlatynUI Library, Variables and Keywords

Library             PlatynUI


*** Variables ***
# Main Window
${PLATYNUI_SUT_MAIN_WINDOW}                 Window[@Name="Widgets Gallery (QML)"]

## Main Window TitleBar and Buttons
${PLATYNUI_SUT_MINIMIEREN_BUTTON}           ${PLATYNUI_SUT_MAIN_WINDOW}/TitleBar/Button[@Name="Minimieren"]
${PLATYNUI_SUT_MAXIMIEREN_BUTTON}           ${PLATYNUI_SUT_MAIN_WINDOW}/TitleBar/Button[@Name="Maximieren"]
${PLATYNUI_SUT_SCHLIEßEN_BUTTON}            ${PLATYNUI_SUT_MAIN_WINDOW}/TitleBar/Button[@Name="Schließen"]

## Status Bar (Footer)
${PLATYNUI_SUT_STATUSBAR}                   ${PLATYNUI_SUT_MAIN_WINDOW}/StatusBar
${PLATYNUI_SUT_STATUSBAR_TEXT}              ${PLATYNUI_SUT_STATUSBAR}/Text

## Navigation Menu
${PLATYNUI_SUT_NAV_MENU_LIST}               ${PLATYNUI_SUT_MAIN_WINDOW}//List[@Name="Navigation Menu"]
${PLATYNUI_SUT_NAV_CONTROLS_LISTITEM}       ${PLATYNUI_SUT_NAV_MENU_LIST}/ListItem[@Name="Controls Page"]
${PLATYNUI_SUT_NAV_LISTVIEW_LISTITEM}       ${PLATYNUI_SUT_NAV_MENU_LIST}/ListItem[@Name="ListView Page"]
${PLATYNUI_SUT_NAV_TABLEVIEW_LISTITEM}      ${PLATYNUI_SUT_NAV_MENU_LIST}/ListItem[@Name="TableView Page"]
${PLATYNUI_SUT_NAV_TEXTEDIT_LISTITEM}       ${PLATYNUI_SUT_NAV_MENU_LIST}/ListItem[@Name="TextEdit Page"]
${PLATYNUI_SUT_NAV_ABOUT_LISTITEM}          ${PLATYNUI_SUT_NAV_MENU_LIST}/ListItem[@Name="About Page"]

## Controls Page Content
${PLATYNUI_SUT_BUTTONS_GROUP}               ${PLATYNUI_SUT_MAIN_WINDOW}//Group[@Name="Buttons Group"]
${PLATYNUI_SUT_CHECKBOX_COMBOBOX_GROUP}     ${PLATYNUI_SUT_MAIN_WINDOW}//Group[@Name="CheckBox - ComboBox - Switch Group"]
${PLATYNUI_SUT_RADIOBUTTONS_GROUP}          ${PLATYNUI_SUT_MAIN_WINDOW}//Group[@Name="RadioButtons Group"]

### Buttons
${PLATYNUI_SUT_REGULAR_BUTTON}              ${PLATYNUI_SUT_BUTTONS_GROUP}/Button[@Name="Regular Button"]
${PLATYNUI_SUT_PRIMARY_BUTTON}              ${PLATYNUI_SUT_BUTTONS_GROUP}/Button[@Name="Primary Button with Icon"]
${PLATYNUI_SUT_TOOL_BUTTON}                 ${PLATYNUI_SUT_BUTTONS_GROUP}/Button[@Name="Tool Button"]

### Checkbox - ComboBox - Switch
${PLATYNUI_SUT_REGULAR_CHECKBOX}            ${PLATYNUI_SUT_CHECKBOX_COMBOBOX_GROUP}/CheckBox[@Name="Checked Checkbox"]
${PLATYNUI_SUT_SELECT_COMBOBOX}             ${PLATYNUI_SUT_CHECKBOX_COMBOBOX_GROUP}/CheckBox[@Name="Select ComboBox"]
${PLATYNUI_SUT_FLIGHT_SWITCH_CHECKBOX}      ${PLATYNUI_SUT_CHECKBOX_COMBOBOX_GROUP}/CheckBox[@Name="Flight Mode Switch"]

### Radio Buttons
${PLATYNUI_SUT_SMALL_RADIOBUTTON}           ${PLATYNUI_SUT_RADIOBUTTONS_GROUP}/RadioButton[@Name="Small"]
${PLATYNUI_SUT_MEDIUM_RADIOBUTTON}          ${PLATYNUI_SUT_RADIOBUTTONS_GROUP}/RadioButton[@Name="Medium"]
${PLATYNUI_SUT_LARGE_RADIOBUTTON}           ${PLATYNUI_SUT_RADIOBUTTONS_GROUP}/RadioButton[@Name="Large"]

${PLATYNUI_SUT_DATE_TIME_GROUP}             ${PLATYNUI_SUT_MAIN_WINDOW}//Group[@Name="Date/Time Group"]
${PLATYNUI_SUT_SLIDER_PROGRESS_GROUP}       ${PLATYNUI_SUT_MAIN_WINDOW}//Group[@Name="Slider / Progress Group"]
