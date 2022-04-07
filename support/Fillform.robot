*** Keywords ***
FillForm_1099Nec

	${xml}=    Parse XML    login.xml
	${wbook}=     Set Variable     1099NEC_2021.xlsx
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
 	${sheet}=        Read Worksheet   RecipientInfo
  	${rows}=         Get Length  ${sheet}
	#FOR    ${i}    IN RANGE    2  ${rows}+1
	${Businessdata}=       Get cell value    5    A   RecipientInfo
	Click Element           	${obj_selectpayer}		
	sleep 		10s			
	Input Text			${obj_psearch}			${Businessdata}		
	Click Element        		${obj_spayer} 
 	 
  FOR    ${i}    IN RANGE    2    ${rows}+1    	     	
      	
	${obj_rtype1}=	Get cell value    ${i}    C   RecipientInfo
	${obj_nonemp1}=	Get cell value    ${i}    W   RecipientInfo
	${obj_fdwh1}=	Get cell value    ${i}    Y   RecipientInfo
	
	Wait Until Element is Enabled	${obj_rlookup}	20s	
	Click Element           	${obj_rlookup}		
	sleep 		10s		
	Input Text			${obj_rtype}			${obj_rtype1}
	Run Keyword If	${i}== 2  Click Element      ${obj_reciselect}  
	                             
	...        ELSE        	Click Element       ${obj_reciselect1}	
					
	Input Text			${obj_nonemp}		${obj_nonemp1}	
	Click Element			${obj_payersales}	
	Input Text			${obj_fdwh}		${obj_fdwh1}	
	
	Run Keyword If	${i}==${rows}  Click Element       ${obj_savecont}  
	                             
	...        ELSE        	Click Element       ${obj_saveadd}

	sleep	5s
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addressent}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addressent}
	${passed} =    Run Keyword And Return Status         Wait Until Element Is Enabled       ${obj_addresscont}    10s
	Run Keyword If    ${passed}    Click Element   ${obj_addresscont} 
				  
	
		
  END	 
	
	