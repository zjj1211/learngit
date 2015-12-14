<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
dim stuno,term,termyear,courseid
sql0 = "select year from dbo.TermCompare where CurrentTerm=1"
set rs0 = conn.execute(sql0)
term = rs0("year")
termyear = trim(replace(term,"-",""))
'response.write(termyear)
stuno = request.form("stuno")
'stuno="990197"
sql1 = "select courseid from dbo.tabsel where (stuno='"&stuno&"' and termtime like '"&termyear&"%')"
set rs1 = conn.execute(sql1)
dim course_name,course_type
do while not rs1.eof
courseid = rs1("courseid")
'response.write(sql1)
sql2 = "select course_name,course_type from dbo.tabcourse where courseid='"&courseid&"'"
set rs2 = conn.execute(sql2)

course_name = rs2("course_name")
course_type = rs2("course_type")
response.write("<tr><td>"&courseid&"</td><td>"&course_name&"</td><td>"&course_type&"</td></tr>")

rs1.movenext
loop
%>