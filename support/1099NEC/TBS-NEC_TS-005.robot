*** Keywords ***
TBS-NEC_TS-005

	${xml}=    Parse XML    ../Object Repository/1099Nec.xml
	${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_selectpayer}=    		Get Element Text    	${xml}   	selectpayer
	${obj_psearch}=			Get Element Text	${xml}		psearch
	${obj_spayer}=			Get Element Text	${xml}		spayer
	${obj_rlookup}=    		Get Element Text    	${xml}   	rlookup
	${obj_rtype}=			Get Element Text	${xml}		rtype
	${obj_reciselect}=			Get Element Text	${xml}		reciselect			
	${obj_nonemp}=			Get Element Text    	${xml}   	b1nonemp
	#${obj_payersales}=		Get Element Text    	${xml}   	b2payersales
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
	
	${obj_rtype1}=	Get cell value    6    C   1099_Nec_Scenario
	${obj_nonemp1}=	Get cell value    6    W   1099_Nec_Scenario
	${obj_fdwh1}=	Get cell value    6    Y   1099_Nec_Scenario
	
	
	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element           	${obj_rlookup}		
	sleep 	10s		
	Input Text			${obj_rtype}			${obj_rtype1}
	
	Click Element      ${obj_reciselect1}                              
						
	Input Text			${obj_nonemp}		${obj_nonemp1}	
	#Click Element			${obj_payersales}	
	Input Text			${obj_fdwh}		${obj_fdwh1}
	
	Click Element       ${obj_saveadd}
	
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 
	Run Keyword Unless    ${passed}       Capture Page Screenshot     ../Support/Screenshots/${logid}_TBS-NEC_TS-005.png
	sleep	5s
  	Run Keyword Unless    ${passed}      writelog    '${logid}','TBS-NEC_TS-005','Create form with Recipient TIN not provided','NEC form should be created','NEC form is created','Pass','${logid}_TBS-NEC_TS-005.png'