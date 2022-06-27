***Settings***
Resource    ../../resources/imports_resources.robot
Resource    ./locator/btmc.robot

***Keywords***
Get price of 1/10 ounce
    [Arguments]     ${type}
    @{list_type}     Get WebElements     ${dictBTMC.typeOfGoldList}
    # Log      List type element: ${list_type}
    ${type_of_gold}       Create List
    FOR     ${locator}     IN      @{list_type}
        ${name}     Get Text        ${locator}
        Append To List      ${type_of_gold}       ${name}
    END
    # Log      Type of gold: ${type_of_gold}

    ${index}        Get Index From List  ${type_of_gold}  ${type}
    IF  ${index} > -1
        ${row_index}    Evaluate    2+${index}
        ${price}     Get Table Cell      ${dictBTMC.priceTable}    ${row_index}   5
        Log     Price of ${type}: ${price}
    ELSE 
        Log     There is no ${type} in gold list
    END