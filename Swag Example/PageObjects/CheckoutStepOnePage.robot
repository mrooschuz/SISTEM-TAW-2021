*** Settings ***
Resource    ${EXECDIR}/Settings.resource

*** Variables ***
${Checkout1location}   https://www.saucedemo.com/checkout-step-one.html
${FirstNameEdt}    id:first-name
${LastNameEdt}    id:last-name
${PostalCodeEdt}    id:postal-code
${ContinueBtn}    //input[@class="btn_primary cart_button"][@value="CONTINUE"]
${ErrorLbl}    //h3[@data-test="error"]

#Error Messages
${CheckoutErrorMsg}    //h3[@data-test="error"][contains(., "Error")]
${FirstNameErrorMsg}    ${CheckoutErrorMsg}\[contains(., "First Name")]
${LastNameErrorMsg}    ${CheckoutErrorMsg}\[contains(., "Last Name")]
${PostalCodeErrorMsg}    ${CheckoutErrorMsg}\[contains(., "Postal Code")]

*** Keywords ***
Verify user is on checkout page
    Wait until location is    ${Checkout1location}

Populate first name
    [Arguments]    ${FirstName}
    Wait Until Element Is Visible    ${FirstNameEdt}
    Input Text    ${FirstNameEdt}    ${FirstName}    clear: bool=True
    
Populate last name
    [Arguments]    ${LastName}
    Wait Until Element Is Visible    ${LastNameEdt}
    Input Text    ${LastNameEdt}    ${LastName}    clear: bool=True

Populate PostalCode
    [Arguments]    ${PostalCode}
    Wait Until Element Is Visible    ${PostalCodeEdt}
    Input Text    ${PostalCodeEdt}    ${PostalCode}    clear: bool=True

Click Continue Button
    click element    ${ContinueBtn}

Clear Page
    Clear Element Text    ${FirstNameEdt}
    Clear Element Text    ${LastNameEdt}
    Clear Element Text    ${PostalCodeEdt}

Navigate to checkout page one
    [Arguments]    ${ItemsToAdd}
    Navigate to Login Page
    Login to SwagLabs    standard_user    ${CorrectPassword}
    Verify user is on inventory page
    FOR    ${ItemToAdd}    IN    @{ItemsToAdd}
        Click Add to Cart    ${ItemToAdd}
    END
    Click Cart
    Verify user is on cart page
    Click Checkout Button
    Verify user is on checkout page