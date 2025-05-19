*** Settings ***
Documentation    All the Page objects and keywords of logging page
Library    SeleniumLibrary

*** Variables ***
${login_error_msg}    xpath://p[@class="oxd-text oxd-text--p oxd-alert-content-text"]
${required_uname_msg}     xpath=(//div[@class='oxd-input-group oxd-input-field-bottom-space'])[1]/span 
${required_pass_msg}     xpath=(//div[@class='oxd-input-group oxd-input-field-bottom-space'])[2]/span
${dashboard_title}    xpath://span[@class="oxd-topbar-header-breadcrumb"]
${Forgot_pass_link}    xpath://p[@class="oxd-text oxd-text--p orangehrm-login-forgot-header"]

*** Keywords ***

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name=username]      ${username}
    Input Password    css:input[name=password]    ${password}
    sleep    5
    Click Button    css:.orangehrm-login-button

Verify the error msg is correct
    Element Text Should Be    ${login_error_msg}    Invalid credentials

Verify the error msg is displayed for username
    Element Text Should Be    ${required_uname_msg}      Required

Verify the error msg is displayed for password
    Sleep    5
    Element Text Should Be     ${required_pass_msg}    Required       

Go to Forgot your Password Page
    Click Element    ${Forgot_pass_link}     