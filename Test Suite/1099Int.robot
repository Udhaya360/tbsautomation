*** Settings ***
Resource   ${CURDIR}/support/INT_support.robot


*** Test Cases ***
Login in to account
 	${xml}=    Parse XML    login.xml
	${obj_email}=    	Get Element Text    	${xml}   	email 
	${obj_pass}=		Get Element Text    	${xml}   	password
	${obj_signin}=		Get Element Text    	${xml}   	login
	${wbook}=     Set Variable     1099Series.xlsx
	Open Workbook      ${wbook}
 	${accEmail}=	Get cell value    2    A   1099Int
	${accPassword}=	Get cell value    2    B   1099Int
	${siteURL}=	Get cell value    8    A   1099Int

	Open Browser          ${siteURL}	 Chrome
	Maximize Browser Window
	sleep	5s
	input text			${obj_email}		${accEmail}
	input text			${obj_pass}		${accPassword}
	Click button			${obj_signin}
  Sleep  20s
Click Form 1099-INT
  ${passed}=        Select_Form
  Sleep  5s
Submit Form 1099-INT
  ${passed}=        FillForm_1099Int
  Sleep  15s
Review and Transmit the order
  ${passed}=        Review_Transmit_form1099

 

 
