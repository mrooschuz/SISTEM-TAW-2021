*** Settings ***
Resource    ${EXECDIR}/Settings.resource
#Ideally these would be suite setup and teardown, but the checkout page autofills fields it is in the same session (these values are not held in cookies)
Test Setup    Navigate to checkout page one    ${ItemList}
Test Teardown    Close Browser

*** Variables ***
@{ItemList}    1    4

*** Test Cases ***
Omit First Name
    [Tags]    Negative
    Populate last name    Smith
    Populate PostalCode    1212
    Click Continue Button
    Verify correct error message shown    ${FirstNameErrorMsg}

Omit Last Name
    [Tags]    Negative
    Populate first name    Johnno
    Populate PostalCode    1212
    Click Continue Button
    Verify correct error message shown    ${LastNameErrorMsg}

Omit Postal Code
    [Tags]    Negative
    Populate first name    Johnno
    Populate last name    Smith
    Click Continue Button
    Verify correct error message shown    ${PostalCodeErrorMsg}

Totals are calculated correctly
    [Tags]    Totals
    Submit test details
    Verify Subtotal amount is correct
    Verify Tax amount is correct
    Verify Total is correct

Checkout is successful
    [Tags]    FullWorkFlow
    Submit test details
    Click Finish Button
    Verify Order Complete

*** Keywords ***
Submit test details
    Populate first name    Johnno
    Populate last name    Smith
    Populate PostalCode    1212
    Click Continue Button
    Verify user is on checkout two page