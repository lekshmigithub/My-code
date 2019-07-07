*** Settings ***
Documentation     Checking arithmetic operations of a online calculator
Library           /Users/m122-hb/Documents/onlinecalculator/Funtion.py
Library            SeleniumLibrary


*** Variables ***

${URL}                https://www.online-calculator.com/full-screen-calculator/
${BROWSER}            Chrome
${XPATH_MAIN_CANVAS}  xpath://*[@id="canvas"]    #Locator of the Main canvas


*** Keywords ***

Open chrome browser and start application

    Set Selenium Speed  0.1 seconds
    Open browser    ${URL}   ${BROWSER}
    Set Window Size   800  800

I enter following values and press CE button

    Select Frame   css:#fullframe                                              #Selecting the full frame

Verify subtraction of ${operand1} and ${operand2} is ${result}
    [Documentation]         Verify subtraction of two integers
    ${calculated_result}=  calculate  ${operand1}  ${operand2}  -
    Should Be Equal as Integers  ${calculated_result}  ${result}

    ${2}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     120    #digit 2
    ${5}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     60     #digit 5
    ${-}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     90     120    #Subtraction Symbol
    ${5}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     60     #digit 5
    ${=}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     150    180    #Equals symbol
           Capture Element Screenshot    ${XPATH_MAIN_CANVAS}


Verify division of ${operand1} and ${operand2} is ${result}
    [Documentation]          Verify division of two integers
    ${calculated_result}=  calculate  ${operand1}  ${operand2}  /
    Should Be Equal as Integers  ${calculated_result}  ${result}

    ${2}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     120    #digit 2
    ${5}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     60     #digit 5
    ${/}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     60     -30    #Division Symbol
    ${5}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     60     #digit 5
    ${=}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     150    180    #Equals symbol
           Capture Element Screenshot    ${XPATH_MAIN_CANVAS}

T1:Subtracting two integers
        Verify subtraction of ${25} and ${5} is ${20}

T2:Dividing two integers
        Verify division of ${25} and ${5} is ${5}

T3:Press CE button

    ${CE_Button}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}   150  -120     #CE Symbol
                   Capture Element Screenshot    ${XPATH_MAIN_CANVAS}

T4:Check the Error case

  [Documentation]       Checking negative test case where the claculator press subtract and divide then should print Error

    ${-}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     90     120    #Subtraction Symbol
    ${/}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     60     -30    #Division Symbol
    ${=}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     150    180    #Equals symbol
           Capture Element Screenshot    ${XPATH_MAIN_CANVAS}

T5:Check the Bountry Test Scenario

  [Documentation]       Checking the Bountry Value Scenarios
  ...                 Scenario 1: Subtraction from a Greater integer to smaller integer

        Verify subtraction of ${25} and ${15} is ${10}

    ${2}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     120    #digit 2
    ${5}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     60     #digit 5
    ${-}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     90     120    #Subtraction Symbol
    ${1}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -150    120    #digit 1
    ${5}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     60     #digit 5
    ${=}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     150    180    #Equals symbol
           Capture Element Screenshot    ${XPATH_MAIN_CANVAS}



           log          Scenario 2:Subtraction from a Smaller integer to Greater integer

         Verify subtraction of ${15} and ${25} is ${-10}

    ${1}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -150    120    #digit 1
    ${5}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     60     #digit 5
    ${-}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     90     120    #Subtraction Symbol
    ${2}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     120    #digit 2
    ${5}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     60     #digit 5
    ${=}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     150    180    #Equals symbol
           Capture Element Screenshot    ${XPATH_MAIN_CANVAS}


          log            Scenario 3:Subtraction of same integers

         Verify subtraction of ${15} and ${15} is ${0}

    ${1}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -150    120    #digit 1
    ${5}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     60     #digit 5
    ${-}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     90     120    #Subtraction Symbol
    ${1}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -150    120    #digit 1
    ${5}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}    -90     60     #digit 5
    ${=}=  Click Element At Coordinates  ${XPATH_MAIN_CANVAS}     150    180    #Equals symbol
           Capture Element Screenshot    ${XPATH_MAIN_CANVAS}


Close the Execution

   T3:Press CE button
        [Teardown]    Close Browser
        log   "Test Case Executed Succesfully"




*** Test Cases ***
# Test Cases are written in Gherkin Langauge

Given  Open chrome browser and start application
When   I enter following values and press CE button
And    T1:Subtracting two integers
And    T2:Dividing two integers
And    T3:Press CE button
And    T4:Check the Error case
And    T5:Check the Bountry Test Scenario
Then   Close the Execution








