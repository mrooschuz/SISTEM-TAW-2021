*** Settings ***
Resource    ${EXECDIR}/Settings.resource
Suite Setup    Navigate to Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Incorrect Password
    Login to SwagLabs    standard_user    not_my_password
    Verify correct error message shown    ${ErrorMsgWrongUsenamePassword}

Locked out User
    Login to SwagLabs    locked_out_user    ${CorrectPassword}
    Verify correct error message shown    ${ErrorMsgLockedOutUser}

#TODO Add more tests for the other user types