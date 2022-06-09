*** Keywords ***
TBS-NEC_TS-007

	${xml}=    Parse XML    ../Object Repository/1099Nec.xml
	${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
	${obj_selectpayer}=    		Get Element Text    	${xml}   	selectpayer
	${obj_psearch}=			Get Element Text	${xml}		psearch
	${obj_spayer}=			Get Element Text	${xml}		spayer
	${obj_rlookup}=    		Get Element Text    	${xml}   	rlookup
	${obj_rtype}=			Get Element Text	${xml}		rtype
	${obj_reciselect}=			Get Element Text	${xml}		reciselect			
	${obj_savecont}=			Get Element Text    	${xml} 		savecont
	${obj_saveadd}=		Get Element Text    	${xml}		saveadd
	${obj_ErrorPopup}=		Get Element Text    	${xml}		ErrorPopup
	${obj_FixError}=		Get Element Text    	${xml}		FixError
	${obj_addressent}=			Get Element Text    	${xml} 		addressent
	${obj_addresscont}=		Get Element Text    	${xml}		addresscont
	${obj_reciselect1}=			Get Element Text	${xml}		reciselect1
	Open Workbook      ${wbook}
	
	${obj_rtype1}=	Get cell value    8    C   1099_Nec_Scenario
	Execute Javascript    window.location.reload(true);
	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element           	${obj_rlookup}		
	sleep 	10s		
	Input Text			${obj_rtype}			${obj_rtype1}
	
	Click Element      ${obj_reciselect1}                              
	Click Element       ${obj_saveadd}
	sleep	5s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 
	Page Should Contain Element	${obj_ErrorPopup}
	Page Should Contain	F00-10008		
	Page Should Contain	At least one of the boxes should contain an amount greater than $0.00
	Run Keyword Unless    ${passed}       Capture Page Screenshot     ../Support/Screenshots/${logid}_TBS-NEC_TS-007.png
	Click Element         ${obj_FixError}
	
  	Run Keyword Unless    ${passed}      writelog    '${logid}','TBS-NEC_TS-007','Federal Validation Atleat any one filed should have an amount','Error message should be shown','Error message is shown','Pass','${logid}_TBS-NEC_TS-007.png'