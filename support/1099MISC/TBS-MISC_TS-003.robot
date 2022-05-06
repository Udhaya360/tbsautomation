*** Keywords ***
TBS-MISC_TS-003


	${xml}=    Parse XML    1099Misc.xml
	${obj_business}=		Get Element Text    	${xml}   	business
	${obj_bsearch}=		Get Element Text    	${xml}   	bsearch
	${obj_bselect}=		Get Element Text    	${xml}   	bselect
	${obj_recipient}=		Get Element Text    	${xml}   	recipient
	${obj_rsearch}=		Get Element Text    	${xml}   	rsearch
	${obj_rselect}=		Get Element Text    	${xml}   	rselect
	${obj_line1}=		Get Element Text    	${xml}   	line1
	${obj_line2}=		Get Element Text    	${xml}   	line2
	${obj_line3}=		Get Element Text    	${xml}   	line3
	${obj_line4}=		Get Element Text    	${xml}   	line4
	${obj_line5}=		Get Element Text    	${xml}   	line5
	${obj_line6}=		Get Element Text    	${xml}   	line6
	${obj_line7}=		Get Element Text    	${xml}   	line7
	${obj_line8}=		Get Element Text    	${xml}   	line8
	${obj_line9}=		Get Element Text    	${xml}   	line9
	${obj_line10}=		Get Element Text    	${xml}   	line10
	${obj_line11}=		Get Element Text    	${xml}   	line11
	${obj_line12}=		Get Element Text    	${xml}   	line12
	${obj_line13}=		Get Element Text    	${xml}   	line13
	${obj_line14}=		Get Element Text    	${xml}   	line14
	${obj_save}=		Get Element Text    	${xml}   	save
	${obj_savecon}=		Get Element Text    	${xml}   	savecon
	${obj_continue}=	Get Element Text    	${xml}   	continue
	${obj_add}=		Get Element Text    	${xml}   	add
	${obj_misc}=		Get Element Text    	${xml}   	misc
	${obj_address}=		Get Element Text    	${xml}          address

	sleep     2s
	
  ${wbook}=     Set Variable     1099Series.xlsx
  Open Workbook      ${wbook}
  ${sheet}=        Read Worksheet   1099Misc
  ${rows}=         Get Length  ${sheet}
  
	${RecipientTIN}=       Get cell value    4    C   1099Misc
	${Rents}=       Get cell value    4    D   1099Misc
	${Royalties}=       Get cell value    4    E   1099Misc
	${Other}=       Get cell value    4    F   1099Misc
	${Federal}=       Get cell value    4    G   1099Misc
	${Fishing}=       Get cell value    4    H   1099Misc
	${Medical}=       Get cell value    4    I   1099Misc
	${Substitute}=       Get cell value    4    K   1099Misc
	${Crop}=       Get cell value    4    L   1099Misc
	${Gross}=       Get cell value    4    M   1099Misc
	${Fish}=       Get cell value    4    N   1099Misc
	${Section}=       Get cell value    4    O   1099Misc
	${Excess}=       Get cell value    4    P   1099Misc
	${Nonqualified}=       Get cell value    4    Q   1099Misc
	
	
	#Wait Until Element Is Enabled 		${obj_recipient}  		10s
	sleep    7s
	Click Element         ${obj_recipient}
	Wait Until Element Is Enabled 		${obj_rsearch}			10s
	input text			${obj_rsearch}		${RecipientTIN}
	Wait Until Element Is Enabled 		${obj_rselect}  		10s
	Click Element         ${obj_rselect}
	input text			${obj_line1}		${Rents}
	input text			${obj_line2}		${Royalties}
	input text			${obj_line3}		${Other}
	input text			${obj_line4}		${Federal}
	input text			${obj_line5}		${Fishing}
	input text			${obj_line6}		${Medical}
	#Wait Until Element Is Enabled 		${obj_line7}		5s
	#Click Element         ${obj_line7}
	input text			${obj_line8}		${Substitute}
	input text			${obj_line9}		${Crop}
	input text			${obj_line10}		${Gross}
	input text			${obj_line11}		${Fish}
	input text			${obj_line12}		${Section}
	input text			${obj_line13}		${Excess}
	input text			${obj_line14}		${Nonqualified}

	Click Element         ${obj_save}
	sleep    2s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_address}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_address}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_continue}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_continue}

	
