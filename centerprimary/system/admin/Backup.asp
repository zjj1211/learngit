<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->

<%
dim data,tabName,term,termtime,backup
data = trim(request.form("dataInfo"))
'data = "selcourse"
select case data
	case "student"
		tabName = "tabstu"
	case "selcourse"
		tabName = "tabsel"
	case "course"
		tabName = "tabcourse"
	case else
		tabName = "00"
end select	

sql1 = "select time_segment from dbo.tbltime where status='n'"
set rs1 = conn.execute(sql1)

if not rs1.eof then
	term = rs1("time_segment")
end if	
T = split(term,"-")
termtime = T(0)&T(1)
backup = tabName&termtime
if tabName = "tabstu" then
sql2 = "select * into "&backup&" from "&tabName&""
conn.execute(sql2)
else
sql3 = "select * into "&backup&" from "&tabName&" where termtime like'"&termtime&"%'"
conn.execute(sql3)
end if
response.write("备份成功")
%>