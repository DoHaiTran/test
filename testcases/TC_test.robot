***Settings***
Resource        ../resources/imports_resources.robot
Resource        ../keywords/common/common_keywords.robot

*** Variables ***
${var1}     32

*** Keywords ***
Convert temperature Fahrenheit To Centigrade
  [Arguments]  ${ftemp}
  ${ftemp} =  Convert To Number     ${ftemp}
  ${ctemp} =  evaluate  (5 * (${ftemp} - 32))/9
  [Return]  ${ctemp}


*** Test Cases ***
# Verify Temperature Conversion F to C
#   ${result} =  Convert temperature Fahrenheit To Centigrade  ${var1}
#   Log  ${result}
#   Should Be Equal As Numbers    ${result}   0.0

Test string
  ${a}=   String.Get Substring        ĐVT 1 = 1.000 vnđ   8   13
  ${c}=   String.Remove String  ${a}  .

  BuiltIn.Convert To Number   ${c}
  ${b} =   evaluate   5*${c}
  Log to console  ${a}   
  Log to console  ${b}
  Log to console  ${c}