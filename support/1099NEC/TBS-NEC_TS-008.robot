*** Keywords ***
TBS-NEC_TS-008

	${xml}=    Parse XML    ../Object Repository/1099Nec.xml
	${wbook}=     Set Variable     ../Test Data/1099Series.xlsx
	${logid}=     Get Environment Variable     logid
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
	${obj_fdwh}=			Get Element Text    	${xml}   	b4fdwh	
	Open Workbook      ${wbook}
	
	${obj_rname1}=	Get cell value    9    C   1099_Nec_Scenario
	${obj_raddress1}=	Get cell value    9    G   1099_Nec_Scenario
	${obj_rcity1}=	Get cell value    9    I   1099_Nec_Scenario
	${obj_rzipcode1}=	Get cell value    9    K   1099_Nec_Scenario
	${obj_nonemp1}=	Get cell value    9    W   1099_Nec_Scenario
	${obj_fdwh1}=	Get cell value    9    Y   1099_Nec_Scenario
	
	Execute Javascript    window.location.reload(true);
	sleep	10s
	Input Text	${obj_rname}		${obj_rname1}
	Input Text	${obj_raddress}		${obj_raddress1}
	Input Text	${obj_rcity}		${obj_rcity1}
	Input Text	${obj_rzipcode}		${obj_rzipcode1}
	sleep	5s 
	Execute Javascript  document.evaluate('${obj_rstate}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
  	
	Wait Until Element Is Enabled		//div[contains (text(), "Alabama (AL)")]	3s
	Click Element		//div[contains (text(), "Alabama (AL)")]

	Input Text			${obj_nonemp}		${obj_nonemp1}	
	Input Text			${obj_fdwh}		${obj_fdwh1}                              
	Click Element       ${obj_saveadd}
	sleep	5s
	Execute JavaScript    window.document.evaluate("//label[contains(text(),"Recipient's SSN")]/following-sibling::input", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
	sleep	10s
	Page Should Contain Element	Recipient's SSN required
	Run Keyword Unless    ${passed}       Capture Page Screenshot     ../Support/Screenshots/${logid}_TBS-NEC_TS-008.png
  	Run Keyword Unless    ${passed}      writelog    '${logid}','TBS-NEC_TS-008','Create form without Recipient TIN ','Error message should be shown','Error message is shown','Pass','${logid}_TBS-NEC_TS-008.png'
	