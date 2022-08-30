*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    http://localhost:8080

*** Test Cases ***
TC1: Returns all the video games (GET)
    Create Session    mysession    ${base_url}
    ${response}=    get request    mysession    /app/videogames

    log To Console    ${response.status_code}
    log to console    ${response.content}

    #validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}   200

TC2: Add a new video game (POST)
    Create Session    mysession    ${base_url}

    ${body}=    Create Dictionary    id=100     name=Spider-Man     releaseDate=2019-09-20      reviewScore=5       category=Adventure      rating=Universal
    ${header}=    Create Dictionary    Content-Type=application/json

    ${response}=    post request    mysession    /app/videogames   data=${body}    headers=${header}

    Log To Console    {response.status_code}
    Log To Console    {response.content}

    # validation #

    ${status_code}=    Convert To String    {response.status_code}
    Should Be Equal    ${status_code}    200

    ${res_body}=    Convert To String    {response.content}
    Should Contain    ${res_body}    Record Added Successfully

TC3: Returns the details of a single game by ID (GET)
    Create Session    mysession    ${base_url}

    ${response}=    get request    mysession    /app/videogames/100

    log To Console    ${response.status_code}
    log to console    ${response.content}

    #validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}   200

    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}   Spider-Man

TC4: Updating an existing video game by specifying a new body (PUT)
    Create Session    mysession    ${base_url}

    ${body}=    Create Dictionary    id=100     name=BAT-Man     releaseDate=2019-09-20      reviewScore=5       category=Adventure      rating=Universal
    ${header}=    Create Dictionary    Content-Type=application/json

    ${response}=    put request    mysession    /app/videogames/100   data=${body}    headers=${header}

    Log To Console    {response.status_code}
    Log To Console    {response.content}

    # validation #

    ${status_code}=    Convert To String    {response.status_code}
    Should Be Equal    ${status_code}    200

    ${res_body}=    Convert To String    {response.content}
    Should Contain    ${res_body}    BAT-Man

TC5: Delete a video game by ID (DELETE)
    Create Session    mysession    ${base_url}
    ${response}=    delete request    mysession    /app/videogames/100

    # validation #

    ${status_code}=    Convert To String    {response.status_code}
    Should Be Equal    ${status_code}    200

    ${res_body}=    Convert To String    {response.content}
    Should Contain    ${res_body}    Record Deleted Successfully