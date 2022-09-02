*** Settings ***

Library    RequestsLibrary
Library    Collections

*** Variables ***

${base_url}    https://postman-echo.com

*** Test Cases ***

Basic_Auth

    ${auth}=    create list    postman    password
    create session    mysession    ${base_url}    auth=${auth}

    ${response}=    get request    mysession    /basic-auth

    log to console    ${response.status_code}
    log to console    ${response.content}