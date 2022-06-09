import  pyodbc
import  os
import  datetime
import  glob

def delh():
    os.remove("MyFile.txt")
    
def delimg():
    #pattern = "selenium-screenshot*"
    pattern = "*.png"
    files = glob.glob(pattern)
    for file in files:
        os.remove(file)
  

def delht():
    os.remove("My.html")  

def writeh(qry):
    val=qry.split(',')
    file1 = open("MyFile.txt","a")
    file1.write('<tr><th>'+val[1]+'</th><th>'+val[2]+'</th><th>'+val[5]+'</th></tr>')
    file1.close()


    
class associatelib:

  def fndbget(self,qry):
    connect=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};server=129.213.189.132;Database=ExpressExtensionAuto_Staging;uid=StagingAutomationDB_User;pwd=Asc$nd@s#113;Trusted_Connection=no;')
    cursor=connect.cursor()
    cursor.execute(qry)
    for row in cursor:
       return (row[0])
    cursor.close()
    connect.close()


  def writelog(self,qry):
    connect=pyodbc.connect('Driver={ODBC Driver 17 for SQL Server};server=129.213.189.132;Database=ExpressExtensionAuto_Staging;uid=StagingAutomationDB_User;pwd=Asc$nd@s#113;Trusted_Connection=no;')
    cursor=connect.cursor()
    cursor.execute("Insert into tb_log (logid,tsid,tsdesc,expectedresult,actualresult,runstatus,reference) values ("+qry+");")
    connect.commit()
    cursor.close()
    connect.close()
    writeh(qry)

  def logid(self):
    delimg()
    return("Log_"+"{:%Y%m%d%H%M%S}".format(datetime.datetime.now()))
    
    #all_files = os.listdir()
    #for f in all_files:
    #    print(f)
        #os.remove(f)
    #for f in glob.glob("*.png"):
    #    os.remove(f)
    
  def createh(self,logid):
    delht()
    strstatus = 'fail'
    file3 = open("MyFile.txt","r")
    valread=file3.read()
    passc = valread.count("<th>'pass'</th></tr>")
    failc = valread.count("<th>'fail'</th></tr>")
    totalc = valread.count('<tr><th>')
    if failc==0 :
        strstatus = 'pass'
    sumtable='<table cellspacing=”2” width=”100%” border=”1”><tr><th style="background-color:#FFA500">LogID</th><th style="background-color:#FFA500" >Run status</th><th style="background-color:#FFA500">total testcases</th><th style="background-color:#FFA500">pass tc</th><th style="background-color:#FFA500">fail tc</th></tr><tr><th>'+logid+'</th><th>'+strstatus+'</th><th>'+str(totalc)+'</th><th>'+str(passc)+'</th><th>'+str(failc)+'</th></tr></table>'
    valuestr='<html> <style> table, th, td {   border:1px solid black; } </style> <body>     <h1>Run Report</h1>  <h2>Run Summary</h2> '+ sumtable +'<h2>Run Details</h2> <table cellspacing=”0” cellpadding=”0” width=”100%” align=”center” border=”1”>       <tr><th style="background-color:#FA58F4">TestScenarioID</th><th style="background-color:#FA58F4">TestDescription</th><th style="background-color:#FA58F4">TestStatus</th></tr>'+ valread  +' </table> </body> </html>'
    valuestr = valuestr.replace(">pass", ' style="color: green">pass')
    valuestr = valuestr.replace(">'pass'", ' style="color: green">pass')
    valuestr = valuestr.replace(">fail", ' style="color: red">fail')
    valuestr = valuestr.replace(">'fail'", ' style="color: red">fail')
    file3.close()
    file2 = open("My.html","w")
    file2.write(valuestr)
    delh()
  
    

