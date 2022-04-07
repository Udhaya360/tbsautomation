*** Keywords ***
Review_Transmit_form1099Nec

	${xml}=    Parse XML    login.xml
	
	
	${obj_adtsave}=		Get Element Text    	${xml}		adtsavecont
	
	
	${obj_compltorder}=		Get Element Text    	${xml}		compltorder
	
	${obj_ctransmit}=		Get Element Text    	${xml}		ctransmit

	
	
	Click Element		${obj_adtsave}
	Sleep 	15s
	Click Element		${obj_compltorder}
	Sleep 	5s
	
	Click Element			${obj_ctransmit}
	
