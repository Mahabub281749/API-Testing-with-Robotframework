# API-Testing-with-Robotframework

Pre-requisite:
  1. Python
  2. Libraries
  
Install Libraries by inserting following commands in CMD<br/><br/>

1. Robot Framework:<br/>
        pip install robotframework<br/><br/>

2. Requests:<br/>
        pip install requests<br/><br/>

3. Robot Framework Requests:<br/>
        pip install robotframework-requests<br/><br/>

4. Robot Framework JSON Library:
        pip install robotframework-jsonlibrary <br/><br/><br/>

Run below commnad in CMD to run the robot file:<br/>
        robot <foldde name>\<Test name.robot>

### Test Case 1: GET Request ###
URL: https://restcountries.com

Validations
    1) Status Code
    2) Response Body
    3) Header

### Test Case 2: POST Request ###
URL: https://dummy.restapiexample.com/

Validations

    1) Status Code
    2) Response Body