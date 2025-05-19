*** Settings ***
Documentation    To validate the Login  form
Library    SeleniumLibrary
Library    DataDriver    file=../TestData/LoginExcel.xlsx    sheet_name=Sheet1
Test Template    Validate unsuccessful Login

*** Variables ***
${browser}    chrome
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${login_error_message}    css:.oxd-alert-content--error
# ${login_btn}    xpath=//button[@type='submit']
${Username}
${Password}

*** Test Cases ***
Login to form using EXCEL Data    ${Username}    ${Password}

*** Keywords ***
Validate unsuccessful Login
    [Arguments]    ${Username}    ${Password}
    Open the Browser with the URL
    Fill the login form    ${Username}    ${Password}
    Verify the error message is correct
    Close Browser session

Open the Browser with the URL
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Fill the login form
    [Arguments]    ${Username}    ${Password}
    Input Text    name=username    ${Username}
    Input Password    name=password    ${Password}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    ${login_error_message}    timeout=10

Verify the error message is correct
    Element Text Should Be    ${login_error_message}    Invalid credentials

Close Browser session
    Close Browser
