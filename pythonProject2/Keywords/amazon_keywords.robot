*** Settings ***
Library  AppiumLibrary

*** Variables ***
#configurations
${REMOTE_URL}  http://localhost:4723/wd/hub
${DEVICE_NAME}  emulator-5554
${DEVICE_PLATFORM_VERSION}  11
${DEVICE_PLATFORM}  Android
${PACKAGE_NAME}  com.amazon.mShop.android.shopping
${ACTIVITY_NAME}  com.amazon.mShop.home.HomeActivity

#id locators for elements
${SEARCH_BAR}  chrome_search_hint_view
${INPUT_SEARCH_BAR}  rs_search_src_text
${BUTTON_SKIP_LOGIN}  skip_sign_in_button
${CLEAR_SEARCH}  rs_clear_text_button_accessibility
${SEARCH_ICON}  chrome_action_bar_search_icon
${BACK_BUTTON}  chrome_action_bar_back_icon_image
${SCAN_BUTTON}  search_right_cam_img
${VOICE_BUTTON}  search_right_mic_img
${ALLOW_MIC_ACCESS}  start_voice_button
${NOT_NOW}  close_btn
${LEGAL_NOTICE}  modes_v2_legal_notice
${CLOSE_SCAN}  modes_legal_close_button
${FILTERS}   s-all-filters
${LOCATION}  glow_subnav_label
${BOTTOM_NAV}  bottom_overlay_bar_container
${ADD_TO_CART}  add-to-cart-button
${CART_ICON}  cart_count
${ITEM_TITLE_CART}  item_title
${ITEM_COUNT}  item_count
${ITEM_COUNT_INCREMENT}  item_count_plus
${ITEM_COUNT_DECREMENT}  item_count_minus

