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



*** Test Cases ***
Change Language
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Click on the Language button
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
Click on the Language button
    Wait Until Element Is Visible   ${PAGELOGO}
    Title Should Be    Scouts panel
    Click Element    ${LANGUAGEBUTTON}
Assert
    Capture Page Screenshot    changelanguage.png
