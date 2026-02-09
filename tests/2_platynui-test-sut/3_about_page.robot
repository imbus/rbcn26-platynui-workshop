*** Settings ***
Documentation       Test Cases for About Page

Resource            platynui_workshop/platynui_test_sut.resource

Test Setup          Mouse Click    ${NAV_ABOUT_LISTITEM}


*** Test Cases ***
Exercise 1: Read Out Information And Log Them To Console
    [Documentation]    Read out the following information and log them to console: Version, Technology and Purpose.
    ${version}    Get Property Value    ${VERSION_TEXT}    Name
    ${technology}    Get Property Value    ${TECHNOLOGY_TEXT}    Name
    ${purpose}    Get Property Value    ${PURPOSE_TEXT}    Name
    Log To Console    ${version}
    Log To Console    ${technology}
    Log To Console    ${purpose}

Exercise 2: Read Out Information And Log Them
    [Documentation]    Read out the following information and log them to console: Version, Technology and Purpose.
    ${version}    Get Property Value    ${VERSION_TEXT}    Name
    ${technology}    Get Property Value    ${TECHNOLOGY_TEXT}    Name
    ${purpose}    Get Property Value    ${PURPOSE_TEXT}    Name
    Log Many    ${version}    ${technology}    ${purpose}

Exercise 3: Find The Secret Easteregg
    [Documentation]    Find the secret Easteregg!
    ...    Navigate to TextEdit Page and enter the following text: Very very early stage!
    ...    Then search for any change.
    Mouse Click    ${NAV_TEXTEDIT_LISTITEM}
    # Set Text    ${TEXT_EDIT_PAGE_EDIT}    Very very early stage!
    Type Keys    ${TEXT_EDIT_PAGE_EDIT}    <CONTROL+a>    <DELETE>    Very very early stage!
    Mouse Click    ${NAV_ABOUT_LISTITEM}
    FOR    ${i}    IN RANGE    7
        Mouse Click    ${EASTER_EGG_BUTTON}
    END
    Ensure Exists    ${VERY_EARLY_STAGE_TEXT}
    ${text}    Get Property Value    ${STATUSBAR_TEXT}    Name
    Log To Console    ${text}
