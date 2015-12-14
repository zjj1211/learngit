<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->

<%

Dim Time_segment,Term_time,T,Tcurrent
sql="select time_segment,status,term_time from tbltime where status='n'"
set myres=conn.execute(sql)
if not myres.eof then
Time_segment=myres("time_segment")
Term_time=myres("term_time")
end if 
T=split(Time_segment,"-")
Tcurrent=T(0)&T(1)&Term_time

userId=session("userId")
dim condition,courseid,stuno
condition=trim(request.form("stunoArr"))
courseid=request.form("courseid")

	'userId = "004"
	'condition = "028071,034570,035790,039891,046136,047251,"
	'courseid = "C040026"
stuno = split(condition,",")
dim arrCount,testnum
arrCount = ubound(stuno)

'response.write("testnum"&testnum)
dim sumNum,currentNum
sql0 = "select stucount,current_num from dbo.tabcourse where courseid='"&courseid&"'"
set rs0 = conn.execute(sql0)
sql1 = "select count(courseid) as currNum from dbo.tabsel where courseid='"&courseid&"'"
set rs1 = conn.execute(sql1)
if not rs0.eof then
	sumNum = rs0("stucount")
	'currentNum = rs0("current_num")
end if
if not rs1.eof then
	currNum = rs1("currNum")
end if	
testnum = arrCount + currNum
if testnum > sumNum then
	response.write("超出限值")
else if currNum >= sumNum then
	response.write("人数已满")

else		
	for each stu in stuno
	if stu<>"" then


	sql="insert into dbo.tabsel (stuno,courseid,teano,termtime) values ('"&stu&"','"&courseid&"','"&userId&"','"&Tcurrent&"')"
	conn.execute(sql)	
	end if
	
	next
response.write("成功")


end if
end if
	sql2 = "update dbo.tabcourse set current_num=(select count(courseid) from dbo.tabsel where courseid='"&courseid&"') where courseid='"&courseid&"'"
	conn.execute(sql2)	
%>