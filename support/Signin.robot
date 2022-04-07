*** Keywords ***
Login _Functionality

	${xml}=    Parse XML    login.xml
	${wbook}=     Set Variable     1099NEC_2021.xlsx
	${obj_email}=    	Get Element Text    	${xml}   	email 
	${obj_pass}=		Get Element Text    	${xml}   	password
	${obj_signin}=		Get Element Text    	${xml}   	login
	Open Workbook      ${wbook}
 	${sheet}=        Read Worksheet   Sheet1
  	${rows}=         Get Length  ${sheet}
	${obj_email1}=	Get cell value    2    A   Sheet1
	${obj_pass1}=	Get cell value    2    B   Sheet1

	Open Browser           https://secure.tbsuat.com/	 Chrome
	Maximize Browser Window
	input text			${obj_email}		${obj_email1}
	input text			${obj_pass}		${obj_pass1}
	Click button			${obj_signin}






