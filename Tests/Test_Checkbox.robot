*** Settings ***
Documentation    To validate the checkbox in DemoSite
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Test Cases ***

Checkbox feature 
  Open the Browser with the URL  
  Verify the page contains checkbox
  Select checkbox cricket and Hockey
  Unselect Hockey
  Verify cricket checkbox is selected
  Verify Hockey checkbox is not selected

*** Keywords ***

Open the Browser with the URL
  Open Browser    browser=chrome
  Go To    https://demo.automationtesting.in/Register.html
  Maximize Browser Window
  Set Selenium Implicit Wait    5

Verify the page contains checkbox
  Page Should Contain Checkbox    //input[@type="checkbox"]
  Page Should Not Contain Checkbox    radiooptions

Select checkbox cricket and Hockey
  Select Checkbox    checkbox1
  Select Checkbox    checkbox3

Unselect Hockey
  Unselect Checkbox     checkbox3
  
Verify cricket checkbox is selected
  Checkbox Should Be Selected    checkbox1

Verify Hockey checkbox is not selected
  Checkbox Should Not Be Selected    checkbox3
