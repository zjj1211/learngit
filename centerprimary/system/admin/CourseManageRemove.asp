<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
dim condition,courseid
condition=trim(request.form("condition"))
courseid=request.form("courseid")
stunoarr=split(condition,",")

if courseid<>"" or condition<>"" then
	for each stu in stunoarr
	if stu<>"" then
	sql="delete from dbo.tabsel where (stuno='"&stu&"' and courseid='"&courseid&"')"
	conn.execute(sql)	
	sql2 = "update dbo.tabcourse set current_num=(select count(courseid) from dbo.tabsel where courseid='"&courseid&"') where courseid='"&courseid&"'"
	conn.execute(sql2)
	response.write("成功")
	end if
	
	next
else
response.write("失败")
end if 	
%>