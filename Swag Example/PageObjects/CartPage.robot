*** Settings ***
Resource    ${EXECDIR}/Settings.resource

*** Variables ***
${Cartlocation}   https://www.saucedemo.com/cart.html
${CheckoutBtn}    //a[@class="btn_action checkout_button"]
${ContinueShoppingBtn}    //a[@class="btn_secondary"][contains(., "Continue Shopping")]
${ItemPriceTemplate}    (//div[@class="inventory_item_price"])[1]
${RemoveButton}    //button[@class="btn_secondary cart_button"]

*** Keywords ***
Verify user is on cart page
    Wait until location is    ${Cartlocation}

Click Checkout Button
    Scroll Element Into View    ${CheckoutBtn}
    click element    ${CheckoutBtn}

Click Continue Shopping Button
    Click Element    ${ContinueShoppingBtn}

Cart list should have ${DesiredCount} items
    ${ActualCount}    Get Element Count    ${RemoveButton}
    Should Be Equal As Integers    ${DesiredCount}    ${ActualCount}

Click top remove button
    Scroll Element Into View    ${RemoveButton}
    click element    (${RemoveButton})[1]