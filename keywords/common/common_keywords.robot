***Settings***
Resource    ../../resources/imports_resources.robot
Resource    ../pages/locator/btmc.robot

***Variables***
${TIMEOUT}      60
&{url}=      btmc=https://btmc.vn/      gp=https://goldprice.org/

***Keywords***

Open Web Page
    [Arguments]     ${url}
    Open Browser    ${url}      ff    
    Set Selenium Speed  0.2
    Maximize Browser Window
    # Click Element   ${dictBTMC.adCloseButton}
   
Close Web Page
    Close Browser    

Verify Element Is Visible
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Page Contains Element       ${locator}       timeout=${TIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible           ${locator}      timeout=${TIMEOUT}

Verify Element Is Not Visible
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Page Does Not Contain Element       ${locator}       timeout=${TIMEOUT}
    SeleniumLibrary.Wait Until Element Is Not Visible           ${locator}      timeout=${TIMEOUT}

Click Element
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Element Is Visible           ${locator}      timeout=${TIMEOUT}
    SeleniumLibrary.Click Element     ${locator}  