#xpath locators
${SEARCH_RESULT}  (//android.widget.Button)[3]
${IMAGE_PRODUCT}  (//android.widget.Image)[1]

#text locators
${VOICE_MESSAGE_1}  Using your voice you can…
${VOICE_MESSAGE_2}  Search
${VOICE_MESSAGE_3}  Reorder
${VOICE_MESSAGE_4}  "Best-selling cameras"
${VOICE_MESSAGE_5}  "Reorder paper towels"
${CAMERA_PERMISSION}  Use camera to scan barcodes, find pantry, health & beauty products.
${AMAZON_SEARCH_PLACEHOLDER}  Search Amazon
${EMPTY_CART_PLACEHOLDER}  Empty Cart Saturated
${YOUR_AMAZON_CART_IS_EMPTY}  Your Amazon Cart is empty
${GOOD_STUFF_GOES_IN_HERE}  Good stuff goes in here
${SHOP_TODAYS_DEALS}  Shop today's deals
${SIGN_IN_EMPTY_CART}  Sign in to your account
${SIGN_UP_NOW}  Sign up now
${CONTINUE_SHOPPING}  Continue shopping
${SHOPPING_CART}  Shopping cart
${SUBTOTAL}  Subtotal
${PROCEED_TO_BUY}  Proceed to Buy

#inputs
${SEARCH_TEXT}  iPhone 12 case

*** Keywords ***
Open amazon app and skip login
    [Documentation]  opens amazon app
    open application  ${REMOTE_URL}  platformName=${DEVICE_PLATFORM}  platformVersion=${DEVICE_PLATFORM_VERSION}  deviceName=${DEVICE_NAME}  appPackage=${PACKAGE_NAME}  appActivity=${ACTIVITY_NAME}
    sleep  10
    wait until element is visible  ${BUTTON_SKIP_LOGIN}
    click element  ${BUTTON_SKIP_LOGIN}

Click search box and enter search text
    [Documentation]  clicks search box
    [Arguments]  ${search_text}
    wait until element is visible  ${SEARCH_BAR}
    click element  ${SEARCH_BAR}
    input text  ${INPUT_SEARCH_BAR}  ${search_text}

Verify search bar is visible
    [Documentation]  verify search bar is visible
    page should contain element  ${SEARCH_BAR}

Verify search bar is clickable
    [Documentation]  verify that search bar is clickable
    wait until page contains element  ${SEARCH_BAR}
    click element  ${SEARCH_BAR}
    page should contain element  ${INPUT_SEARCH_BAR}

Click search result
    [Documentation]  click the search result
    wait until element is visible  ${SEARCH_RESULT}
    click element  ${SEARCH_RESULT}

Verify search results
    [Documentation]  verify search results
    [Arguments]  ${search_text}
    element should contain text  ${SEARCH_RESULT}  ${search_text}

Verify search bar UI without search text
    [Documentation]  Verify search bar UI without search text
    page should contain element  ${SEARCH_ICON}
    page should not contain element  ${CLEAR_SEARCH}
    page should contain element  ${BACK_BUTTON}
    page should contain element  ${SCAN_BUTTON}
    page should contain element  ${VOICE_BUTTON}

Verify search bar UI with search text
    [Documentation]  Verify search bar UI with search text
    page should contain element  ${SEARCH_ICON}
    page should contain element  ${CLEAR_SEARCH}
    page should contain element  ${BACK_BUTTON}
    page should not contain element  ${SCAN_BUTTON}
    page should not contain element  ${VOICE_BUTTON}

Click search bar and click clear button
    [Documentation]  Click search bar
    click element  ${SEARCH_BAR}
    click element  ${CLEAR_SEARCH}

Verify clicking clear button clears search
    [Documentation]  Verify clicking clear button clears search
    click element  ${CLEAR_SEARCH}
    page should contain element  ${SCAN_BUTTON}
    page should contain element  ${VOICE_BUTTON}

Verify search history of the previously searched element
    [Documentation]  Verify search history of the searched element
    [Arguments]  ${search_text}
    ${displayed_item}  get element attribute  ${SEARCH_RESULT}  text
    should contain  ${displayed_item}  ${search_text}


Verify voice search
    [Documentation]  Verify voice search
    click element  ${VOICE_BUTTON}
    page should contain element  ${VOICE_MESSAGE_1}
    page should contain element  ${VOICE_MESSAGE_2}
    page should contain element  ${VOICE_MESSAGE_3}
    page should contain element  ${VOICE_MESSAGE_4}
    page should contain element  ${VOICE_MESSAGE_5}


Verify scan search
    [Documentation]  Verify scan search
    click element  ${SCAN_BUTTON}
    page should contain element  ${CAMERA_PERMISSION}
    page should contain element  ${LEGAL_NOTICE}
    click element  ${CLOSE_SCAN}

Verify placeholder text in search bar
    [Documentation]   Verify placeholder text in search bar
    wait until element is visible  ${SEARCH_BAR}
    element should contain text  ${SEARCH_BAR}  ${AMAZON_SEARCH_PLACEHOLDER}

Verify search results UI
    [Documentation]  Verify search results UI
    page should contain element  ${FILTERS}
    page should contain element  ${LOCATION}
    page should contain element  ${VOICE_BUTTON}
    page should contain element  ${SCAN_BUTTON}
    page should contain element  ${BACK_BUTTON}
    page should contain element  ${BOTTOM_NAV}

Verify search without entering input
    [Documentation]  Verify search without entering input
    click element  ${SEARCH_BAR}
    press keycode  66
    page should contain element  ${VOICE_BUTTON}
    page should contain element  ${SCAN_BUTTON}
    page should contain element  ${AMAZON_SEARCH_PLACEHOLDER}

Click on first result
    [Documentation]  Click on first search result
    wait until page contains element  ${IMAGE_PRODUCT}
    click element  ${IMAGE_PRODUCT}

Add product to cart
    [Documentation]  Add product to cart
    scroll down  ${ADD_TO_CART}
    click element  ${ADD_TO_CART}

Click cart icon
    [Documentation]  Click cart icon
    click element  ${CART_ICON}

Verify empty cart UI
    [Documentation]  Verify empty cart UI
    page should contain element  ${EMPTY_CART_PLACEHOLDER}
    page should contain element  ${YOUR_AMAZON_CART_IS_EMPTY}
    page should contain element  ${GOOD_STUFF_GOES_IN_HERE}
    page should contain element  ${SHOP_TODAYS_DEALS}
    page should contain element  ${SIGN_IN_EMPTY_CART}
    page should contain element  ${SIGN_UP_NOW}
    page should contain element  ${CONTINUE_SHOPPING}

Verify cart UI with items
    [Documentation]  Verify cart UI with items
    page should contain element  ${SHOPPING_CART}
    page should contain element  ${SUBTOTAL}
    page should contain element  ${PROCEED_TO_BUY}
    page should contain element  ${ITEM_TITLE_CART}
    page should contain element  ${ITEM_COUNT_DECREMENT}
    page should contain element  ${ITEM_COUNT_INCREMENT}
    page should contain element  ${ITEM_COUNT}

Verify added item is present in cart
    [Documentation]  Verify added item is present in cart
    page should contain element  ${ITEM_TITLE_CART}
    ${displayed_item}  get element attribute  ${ITEM_COUNT}  text
    should be equal  ${displayed_item}  ${SEARCH_TEXT}


Verify count increment in cart
    [Documentation]  Verify multiple count increment
    [Arguments]  ${count}  ${number_of_increments}
    FOR    ${i}    IN    @{number_of_increments}
        click element  ${ITEM_COUNT_INCREMENT}
    END
     ${displayed_count}  get element attribute  ${ITEM_COUNT}  text
     ${actual_count}=    Evaluate    int(${count})+int(${number_of_increments})
    should be equal  ${displayed_count}  ${actual_count}

Verify count decrement to zero
    [Documentation]  Verify count decrement to zero
    [Arguments]  ${count}
    ${item}    Set Variable    ${0}
    WHILE    ${x} != 0
        click element  ${ITEM_COUNT_DECREMENT}
        ${x}=    Evaluate    ${x} - 1
    END
    page should not contain element  ${ITEM_TITLE_CART}
    page should contain element  ${EMPTY_CART_PLACEHOLDER}
    page should contain element  ${YOUR_AMAZON_CART_IS_EMPTY}
    page should contain element  ${GOOD_STUFF_GOES_IN_HERE}


