*Settings*
Documentation       Search actions

*Keywords*

I open the browser and Go To Google Page
    Go To                       ${BASE_URL}
    Wait For Elements State     css=input[name=q]           visible     5

I search for "Amazon Brasil" and Press Enter
    Fill Text                   css=input[name=q]           Amazon Brasil 
    Keyboard Key                press                                               Enter
    Wait For Elements State     css=#pTwnEc                                         visible     5
    Click                       css=a[href="https://www.amazon.com.br/"] >> text=Amazon.com.br | Tudo pra você, de A a Z.

I Could Search For Iphone
    Wait For Elements State     css=#nav-logo-sprites                               visible     5 
    Fill Text                   css=#twotabsearchtextbox                            Iphone
    Keyboard Key                press                                               Enter
    Wait For Elements State     xpath=//span[contains(text(),'RESULTADOS')]         visible     5


I Count Items Started with ${word}
    Wait For Elements State     xpath=//*[starts-with(@data-cel-widget,"MAIN-SEARCH_RESULTS-10")]//h2           visible     5
    ${Count}=         Get Element Count           xpath=//*[starts-with(@data-cel-widget,"MAIN-SEARCH_RESULTS")]//h2//span[starts-with(text(),'${word}')]
    [return]     ${Count}      

And Count Result Items
    Wait For Elements State     css=[data-cel-widget^=MAIN-SEARCH_RESULTS-10] h2          visible     5
    ${Count}=         Get Element Count           css=[data-cel-widget^=MAIN-SEARCH_RESULTS] h2
    [return]     ${Count}  

I Get the Highset price
    @{elements}=           Get Elements        xpath=//*[starts-with(@data-cel-widget,"MAIN-SEARCH_RESULTS")]//span[@class='a-offscreen'] 

    @{prices}=             Create List

    FOR     ${element}        IN      @{elements}
   
        ${text}=     Get Property    ${element}    innerText   
        Append To List      ${prices}       ${text}

    END
 
    ${highest}=       Get Highest Value          ${prices}
    [Return]    ${highest}

And Get usd Price
    [Arguments]     ${brl}
  
    ${usd}=                  GET Exchange Rates
    ${converted_value}=      Get Usd Value           ${usd}       ${brl}

    [Return]     ${converted_value}

I find another items that do not start with "Iphone"

    Wait For Elements State     xpath=//*[starts-with(@data-cel-widget,"MAIN-SEARCH_RESULTS-10")]//h2           visible     5
    ${Other_Item}     Get Element State          xpath=//span[contains(text(),'Adaptador iPhone Aux P2 / Lightning Fone Ouvido Qu')]
    
I can identify the lowest price

    ${c_elements}     Get Elements          xpath=//*[starts-with(@data-cel-widget,"MAIN-SEARCH_RESULTS-48")]//span[@class='a-offscreen']

    
    @{c_prices}=             Create List

    FOR     ${c_element}        IN      @{c_elements}
   
         ${c_text}=     Get Property    ${c_element}    innerText   
         Append To List      ${c_prices}       ${c_text}

    END
      
    ${product}=         Get Highest Value           ${c_prices}
     
    [Return]            ${product}

And Get Price
    [Arguments]     ${brl}
  
    ${usd}=                  GET Exchange Rates
    ${converted_value}=      Get Usd Value           ${usd}       ${brl}

    [Return]     ${converted_value}

I Can Verify if the value is cheaper than a "IPhone"

    Given I open the browser and Go To Google Page  
    And I search for "Amazon Brasil" and Press Enter
    And I Could Search For Iphone
    ${Highest_Price}    When I Get the Highset price       
    ${USD_Value}        And Get usd Price       ${Highest_Price}
    When I find another items that do not start with "Iphone"
    ${product}          Then I can identify the lowest price
    ${USD_Product}      And Get Price         ${product}
    I can compare       ${Highest_Price}         ${USD_Product}







