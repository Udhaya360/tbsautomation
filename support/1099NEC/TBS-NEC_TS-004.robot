*** Keywords ***
TBS-NEC_TS-004

	${xml}=    Parse XML    ../Object Repository/1099Nec.xml
	${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
	${obj_clear}=	Get Element Text	${xml}	clear
	${obj_nec}=		Get Element Text    	${xml}   	nec
	${obj_necbt}=		Get Element Text    	${xml}   	necbt
	${obj_manualb}=		Get Element Text    	${xml}   	manualb
	${obj_selectpayer}=    		Get Element Text    	${xml}   	selectpayer
	${obj_psearch}=			Get Element Text	${xml}		psearch
	${obj_spayer}=			Get Element Text	${xml}		spayer
	${obj_rlookup}=    		Get Element Text    	${xml}   	rlookup
	${obj_rtype}=			Get Element Text	${xml}		rtype
	${obj_reciselect}=			Get Element Text	${xml}		reciselect			
	${obj_nonemp}=			Get Element Text    	${xml}   	b1nonemp
	${obj_fdwh}=			Get Element Text    	${xml}   	b4fdwh
	${obj_savecont}=			Get Element Text    	${xml} 		savecont
	${obj_addnew}=			Get Element Text    	${xml}   	addnew
	${obj_clicknec}=			Get Element Text    	${xml} 		clicknec
	${obj_clickfilenec}=			Get Element Text    	${xml} 		clickfilenec
	${obj_clickmanual}=			Get Element Text    	${xml} 		clickmanual
	${obj_saveadd}=		Get Element Text    	${xml}		saveadd
	${obj_addressent}=			Get Element Text    	${xml} 		addressent
	${obj_addresscont}=		Get Element Text    	${xml}		addresscont
	${obj_reciselect1}=			Get Element Text	${xml}		reciselect1
	${obj_onlineaccess}=		Get Element Text    	${xml}		onlinecheckbox
	${obj_emailaddress}=			Get Element Text	${xml}		emailaddress
	Open Workbook      ${wbook}
	Wait Until Element is Enabled	${obj_clear}	20s
	Click Element		${obj_clear}
	${Businessdata}=       Get cell value    5    A   1099_Nec_Scenario
	Click Element           	${obj_selectpayer}		
	sleep 	10s			
	Input Text			${obj_psearch}			${Businessdata}		
	Click Element        		${obj_spayer}
	${obj_rtype1}=	Get cell value    5    C   1099_Nec_Scenario
	${obj_nonemp1}=	Get cell value    5    W   1099_Nec_Scenario
	${obj_fdwh1}=	Get cell value    5    Y   1099_Nec_Scenario
	${obj_oaccessemail}=	Get cell value    10    A   1099_Nec_Scenario
	
	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element           	${obj_rlookup}		
	sleep 	10s		
	Input Text			${obj_rtype}			${obj_rtype1}
	
	Click Element      ${obj_reciselect}                              
	Click Element	   ${obj_onlineaccess}						
	Input Text			${obj_nonemp}		${obj_nonemp1}
	#Click Element			${obj_payersales}	
	Input Text			${obj_fdwh}		${obj_fdwh1}	
	
	press keys   	${obj_emailaddress}        CTRL+a+BACKSPACE	
	Input Text			${obj_emailaddress}		${obj_oaccessemail}
	Click Element       ${obj_saveadd}
	sleep	5s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 