*** Settings ***
Resource    ${EXECDIR}/Settings.resource

*** Variables ***
${OrderCompletedlocation}   https://www.saucedemo.com/checkout-complete.html
${ThankYoulbl}    //h2[@class="complete-header"][contains(., "THANK YOU FOR YOUR ORDER")]

*** Keywords ***
Verify user is on order complete page
    Wait until location is    ${OrderCompletedlocation}

Verify Order Complete
    Verify user is on order complete page
    Wait Until Element Is Visible    ${ThankYoulbl}
    