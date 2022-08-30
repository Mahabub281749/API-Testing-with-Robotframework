# API-Testing-with-Robotframework

Pre-requisite:
  1. Python
  2. Pycharnm
  3. Libraries
  
Install Libraries by inserting following commands in CMD<br/><br/>

1. Robot Framework:<br/>
        pip install robotframework<br/><br/>

2. Requests:<br/>
        pip install requests<br/><br/>

3. Robot Framework Requests:<br/>
        pip install robotframework-requests<br/><br/>

4. Robot Framework JSON Library:<br/>
        pip install robotframework-jsonlibrary <br/><br/><br/>

Run below commnad in CMD to run the robot file:<br/><br/>
        py -m robot <foldde name>\<Test name.robot>

#### Test Case 1: GET Request ####
URL: https://restcountries.com

Validations

    1) Status Code
    2) Response Body
    3) Header

#### Test Case 2: POST Request ####
URL: https://dummy.restapiexample.com/

Validations

    1) Status Code
    2) Response Body

#### Test Case 3: Games ####
        1) Pre-Requisite: Install Gradle on Windows
        2) Graddle Download link:  https://gradle.org/releases/
        3) VideoGameDB API Download Link: https://github.com/james-willett/Vide...
        4) How to run application using graddle?
        E:\VideoGameDB-master\gradlew bootRun
        5)  URL:  http://localhost:8080/swagger-ui/index.html

#### Test Case 4: JSON File Validation ####

        1. Validate Data in JSON File

Helping URL: 

        1. https://jsonpathfinder.com/
        2. http://jsonpath.com

#### Test Case 5: Complex JSON Data Validation ####

        1. Validate Complex Data in JSON Response

Helping URL:         

        1. https://jsonpathfinder.com/
        2. http://jsonpath.com

Base URL:

        1. https://restcountries.com/v2/name/bangladesh