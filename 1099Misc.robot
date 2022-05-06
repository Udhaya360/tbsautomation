*** Settings ***
Resource   ${CURDIR}/support/Misc_support.robot


*** Test Cases ***
Login in to account
  	${xml}=    Parse XML    login.xml
	${obj_email}=    	Get Element Text    	${xml}   	email 
	${obj_pass}=		Get Element Text    	${xml}   	password
	${obj_signin}=		Get Element Text    	${xml}   	login
  ${wbook}=     Set Variable     1099Series.xlsx
  Open Workbook      ${wbook}
	${accEmail}=       Get cell value    2    A   1099Misc
	${accPass}=       Get cell value    2    B   1099Misc
	${siteURL}=       Get cell value    8    A   1099Misc

	Open Browser           ${siteURL}	 Chrome
	Maximize Browser Window
	input text			${obj_email}		${accEmail}
	input text			${obj_pass}		${accPass}
	Click button			${obj_signin}

  Sleep  10s
Click Start New Form
  ${passed}=        Select_Form
TBS-MISC_TS-001
  ${passed}=      TBS-MISC_TS-001
TBS-MISC_TS-002
  ${passed}=      TBS-MISC_TS-002
TBS-MISC_TS-003
  ${passed}=      TBS-MISC_TS-003
TBS-MISC_TS-004
  ${passed}=      TBS-MISC_TS-004
TBS-MISC_TS-005
  ${passed}=      TBS-MISC_TS-005
TBS-MISC_TS-006
  ${passed}=      TBS-MISC_TS-006
TBS-MISC_TS-007
  ${passed}=      TBS-MISC_TS-007

 
