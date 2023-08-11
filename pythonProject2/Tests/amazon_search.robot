*** Settings ***
Resource  ../Keywords/amazon_keywords.robot
Library  AppiumLibrary

*** Test Cases ***
Verify that search bar is visible in the amazon app
    [Documentation]  verify that search bar is visible
    Open amazon app and skip login
    Verify search bar is visible

Verify that search bar is clickable
    [Documentation]  verify that search bar is clickable
    Open amazon app and skip login
    Verify search bar is clickable

Verify that the text searched for is displayed in search results
    [Documentation]  verify that the element is displayed in search results
    Open amazon app and skip login
    Click search box and enter search text  ${SEARCH_TEXT}
    Verify search results  ${SEARCH_TEXT}

Verify the UI of search bar before entering search text
    [Documentation]  Verify the UI of search bar before entering search text
    Open amazon app and skip login
    Verify search bar UI without search text

Verify the UI of search bar after entering search text
    [Documentation]    Verify the UI of search bar after entering search text
    Open amazon app and skip login
    Click search box and enter search text  ${SEARCH_TEXT}
    Verify search bar UI with search text

Verify that clicking clear search clears the search
    [Documentation]  Verify that clicking clear search clears the search
    Open amazon app and skip login
    Click search box and enter search text  ${SEARCH_TEXT}
    Verify clicking clear button clears search

Verify image and voice search
    [Documentation]  Verify image and voice search
    Open amazon app and skip login
    Verify scan search
    Verify voice search

Verify placeholder text in search box
    [Documentation]    Verify placeholder text in search box
    Open amazon app and skip login
    Verify placeholder text in search bar

Verify search results UI
    [Documentation]  Verify search results UI
    Open amazon app and skip login
    Click search box and enter search text  ${SEARCH_TEXT}
    Click search result
    Verify search results UI

Verify search without entering any input
    [Documentation]  Verify search without entering input
    Open amazon app and skip login
    Verify search without entering input

Verify search history of the previously searched element
    [Documentation]  Verify that after searching for an item, it is present in the search history
    Open amazon app and skip login
    Click search box and enter search text  ${SEARCH_TEXT}
    Click search result
    Click search bar and click clear button
    Verify search history of the previously searched element

