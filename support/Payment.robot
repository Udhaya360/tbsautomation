*** Keywords ***
Payment

	sleep   2s
	${xml}=    Parse XML    login.xml
	${obj_reviewcon}=		Get Element Text    	${xml}   	reviewcon
	${obj_auditcon}=		Get Element Text    	${xml}   	auditcon
	${obj_Complete}=		Get Element Text    	${xml}   	Complete
	${obj_Cname}=		Get Element Text    	${xml}   	Cname
	${obj_CMonth}=		Get Element Text    	${xml}   	CMonth
	${obj_CNumber}=		Get Element Text    	${xml}   	CNumber
	${obj_CCVV}=		Get Element Text    	${xml}   	CCVV
	${obj_CAdd1}=		Get Element Text    	${xml}   	CAdd1
	${obj_CAdd2}=		Get Element Text    	${xml}   	CAdd2
	${obj_CCity}=		Get Element Text    	${xml}   	CCity
	${obj_CState}=		Get Element Text    	${xml}   	CState
	${obj_SState}=		Get Element Text    	${xml}   	SState
	${obj_CZIP}=		Get Element Text    	${xml}   	CZIP
	${obj_CAuth}=		Get Element Text    	${xml}   	CAuth
	${obj_PayTrans}=		Get Element Text    	${xml}   	PayTrans
	
	sleep     5s
	Click Element         ${obj_reviewcon}
	sleep     5s
	Click Element         ${obj_auditcon}
	sleep     15s
	Click Element         ${obj_Complete}
	#Wait Until Element Is Enabled		${obj_Cname}		10s
	#Click Element         ${obj_Cname}
	#Execute Javascript  document.evaluate('${obj_Cname}', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click()
	#sleep     20s
	#input text			${obj_Cname}           John Smith
	#input text			${obj_CMonth}           1222
	#input text			${obj_CNumber}           4111111111111111
	#input text			${obj_CCVV}           123
	#input text			${obj_CAdd1}           123 Main Street
	#input text			${obj_CAdd2}           Suit 100
	#input text			${obj_CCity}           Rock Hill
	#Click Element			${obj_CState}           
	#Click Element			${obj_SState}      
	#input text			${obj_CZIP}           29730     
	#Click Element			${obj_CAuth}
	sleep     5s
	Click Element			${obj_PayTrans}