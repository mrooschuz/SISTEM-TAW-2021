*** Settings ***
Resource    ${EXECDIR}/Settings.resource
Test Setup    Navigate to Login Page
Test Teardown    Close Browser

*** Test Cases ***
Removing items from cart page decreases cart list and cart counter
    [tags]    Cart
    Login to SwagLabs    standard_user    ${CorrectPassword}
    Verify user is on inventory page
    Click Add to Cart    1
    Click Add to Cart    4
    Click Cart
    Verify user is on cart page
    Cart should have 2 items
    Cart list should have 2 items
    Click top remove button
    Cart should have 1 items
    Cart list should have 1 items

#TODO Add a test that will verfiy that the item(s) selected on the first page are the ones that appear in this list
# This will need a suite or test variable list with the items in it
