*** Settings ***
Documentation    Tests to login to Login page
Library    SeleniumLibrary
Resource    resources.robot

*** Variables ***
${Login_Error_message}    xpath://p[@class="oxd-text oxd-text--p oxd-alert-content-text"] 
# ...    css:oxd-text oxd-text--p oxd-alert-content-text    
${Dashboard_text}    xpath://h6[text()="Dashboard"]

*** Test Cases ***

Validate unsuccessful Login
    [Tags]  Smoke Regression
    Open the Browser with the URL
    Fill the login form    ${invalid_username}    ${invalid_password}
    Verify error meassage is correct
    Close Browser Session

Validate successful Login
    [Tags]  Smoke Regression
    Open the Browser with the URL
    Fill the login form    ${valid_username}    ${valid_password}
    Click Element    //button
    Verify Dashboardpage opens
    Close Browser Session

*** Keywords ***
Fill the Login form
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name=username]    ${username} 
    Input Text    css:input[name=password]    ${password}   
    Click Button    css:.orangehrm-login-button 

Verify error meassage is correct
    Element Text Should Be    ${Login_Error_message}    Invalid credentials

Verify Dashboardpage opens
    # Element Text Should Be    ${Dashboard_text}    Dashboard
    Wait Until Element Is Visible    ${Dashboard_text}    timeout=10s
    Element Text Should Be           ${Dashboard_text}    Dashboard
