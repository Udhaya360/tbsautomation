*** Keywords ***
Select_Form

	${xml}=    Parse XML    login.xml
	${obj_start}=    	Get Element Text    	${xml}   	start
	${obj_newform}=		Get Element Text    	${xml}   	form
	${obj_nec}=		Get Element Text    	${xml}   	nec
	${obj_necbt}=		Get Element Text    	${xml}   	necbt
	${obj_manualb}=		Get Element Text    	${xml}   	manualb
	
	Click Element            ${obj_start}
	Sleep  	3s	
	Click Element        ${obj_newform} 
	Sleep	3s
	Click Element         ${obj_nec}
	Sleep	3s
	Click Element         ${obj_necbt}
	Sleep	3s
	Click Element         ${obj_manualb}
