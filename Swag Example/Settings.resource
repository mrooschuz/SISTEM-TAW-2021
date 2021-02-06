*** Settings ***
Library     SeleniumLibrary
Library     String
Library     DebugLibrary
Resource    ${EXECDIR}/PageObjects/LoginPage.robot
Resource    ${EXECDIR}/PageObjects/InventoryPage.robot
Resource    ${EXECDIR}/PageObjects/CartPage.robot
Resource    ${EXECDIR}/PageObjects/CheckoutStepOnePage.robot
Resource    ${EXECDIR}/PageObjects/CheckoutStepTwoPage.robot
Resource    ${EXECDIR}/PageObjects/OrderCompletedPage.robot

*** Variables ***
${BROWSER}    chrome
${HOST URL}    https://www.saucedemo.com/
${CorrectPassword}    secret_sauce

# TODO find best place for this
${sTotal}    ${0}