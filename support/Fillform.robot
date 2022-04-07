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
	${obj_revsave}=		Get Element Text    	${xml}		revsavecont
	Open Workbook      ${wbook}
 	${sheet}=        Read Worksheet   Sheet1
  	${rows}=         Get Length  ${sheet}
	#FOR    ${i}    IN RANGE    2  ${rows}+1
 	 
  FOR    ${i}    IN RANGE    2    12
     	 
      	
      	
	${obj_rtype1}=	Get cell value    ${i}    C   Sheet1
	${obj_nonemp1}=	Get cell value    ${i}    W   Sheet1
	${obj_fdwh1}=	Get cell value    ${i}    Y   Sheet1
	Wait Until Element is Enabled	${obj_selectpayer}	10s
	Click Element           	${obj_selectpayer}		
	sleep 		10s
			
	Input Text			${obj_psearch}			YES Bank		
	Click Element        		${obj_spayer} 
	Wait Until Element is Enabled	${obj_rlookup}		3s	
	Click Element           	${obj_rlookup}		
	sleep 		10s
			
	Input Text			${obj_rtype}			${obj_rtype1}
		
	Click Element        		${obj_reciselect} 		
	
	
	Input Text			${obj_nonemp}		${obj_nonemp1}	
	Click Element			${obj_payersales}	
	Input Text			${obj_fdwh}		${obj_fdwh1}
	
	Click Element           	${obj_savecont}
	sleep	10s
	Run Keyword If	${i}==${rows}  Click Element       ${obj_revsave}  
	                             
	...        ELSE        	Click Element       ${obj_addnew} 
				  
	sleep	10s
	Click Element			${obj_clicknec}
	Wait Until Element is Enabled	${obj_clickfilenec}	20s
	Click Element 			${obj_clickfilenec}
	Wait Until Element is Visible	${obj_clickmanual}	500s
	Click Element 			${obj_clickmanual} 
		
  END	 
	
	