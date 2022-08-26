*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    https://restcountries.com
${country}    Bangladesh

*** Test Cases ***
Get_weatherinfo
    Create Session    mysession    ${base_url}
    ${response}=    GET On Session    mysession    /v2/name/${country}
    #log To Console    ${response.status_code}
    #log to console    ${response.content}  
    #log To Console    ${response.headers}  
    
    #validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}   200

    ${ContentValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${ContentValue}    application/json

    ${body}=    Convert To String    ${response.content} 
    Should Contain    ${body}   Dhaka
