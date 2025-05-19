*** Settings ***
Library    SeleniumLibrary
Test Setup    Open the Browser with the URL
Test Teardown    Close Browser Session
Resource    ../Resources/LoginResources.robot
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/ForgetPasswordResources.robot

*** Test Cases ***
Validate Reset password functionality
    LoginResources.Go to Forgot your Password Page
    ForgetPasswordResources.Verify Forgot Your Password Page Opens
    ForgetPasswordResources.Fill the Forgot Password Page
    ForgetPasswordResources.Verify the message

Validate Cancel functionality
    LoginResources.Go to Forgot your Password Page
    ForgetPasswordResources.Verify Forgot Your Password Page Opens
    ForgetPasswordResources.Cancel the Reset Password
    ForgetPasswordResources.Verify that Login Page is displayed