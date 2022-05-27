*** Keywords ***
TBS-NEC_TS-008

	${xml}=    Parse XML    ../Object Repository/1099Nec.xml
	${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
	${obj_selectpayer}=    		Get Element Text    	${xml}   	selectpayer
	${obj_psearch}=			Get Element Text	${xml}		psearch
	${obj_spayer}=			Get Element Text	${xml}		spayer
	${obj_reciselect}=			Get Element Text	${xml}		reciselect			
	${obj_savecont}=			Get Element Text    	${xml} 		savecont
	${obj_saveadd}=		Get Element Text    	${xml}		saveadd
	${obj_addressent}=			Get Element Text    	${xml} 		addressent
	${obj_addresscont}=		Get Element Text    	${xml}		addresscont
	${obj_reciselect1}=			Get Element Text	${xml}		reciselect1
	${obj_rname}=		Get Element Text    	${xml}		rname
	${obj_raddress}=			Get Element Text    	${xml} 		raddress
	${obj_rcity}=		Get Element Text    	${xml}		rcity
	${obj_rzipcode}=			Get Element Text	${xml}		rzip
	${obj_rstate}=		Get Element Text    	${xml}		rstate
	${obj_alstate}=			Get Element Text	${xml}		alstate
	${obj_nonemp}=			Get Element Text    	${xml}   	b1nonemp
	${obj_payersales}=		Get Element Text    	${xml}   	b2payersales
	${obj_fdwh}=			Get Element Text    	${xml}   	b4fdwh	
	Open Workbook      ${wbook}
	
	${obj_rname1}=	Get cell value    9    C   1099_Nec_Scenario
	${obj_raddress1}=	Get cell value    9    G   1099_Nec_Scenario
	${obj_rcity1}=	Get cell value    9    I   1099_Nec_Scenario
	${obj_rzipcode1}=	Get cell value    9    K   1099_Nec_Scenario
	${obj_nonemp1}=	Get cell value    9    W   1099_Nec_Scenario
	${obj_fdwh1}=	Get cell value    9    Y   1099_Nec_Scenario
	
	#Execute Javascript    window.location.reload(true);
	#sleep	10s
	Input Text	${obj_rname}		${obj_rname1}
	Input Text	${obj_raddress}		${obj_raddress1}
	Input Text	${obj_rcity}		${obj_rcity1}
	Input Text	${obj_rzipcode}		${obj_rzipcode1}
	sleep	5s 
	Execute Javascript  document.evaluate('${obj_rstate}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
  	sleep   2s
	Execute Javascript  document.evaluate('${obj_alstate}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();

	#Input Text			${obj_nonemp}		${obj_nonemp1}	
	#Click Element			${obj_payersales}	
	#Input Text			${obj_fdwh}		${obj_fdwh1}                              
	#Click Element       ${obj_saveadd}
	#sleep	5s
	#${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	#Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	#${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	#Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 
	#Page Should Contain Element	Recipient's SSN required
	Capture Page Screenshot 	${CURDIR}/Screenshot/TBS-NEC_TS-008.png
	