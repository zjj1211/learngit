<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
dim teano,courseid,course_name,course_type
teano = trim(request.form("teano"))

sql1 = "select courseid,course_name,course_type from dbo.tabcourse where teano='"&teano&"'"

set rs1 = conn.execute(sql1)

do while not rs1.eof
courseid = rs1("courseid")
course_name = rs1("course_name")
course_type = rs1("course_type")
response.write("<tr><td>"&courseid&"</td><td>"&course_name&"</td><td>"&course_type&"</td></tr>")
rs1.movenext
loop
%>