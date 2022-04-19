*** Keywords ***
Select_Form

	${xml}=    Parse XML    login.xml
	${obj_start}=    	Get Element Text    	${xml}   	start
	${obj_newform}=		Get Element Text    	${xml}   	form
	
	Click Element            ${obj_start}
	Sleep  	3s
	#Wait Until Element Is Enabled		${obj_newform}		10s	
	Click Element        ${obj_newform} 
	
	
