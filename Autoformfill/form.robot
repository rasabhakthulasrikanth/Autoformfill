*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     String

*** Variables ***
*** Test Cases ***
get csv
    read csv file
*** Keywords ***
read csv file
    ${csv}      Get File     readcsv.csv
    @{read}     Create List     ${csv}
    @{lines}    Split To Lines      @{read}
    FOR    ${line}    IN    @{lines}
        @{split}    Split String    ${line}  |
        ${first}    Set Variable    ${split}[0]
        ${second}   Set Variable    ${split}[1]
        ${third}    Set Variable    ${split}[2]
        ${fourth}   Set Variable    ${split}[3]
        ${fifth}    Set Variable    ${split}[4]
        ${sixth}    Set Variable    ${split}[5]
        ${seven}    Set Variable    ${split}[6]
        ${eight}    Set Variable    ${split}[7]
        ${ninth}    Set Variable    ${split}[8]
        ${tenth}    Set Variable    ${split}[9]
        ${eleven}   Set Variable    ${split}[10]
        ${twelve}   Set Variable    ${split}[11]
        launch browser     ${first}           ${second}     ${third}    ${fourth}   ${fifth}    ${sixth}    ${seven}    ${eight}    ${ninth}    ${tenth}  ${eleven}   ${twelve}
    END
launch browser
        [Arguments]     ${first}        ${second}    ${third}   ${fourth}   ${fifth}    ${sixth}    ${seven}    ${eight}    ${ninth}    ${tenth}    ${eleven}   ${twelve}
        Open Browser    ${first}        chrome
        Maximize Browser Window
        #Set Selenium Speed   1
        Input Text       name:firstname    ${second}
        Input Text       name:lastname    ${third}
        Input Text       name:email       ${fourth}
        Input Text       id:date          ${fifth}
        Select Radio Button   radiooptions     ${sixth}
        Select Checkbox       id:vehicle1
        Select Checkbox       id:vehicle2
        Input Text            id:address        ${seven}
        Select From List By Label   id:country-state  ${eight}
        Select From List By Value    id:country      ${ninth}
        Input Text          name:subject    ${tenth}
        Input Password         name:password    ${eleven}
        Input Password         name:re-enter password    ${twelve}
        Click Button        xpath://*[@id="registrationForm"]/div[13]/input
        Close Browser