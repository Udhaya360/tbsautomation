*** Settings ***
Resource   ${CURDIR}/support/W2_support.robot


*** Test Cases ***
Login in to account
  	${xml}=    Parse XML    login.xml
	${obj_email}=    	Get Element Text    	${xml}   	email 
	${obj_pass}=		Get Element Text    	${xml}   	password
	${obj_signin}=		Get Element Text    	${xml}   	login	
  ${wbook}=     Set Variable     Form W-2.xlsx
  Open Workbook      ${wbook}
	${accEmail}=       Get cell value    2    A   W-2
	${accPass}=       Get cell value    2    B   W-2
	${siteURL}=       Get cell value    8    A   W-2

	Open Browser           ${siteURL}	 Edge
	Maximize Browser Window
	input text			${obj_email}		${accEmail}
	input text			${obj_pass}		${accPass}
	Click button			${obj_signin}
   Sleep  20s
Click Start New Form
   ${passed}=        Select_Form
Fill Form W-2
   ${passed}=      Select_Form_W-2
	${xml}=    Parse XML    login.xml
	${obj_bulkaction}=		Get Element Text    	${xml}   	bulkaction
	${obj_bulkdelete}=		Get Element Text    	${xml}   	bulkdelete
	${obj_delpermanent}=		Get Element Text    	${xml}   	delpermanent
   Sleep  10s
	Click Element		${obj_bulkaction}
	sleep 	6s 
	Click Element		${obj_bulkdelete}
	sleep 	5s 
	Click Element		${obj_delpermanent}
