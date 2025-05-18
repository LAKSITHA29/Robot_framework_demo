*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***

Search in google
    Open Browser    https://www.google.com/    chrome           
    Input text      //textarea[@class="gLFyf"]                    Selenium
    # Click Button    class:gNO89b
    Press Keys      name:q    ENTER
    Page Should Contain             https://www.selenium.dev/
    Page Should Contain Textfield   class:gLFyf   
    Close Browser

*** Test Cases ***

Search in google with anotherkey
    Open Browser    https://www.google.com/    chrome           
    Input text      //textarea[@class="gLFyf"]                     robotframework
    # Click Button    class:gNO89b
    Press Keys      name:q    ENTER
    Page Should Contain  https://robotframework.org/
    Page Should Contain Textfield   class:gLFyf   
    Close Browser

