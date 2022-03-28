*Settings*
Documentation           Search For Iphones test suit

Resource        ${EXECDIR}/Base.robot

Test Setup          Start Session
Test Teardown       After Test

*Test Cases*
Searching for Iphone
    Given I open the browser and Go To Google Page
    When I search for "Amazon Brasil" and Press Enter
    Then I Could Search For Iphone

Count items and calculete Percentage
    Given I open the browser and Go To Google Page  
    And I search for "Amazon Brasil" and Press Enter
    And I Could Search For Iphone
    ${iphone}=  When I Count Items Started with Iphone
    ${total}=   And Count Result Items
    Then the Percentage Should Be At Least  ${total}    ${iphone}   30

Value Can Not Be Greater Than U$2000
    Given I open the browser and Go To Google Page  
    And I search for "Amazon Brasil" and Press Enter
    And I Could Search For Iphone
    ${Highest_Price}    When I Get the Highset price       
    ${USD_Value}        And Get usd Price       ${Highest_Price}
    Then It Should Not Be Greater Than      ${USD_Value}    2000 

Search For a Different and Cheaper Product 

    Given I open the browser and Go To Google Page  
    And I search for "Amazon Brasil" and Press Enter
    And I Could Search For Iphone
    When I find another items that do not start with "Iphone"
    ${product}          Then I can identify the lowest price
    ${USD_Product}      And Get Price         ${product}
    And I Can Verify if the value is cheaper than a "IPhone"
