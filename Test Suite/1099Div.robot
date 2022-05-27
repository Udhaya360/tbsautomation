*** Settings ***
Resource   ${CURDIR}/support/Div_support.robot


*** Test Cases ***
Login in to account
 	${xml}=    Parse XML    login.xml
	${obj_email}=    	Get Element Text    	${xml}   	email 
	${obj_pass}=		Get Element Text    	${xml}   	password
	${obj_signin}=		Get Element Text    	${xml}   	login
	${wbook}=     Set Variable     1099Series.xlsx
	Open Workbook      ${wbook}
 	${accEmail}=	Get cell value    2    A   1099Div
	${accPassword}=	Get cell value    2    B   1099Div
	${siteURL}=	Get cell value    8    A   1099Div

	Open Browser          ${siteURL}	chrome

	Maximize Browser Window
	input text			${obj_email}		${accEmail}
	input text			${obj_pass}		${accPassword}
	Click button			${obj_signin}
  Sleep  20s
Click Form 1099-DIV
  ${passed}=        Select_Form
  Sleep  5s
Submit Form 1099-DIV
  ${passed}=        FillForm_1099Div
  Sleep  15s
Review and Transmit the order
  ${passed}=        Review_Transmit_form1099
 
