*** Settings ***
Resource    ${EXECDIR}/Settings.resource

*** Variables ***
${InventoryLocation}    https://www.saucedemo.com/inventory.html
${AddRemoveBtnTemplate}    xpath:(//button[contains(@class, 'btn_inventory')])[{}]
${PriceTemplate}    xpath:(//div[@class="inventory_item_price"])[{}]
${CartLink}    //a[@class="shopping_cart_link fa-layers fa-fw"]
${CartBadge}    //span[@class="fa-layers-counter shopping_cart_badge"]

*** Keywords ***
Verify user is on inventory page
    Wait until location is    ${InventoryLocation}

Click Add to Cart
    [Arguments]    ${aIndex}=1
    ${ButtonLocator}=    Format String    ${AddRemoveBtnTemplate}    ${aIndex}
    Wait Until Element Is Visible    ${ButtonLocator}
    Click Button     ${ButtonLocator}
    ${Price}=    Get Item Price    ${aIndex}
    Add to total    ${Price}    

Get Item Price
    [Arguments]    ${aIndex}
    log   ${aIndex}
    ${priceLocator}=    Format string    ${PriceTemplate}    ${aIndex}
    ${Price}=    Get Text    ${priceLocator}
    ${Price}=    String.Remove String    ${Price}    $
    ${Price}    Convert To Number    ${Price}
    [return]    ${Price}

Add to total
    [Arguments]    ${Price}
    ${lTotal}    Evaluate    ${sTotal}+${Price}
    ${lTotal}=   Evaluate  "%.2f" % ${lTotal}
    Set Suite Variable     ${sTotal}     ${lTotal}

Deduct from total
    [Arguments]    ${Price}
    ${lTotal}    Evaluate    ${sTotal}-${Price}
    ${lTotal}=   Evaluate  "%.2f" % ${lTotal}
    Set Suite Variable     ${sTotal}     ${lTotal}

Click Remove from Cart
    [Arguments]    ${aIndex}=1
    ${ButtonLocator}=    Format String    ${AddRemoveBtnTemplate}    ${aIndex}
    Wait Until Element Is Visible    ${ButtonLocator}
    Click Button     ${ButtonLocator}
    ${Price}=    Get Item Price    ${aIndex}
    Deduct from total    ${Price} 

Cart should be empty
    Element Should Not Be Visible    ${CartBadge}

Cart should have ${count} items
    ${actualCount}=    Get text   ${CartBadge}
    Should Be Equal    ${count}    ${actualCount}

Click Cart
    Click element    ${CartLink}