*** Keywords ***
Login _Functionality

	${xml}=    Parse XML    login.xml
	${obj_email}=    	Get Element Text    	${xml}   	email 
	${obj_pass}=		Get Element Text    	${xml}   	password
	${obj_signin}=		Get Element Text    	${xml}   	login

	Open Browser           https://secure.tbsuat.com/	 Chrome
	Maximize Browser Window
	input text			${obj_email}		udhaya.g+april05@dotnetethics.com
	input text			${obj_pass}		Span@123
	Click button			${obj_signin}






