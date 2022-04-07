*** Settings ***
Resource   ${CURDIR}/support/support.robot


*** Test Cases ***
Login in to account
  ${passed}=        Login _Functionality
  Sleep  10s
Click Form 1099-NEC
  ${passed}=        Select_Form

 
