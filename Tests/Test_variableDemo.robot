*** Settings ***
Documentation  To validate the login form using valid credentials 
Library    SeleniumLibrary
Library    Collections
Test Teardown    Close Browser 

*** Variables ***
${valid_username}    Admin   
${valid_password}    admin123
${url}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
# &{VisibleElement}    css

*** Test Cases ***

Validate elements on the login page
    Open the Browser with URL
    Verify elements on login page
    # Close Browser 

Check successful Login
    Open the Browser with URL
    Fill the Login form
    Verify Dashboard page displayed
    Verify items in Dashboard Page
    Close Browser

*** Keywords ***
Open the Browser with URL
   Open Browser     browser=chrome
   Go To            url=https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
   Maximize Browser Window
   Set Selenium Implicit Wait  5

Verify elements on login page
   Page Should Contain  Forgot your password? 

Fill the Login form
   Input Text  username  ${valid_username} 
   Input Text  password  ${valid_password} 
#    Set Selenium Page Load Timeout     value=5
   Click Button  xpath=//button[text()=" Login "]

Verify Dashboard page displayed
   Page Should Contain    Dashboard

Verify items in Dashboard Page
   @{Expected}=     Create List     Admin     PIM    Leave    Time    Recruitment    My Info    Performance    Dashboard    Directory    Maintenance    Claim     Buzz 
   ${actual_elem}=       Get WebElements  css:.oxd-main-menu-item
   @{actual_list}=    Create List
   FOR    ${e}    IN     @{actual_elem}
      Log    ${e.text}
      Append To List    ${actual_list}    ${e.text}
   END
   Lists Should Be Equal    ${actual_list}    ${Expected}
