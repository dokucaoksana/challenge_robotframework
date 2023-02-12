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
${SIGNOUTBUTTON}        xpath=//*[@id="__next"]/div[1]/div/div/div/ul[2]/div[2]/div[2]/span
${LANGUAGEBUTTON}       xpath=//span[normalize-space()='Polski']
${ADDPLAYERBUTTON}      xpath=//span[normalize-space()='Add player']
${PLAYER URL}       https://scouts-test.futbolkolektyw.pl/en/players/add
${CLEARBUTTON}      xpath=//span[normalize-space()='Clear']
${LEGDROPDOWN}      xpath=//div[@id='mui-component-select-leg']



*** Test Cases ***
Choose leg
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Click on the Add Player Button
    Choose dropdown Right leg
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
    Wait Until Element Is Visible   ${PAGELOGO}
    Title Should Be    Scouts panel
Click on the Add Player Button
    Click Element    ${ADDPLAYERBUTTON}
    Wait Until Element Is Visible   ${CLEARBUTTON}
Choose dropdown Right leg
    Click Element       ${LEGDROPDOWN}
Assert
    Capture Page Screenshot    chooseleg.png

