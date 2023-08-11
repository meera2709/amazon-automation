*** Settings ***
Resource  ../Keywords/amazon_keywords.robot
Library  AppiumLibrary

*** Test Cases ***
Verify empty cart UI
    [Documentation]  Verify empty cart UI
    Open amazon app and skip login
    Click cart icon
    Verify empty cart UI

Verify item in present in cart after adding it
    [Documentation]  Verify item is present in cart after adding it
    Open amazon app and skip login
    Click search box and enter search text  ${SEARCH_TEXT}
    Click on first result
    Add product to cart
    Click cart icon
    Verify added item is present in cart

Verify cart UI with items
    [Documentation]  Verify cart UI with items
    Open amazon app and skip login
    Click search box and enter search text  ${SEARCH_TEXT}
    Click on first result
    Add product to cart
    Click cart icon
    Verify cart UI with items

Verify cart count increment
    [Documentation]  Verify cart count increment
    Open amazon app and skip login
    Click search box and enter search text  ${SEARCH_TEXT}
    Click on first result
    Add product to cart
    Click cart icon
    verify count increment in cart

Verify cart count decrement to zero
    [Documentation]  Verify cart count decrement to zero
    Open amazon app and skip login
    Click search box and enter search text  ${SEARCH_TEXT}
    Click on first result
    Add product to cart
    Click cart icon
    Verify count decrement to zero
