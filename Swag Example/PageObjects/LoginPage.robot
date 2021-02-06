*** Settings ***
Resource    ${EXECDIR}/Settings.resource
Documentation    This page object will hold all the properties and means of interaction for the 
...              Login Page that can be found at https://www.saucedemo.com/

*** Variables ***
${LoginLocation}    https://www.saucedemo.com
${UserNameEdt}    id:user-name
${PasswordEdt}    id:password
${LoginBtn}    id:login-button

#Error Messages
${LoginErrorMsg}    xpath://h3[@data-test="error"][contains(., "Epic sadface:")]
${ErrorMsgSadFaceMsg}    ${LoginErrorMsg}\[contains(., "Epic sadface:")]
${ErrorMsgWrongUsenamePassword}     ${ErrorMsgSadFaceMsg}\[contains(., "Username and password do not match any user in this service")]
${ErrorMsgLockedOutUser}     ${ErrorMsgSadFaceMsg}\[contains(., "Sorry, this user has been locked out.")]

*** Keywords ***
Navigate to Login Page
    Open Browser    ${HOST URL}   ${BROWSER}
    Set Suite Variable    ${sTotal}    ${0}
    Maximize Browser Window

Populate User Name ${UserName}
    Input Text    ${UserNameEdt}    ${UserName}    clear=True

Populate Password ${Password}
    Input Text    ${PasswordEdt}    ${Password}    clear=True

Click Login Button
    Click Button    ${LoginBtn}

Login to SwagLabs
    [Arguments]    ${UserName}    ${Password}
    Populate User Name ${UserName}
    Populate Password ${Password}
    Click Login Button

Verify correct error message shown
    [Arguments]    ${ErrorLocator}
    Wait Until Element Is Visible    ${ErrorLocator}