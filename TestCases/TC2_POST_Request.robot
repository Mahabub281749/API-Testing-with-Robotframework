*** Settings ***

Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    http://dummy.restapiexample.com/api

*** Test Cases ***
Put_CustomerInfo

    Create Session    mysession    ${base_url}
    
    ${body}=    Create Dictionary    name=test    salary=123    age=23
    ${header}=    Create Dictionary    Content-Type=application/json

    ${response}=    POST On Session    mysession    /v1/create   data=${body}    headers=${header}


    Log To Console    {response.status_code}
    Log To Console    {response.content}

    # validation #

    ${status_code}=    Convert To String    {response.status_code}
    Should Be Equal    ${status_code}    201

    ${res_body}=    Convert To String    {response.content}
    Should Contain    ${res_body}    leader  