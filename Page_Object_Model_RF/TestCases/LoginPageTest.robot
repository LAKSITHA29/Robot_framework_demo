*** Settings ***
Library    SeleniumLibrary
Test Setup    Open the Browser with the URL
Test Teardown    Close Browser Session
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/DashboardResources.robot

*** Test Cases ***
Validate Unsuccessful login using valid credentials
   LoginResources.Fill the login form    ${valid_uname}    ${invalid_pass}
   LoginResources.Verify the error msg is correct

Validate Unsuccessful login for blank username
   LoginResources.Fill the login form    ${blank_name}    ${valid_pass}
   LoginResources.Verify the error msg is displayed for password

Validate Unsuccessful login for blank password
   LoginResources.Fill the login form    ${valid_uname}    ${blank_pass}
   LoginResources.Verify the error msg is displayed for password

Validate successful login
   LoginResources.Fill the login form    ${valid_uname}    ${valid_pass}
   DashboardResources.verify Dashboard page opens