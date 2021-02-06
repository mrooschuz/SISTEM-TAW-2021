*** Settings ***
Resource    ${EXECDIR}/Settings.resource
Test Setup    Navigate to Login Page
Test Teardown    Close Browser

*** Test Cases ***
Adding an item to the cart will increase the counter
    [tags]    Inventory   Add
    Login to SwagLabs    standard_user    ${CorrectPassword}
    Verify user is on inventory page
    Cart should be empty
    Click Add to Cart    1
    Cart should have 1 items
    Click Add to Cart    2
    Cart should have 2 items
    Click Add to Cart    6
    Cart should have 3 items

Removing Items from the cart will decrease the counter
    [tags]    Inventory    Remove
    Login to SwagLabs    standard_user    ${CorrectPassword}
    Verify user is on inventory page
    Cart should be empty
    Click Add to Cart    4
    Cart should have 1 items
    Click Add to Cart    3
    Cart should have 2 items
    Click Add to Cart    5
    Cart should have 3 items
    Click Remove from Cart    4
    Cart should have 2 items
    Click Remove from Cart    5
    Cart should have 1 items
    Click Remove from Cart    3
    Cart should be empty

