*** Settings ***
Resource   ${CURDIR}/support/support.robot


*** Test Cases ***
Login in to account
  ${passed}=        Login _Functionality
  Sleep  10s
Click Start New Form
  ${passed}=        Select_Form
Fill Form 1099MISC
  ${passed}=      Select_Form_1099MISC
Payment for Form 1099MISC
  ${passed}=      Payment

 
