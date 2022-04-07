*** Settings ***
Library      SeleniumLibrary
Library      XML

*** Test Cases ***
Login _Functionality

	${xml}=    Parse XML    login.xml
	${obj_email}=    	Get Element Text    	${xml}   	email 
	${obj_pass}=		Get Element Text    	${xml}   	password
	${obj_signin}=		Get Element Text    	${xml}   	login
	${obj_start}=		Get Element Text    	${xml}   	startnew

	Open Browser           https://secure.tbsuat.com/	 Chrome
	Maximize Browser Window
	input text			${obj_email}		sabarisindu.s+mar21@w3magix.com
	input text			${obj_pass}		Span@123
	Click button			${obj_signin}
	sleep 10s
        Click button			${obj_startnew}
	Wait Until Element Is Visible        





