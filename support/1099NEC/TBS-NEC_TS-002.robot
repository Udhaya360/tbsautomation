*** Keywords ***
TBS-NEC_TS-002

	${xml}=    Parse XML    ../Object Repository/1099Nec.xml
	${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_clear}=	Get Element Text	${xml}	clear
	${obj_selectpayer}=    		Get Element Text    	${xml}   	selectpayer
	${obj_psearch}=			Get Element Text	${xml}		psearch
	${obj_spayer}=			Get Element Text	${xml}		spayer
	${obj_rlookup}=    		Get Element Text    	${xml}   	rlookup
	${obj_rtype}=			Get Element Text	${xml}		rtype
	${obj_reciselect}=			Get Element Text	${xml}		reciselect			
	${obj_nonemp}=			Get Element Text    	${xml}   	b1nonemp
	${obj_payersales}=		Get Element Text    	${xml}   	b2payersales
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
	Open Workbook      ${wbook}
	Wait Until Element is Enabled	${obj_clear}	20s
	Click Element		${obj_clear}
	${Businessdata}=       Get cell value    6    A   1099_Nec_Scenario
	Click Element           	${obj_selectpayer}		
	sleep 	10s			
	Input Text			${obj_psearch}			${Businessdata}		
	Click Element        		${obj_spayer}
	${obj_rtype1}=	Get cell value    3    C   1099_Nec_Scenario
	${obj_nonemp1}=	Get cell value    3    W   1099_Nec_Scenario
	
	
	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element           	${obj_rlookup}		
	sleep 	10s		
	Input Text			${obj_rtype}			${obj_rtype1}
	Click Element      ${obj_reciselect}                              				
	Input Text			${obj_nonemp}		${obj_nonemp1}	
	Click Element       ${obj_saveadd}
	
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont}
	
	Run Keyword Unless    ${passed}       Capture Page Screenshot     ../Support/Screenshots/${logid}_TBS-NEC_TS-002.png
	sleep	5s
  	Run Keyword Unless    ${passed}      writelog    '${logid}','TBS-NEC_TS-002','Create Form with Foreign Address','NEC form should be created with foreign address','NEC form created with foreign address','Pass','${logid}_TBS-NEC_TS-002.png' 
	