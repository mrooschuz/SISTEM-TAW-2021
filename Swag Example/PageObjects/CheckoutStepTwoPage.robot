*** Settings ***
Resource    ${EXECDIR}/Settings.resource

*** Variables ***
${Checkout2location}   https://www.saucedemo.com/checkout-step-two.html
${SubTotalLbl}    //div[@class="summary_subtotal_label"]
${TaxLbl}    //div[@class="summary_tax_label"]
${TotalLbl}    //div[@class="summary_total_label"]
${FinishBtn}    //a[@class="btn_action cart_button"]

*** Keywords ***
Verify user is on checkout two page
    Wait until location is    ${Checkout2location}

Verify Subtotal amount is correct
    ${PageSubTotal}=    Get Subtotal from Page
    Should Be Equal As Numbers    ${sTotal}    ${PageSubTotal}
    
Get Subtotal from Page
    ${Amount}=    Get Text    ${SubTotalLbl}
    ${Amount}=    Remove String    ${Amount}    Item total: $
    [return]    ${Amount}

Verify Tax amount is correct
    ${PageTax}=    Get Tax amount
    ${CalculatedTax}=    Calculate Tax
    Should Be Equal As Numbers    ${PageTax}    ${CalculatedTax}
    
Get Tax amount    
    ${Amount}=    Get Text    ${TaxLbl}
    ${Amount}=    Remove String    ${Amount}    Tax: $
    [return]    ${Amount}

Calculate Tax
    ${Tax}=    Evaluate   ${sTotal}/12.5
    ${Tax}=   Evaluate  "%.2f" % ${Tax}
    [return]    ${Tax}

Verify Total is correct
    ${PageTotal}=    Get Total from Page
    ${CalculatedTotal}=    Get Calculated Total
    Should Be Equal As Numbers    ${PageTotal}    ${CalculatedTotal}    precision=2

Get Total from Page
    ${Total}=    Get Text    ${TotalLbl}
    ${Total}=    Remove String    ${Total}    Total: $
    [return]    ${Total}

Get Calculated Total
    ${SubTotal}=     Get Subtotal from Page 
    ${tax}=    Calculate Tax
    ${CalculatedTotal}=    Evaluate    ${SubTotal}+${tax}
    [return]    ${CalculatedTotal}

Click Finish Button
    click element    ${FinishBtn}
