*** Test Cases ***
*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website
*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//button[@type='submit']
${EMAILFIELD}       xpath=//*[@id='login']
${PASSWORDFIELD}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//div[@title='Logo Scouts Panel']
${ADDPLAYERBUTTON}      xpath=//*[2][name()="a"]/button
${NAMEFIELD}        xpath=//input[@name="name"]
${SURNAMEFIELD}     xpath=//input[@name="surname"]
${AGEFIELD}     xpath=//input[@name="age"]
${MAINPOSITIONFIELD}        xpath=//input[@name="mainPosition"]
${SUBMITADDPLAYERBUTTON}        xpath=//*[text()= "Submit"]
${SUCCESSADDPLAYER}        xpath=//div[@role="alert"]
${CLEARBUTTON}      xpath=//span[normalize-space()='Clear']



*** Test Cases ***
Add new player
    Open Login Page
    Type In Email
    Type In Password
    Click On The Submit Button
    Wait Until Page Contains Element    ${ADDPLAYERBUTTON}
    Click Add Player Button
    Type In Name
    Type In Surname
    Type in Age
    Type in Main Position
    Click Submit Button
    Assert
    [Teardown]    Close Browser


*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text    ${EMAILFIELD}     user01@getnada.com
Type in password
    Input Password    ${PASSWORDFIELD}      Test-1234
Click on the Submit button
    Click Element    ${SIGNINBUTTON}
Assert dashboard
    Wait Until Element Is Visible   ${PAGELOGO}
    Title Should Be    Scouts panel
Click Add Player Button
    Click Element   ${ADDPLAYERBUTTON}
    Wait Until Element Is Visible   ${CLEARBUTTON}
Type In Name
    Input Text    ${NAMEFIELD}  John
Type In Surname
    Input Text    ${SURNAMEFIELD}   Doe
Type in Age
    Input Text    ${AGEFIELD}   01011999
Type in Main Position
    Input Text    ${MAINPOSITIONFIELD}  Main
Click Submit Button
    Click Element    ${SUBMITADDPLAYERBUTTON}
Assert
    Wait Until Page Contains Element    ${SUCCESSADDPLAYER}
    Capture Page Screenshot    add_player_page.png