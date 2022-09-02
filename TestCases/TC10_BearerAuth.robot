*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***

${base_url}    https://certtransaction.elementexpress.com/
${bearerToken}    "Bearer E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"

*** Test Cases ***

Test_Case

    create session    mysession    ${base_url}
    ${headers}=    create dictionary    Authorization=${bearer_token}    Content-Type=text/xml
    ${data}=    get file    D:/Robot/TestCases/XMLDATA.xml

    ${response}=    post request    mysession    /    data=${data}    headers=${headers}

    log to console    ${response.status_code}