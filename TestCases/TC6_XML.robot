*** Settings ***

Library    XML
Library    os
Library    Collections

*** Test Cases ***

TestCase 1

    ${xml_obj}=    parse xml    D:/Robot/TestCases/XMLDATA.xml

    # Validation

    # Val1: Check the single element value

    #Approach 1
    
    ${author}=    get element text    ${xml_obj}    .//book[1]/author
    should be Equal    ${author}    Gambardella, Matthew   

    # Approach 2

    ${author}=    get element    ${xml_obj}    .//book[1]/author
    should be Equal    ${author.text}    Gambardella, Matthew 

    # Approach 3

    element text should be    ${xml_obj}    Gambardella, Matthew     .//book[1]/author

    # Val2: Check number of elements

    ${element_count}=    get element count    ${xml_obj}    .//book
    should be Equal as integers    ${element_count}    12

    # Val3: Check attribute presence

    element attribute should be    ${xml_obj}    id    bk101    .//book[1] 
    element attribute should be    ${xml_obj}    id    bk106    .//book[6] 

    # Val4: Check value of child elements

    ${child_element}=    get child elements    ${xml_obj}    .//book[1]  
    should not be empty    ${child_element} 

    ${author}=    get element text    ${child_element[0]}
    ${title}=    get element text    ${child_element[1]}
    ${genre}=    get element text    ${child_element[2]}

    log to console    ${author}
    log to console    ${title}
    log to console    ${genre}

    should be Equal    ${author}    Gambardella, Matthew    
    should be Equal    ${title}    XML Developer's Guide 
    should be Equal    ${genre}    Computer 
        



       