*** Settings ***
Resource   ${CURDIR}/support/support.robot


*** Test Cases ***
Login in to account
  ${passed}=        Login _Functionality
  Sleep  100s
Click Form 1099-NEC
  ${passed}=        Select_Form
  Sleep  10s
Fill Form 1099-NEC
  ${passed}=        FillForm_1099Nec
  sleep 10s
Review and Transmit the order
  ${passed}=        Review_Transmit_form1099Nec

 

 
