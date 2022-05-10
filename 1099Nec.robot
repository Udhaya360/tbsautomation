*** Settings ***
Resource   ${CURDIR}/support/Nec_support.robot


*** Test Cases ***
Login in to account
 	${xml}=    Parse XML    login.xml
	${obj_email}=    	Get Element Text    	${xml}   	email 
	${obj_pass}=		Get Element Text    	${xml}   	password
	${obj_signin}=		Get Element Text    	${xml}   	login
	${wbook}=     Set Variable     1099Series.xlsx
	Open Workbook      ${wbook}
 	${accEmail}=	Get cell value    2    A   1099Nec
	${accPassword}=	Get cell value    2    B   1099Nec
	${siteURL}=	Get cell value    8    A   1099Nec

	Open Browser          ${siteURL}	 Chrome
	Maximize Browser Window
	input text			${obj_email}		${accEmail}
	input text			${obj_pass}		${accPassword}
	Click button			${obj_signin}
  Sleep  20s
Click Form 1099-NEC
  ${passed}=        Select_Form
  Sleep  5s
Test Scenario TBS-NEC_TS-001
  ${passed}=        TBS-NEC_TS-001
  Sleep  15s
Test Scenario TBS-NEC_TS-002
  ${passed}=        TBS-NEC_TS-002
  Sleep	 15s
Test Scenario TBS-NEC_TS-003
  ${passed}=        TBS-NEC_TS-003
  Sleep	 15s
Test Scenario TBS-NEC_TS-004
  ${passed}=        TBS-NEC_TS-004
  Sleep	 15s	
Test Scenario TBS-NEC_TS-005
  ${passed}=        TBS-NEC_TS-005
  Sleep	 15s
Test Scenario TBS-NEC_TS-006
  ${passed}=        TBS-NEC_TS-006
  Sleep	 15s
Test Scenario TBS-NEC_TS-007
  ${passed}=        TBS-NEC_TS-007


 

 
