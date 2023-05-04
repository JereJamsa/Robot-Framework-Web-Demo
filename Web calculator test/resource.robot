*** Settings ***
Documentation    Variables and Keyword for testing simple web calculator


Library    SeleniumLibrary

*** Variables ***
${URL}            http://127.0.0.1:5000/
${BROWSER}        Chrome
${DELAY}          0.1



*** Keywords ***
Open Browser To Calculator Page
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Calculator Should Be Running And Open

Calculator Should Be Running And Open
    Title Should Be    Calculator    
    

Calculation
    [Arguments]     @{*args}
    FOR    ${element}    IN    @{*args}
        Click Button    ${element}
        
    END
    Click Button    equals

Check Result
    [Arguments]    ${result}
    ${expr} =    Get Text    xpath=//*[@id="result"]
    Should Be Equal    ${expr}    ${result}
    Clear

Clear
    Click Button    C
    ${expression}    Get Value    xpath=//*[@id="expression"]
    Should Be Empty    ${expression}


