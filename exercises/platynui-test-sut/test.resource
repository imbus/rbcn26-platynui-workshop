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

### Radio Buttons
${PLATYNUI_SUT_SMALL_RADIOBUTTON}           ${PLATYNUI_SUT_RADIOBUTTONS_GROUP}/RadioButton[@Name="Small"]
${PLATYNUI_SUT_MEDIUM_RADIOBUTTON}          ${PLATYNUI_SUT_RADIOBUTTONS_GROUP}/RadioButton[@Name="Medium"]
${PLATYNUI_SUT_LARGE_RADIOBUTTON}           ${PLATYNUI_SUT_RADIOBUTTONS_GROUP}/RadioButton[@Name="Large"]

${PLATYNUI_SUT_DATE_TIME_GROUP}             ${PLATYNUI_SUT_MAIN_WINDOW}//Group[@Name="Date/Time Group"]
${PLATYNUI_SUT_SLIDER_PROGRESS_GROUP}       ${PLATYNUI_SUT_MAIN_WINDOW}//Group[@Name="Slider / Progress Group"]
