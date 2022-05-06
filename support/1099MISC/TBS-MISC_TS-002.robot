*** Keywords ***
TBS-MISC_TS-002


	${xml}=    Parse XML    1099Misc.xml
	${obj_business}=		Get Element Text    	${xml}   	business
	${obj_bsearch}=		Get Element Text    	${xml}   	bsearch
	${obj_bselect}=		Get Element Text    	${xml}   	bselect
	${obj_recipient}=		Get Element Text    	${xml}   	recipient
	${obj_rsearch}=		Get Element Text    	${xml}   	rsearch
	${obj_rselect}=		Get Element Text    	${xml}   	rselect
	${obj_line1}=		Get Element Text    	${xml}   	line1
	${obj_save}=		Get Element Text    	${xml}   	save
	${obj_savecon}=		Get Element Text    	${xml}   	savecon
	${obj_continue}=	Get Element Text    	${xml}   	continue
	
	${obj_address}=		Get Element Text    	${xml}          address

	sleep     2s
	
  ${wbook}=     Set Variable     1099Series.xlsx
  Open Workbook      ${wbook}
  ${sheet}=        Read Worksheet   1099Misc
  ${rows}=         Get Length  ${sheet}

	${RecipientTIN}=       Get cell value    3    C   1099Misc
	${Rents}=       Get cell value    3    D   1099Misc
	
	sleep    7s
	Click Element         ${obj_recipient}
	Wait Until Element Is Enabled 		${obj_rsearch}			10s
	input text			${obj_rsearch}		${RecipientTIN}
	Wait Until Element Is Enabled 		${obj_rselect}  		10s
	Click Element         ${obj_rselect}
	input text			${obj_line1}		${Rents}
	
	Click Element         ${obj_save}
	sleep    3s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_address}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_address}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_continue}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_continue}
	
	

	
