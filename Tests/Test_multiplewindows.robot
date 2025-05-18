*** Settings ***
Library    SeleniumLibrary


*** Test Cases ***
Handling multiple windows
    open the browser with url
    Select the button to switch to child window
    verify the child window is opened
    verify the user is switched to parent window
    verify the user is switched back to child window


*** Keywords ***
open the browser with url
    Open Browser    https://demo.automationtesting.in/Windows.html    browser=edge
    Maximize Browser Window
    Set Browser Implicit Wait    5
    Sleep    5s

Select the button to switch to child window
    ${ParentWindow} =    Get Window Handles
    Click Element    xpath=//div[@class='tabpane pullleft']/ul/li[2]/a
    Click Element    css:.btn-primary
    ${Windows} =    Get Window Handles
    ${count} =       Get Length    ${Windows}
    Log To Console   ${count}
    FOR    ${windows}    IN    ${Windows}
        Log To Console   ${windows}
    END
    sleep    5s

verify the child window is opened
    Switch Window    NEW
    Page Should Contain    Selenium automates browsers
    ${title}    Get Title
    Log To Console    ${title}
    Sleep    5s

verify the user is switched to parent window
    Switch Window    MAIN
    Element Should Contain    xpath=//div[@class="col-sm-8 col-xs-8 col-md-8"]    Automation Demo Site
    Sleep    5s

verify the user is switched back to child window
    Switch Window    title=Selenium
    Sleep    5s