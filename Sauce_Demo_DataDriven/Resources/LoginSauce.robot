*** Settings ***
Documentation    To validate the Login form of sauce DEMO
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/SauceDemo.xlsx    sheet_name=Sheet1
Test Template    Validate different login in saucedemo

*** Variables ***
${browser}    chrome
${url}    https://www.saucedemo.com/
${success_login_msg}    //span[@class="title"]
${login_error_msg}    xpath=//h3[@data-test="error"]
${login_btn}    id=login-button
${Username}
${Password}

*** Test Cases ***
Login to sauce demo using EXCEL Data    ${Username}    ${Password}

*** Keywords ***
 Validate different login in saucedemo
    [Arguments]    ${Username}    ${Password}
    Open the Browser with the URL
    Fill the login form    ${Username}    ${Password}
    IF    '${Username}'=='locked_out_user'                              
        Verify error message
    ELSE
        Verify the successful login
        END
    Close Browser session

Open the Browser with the URL
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Fill the login form
    [Arguments]    ${Username}    ${Password}
    Input Text    id=user-name    ${Username}
    Input Password    id=password   ${Password}
    Click Button    ${login_btn}
    Sleep    5
    # Wait Until Element Is Visible    ${success_login_msg}        timeout=10

Verify error message
    Element Text Should Be    ${login_error_msg}    Epic sadface: Sorry, this user has been locked out.

Verify the successful login
    Element Text Should Be    ${success_login_msg}    Products

Close Browser session
    Close Browser
