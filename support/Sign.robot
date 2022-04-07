*** Keywords ***
Login _Functionality

	${xml}=    Parse XML    login.xml
	${obj_email}=    	Get Element Text    	${xml}   	email 
	${obj_pass}=		Get Element Text    	${xml}   	password
	${obj_signin}=		Get Element Text    	${xml}   	login
  ${wbook}=     Set Variable     1099misc.xlsx
  Open Workbook      ${wbook}
  #${sheet}=        Read Worksheet   RecipientDetails
  #${rows}=         Get Length  ${sheet}
  #FOR    ${i}    IN RANGE    2    ${rows}+1  
	${fname}=       Get cell value    2    A   RecipientDetails
	${fPass}=       Get cell value    2    B   RecipientDetails

	Open Browser           https://secure.tbsuat.com/	 Chrome
	Maximize Browser Window
	input text			${obj_email}		${fname}
	input text			${obj_pass}		${fPass}
	Click button			${obj_signin}






