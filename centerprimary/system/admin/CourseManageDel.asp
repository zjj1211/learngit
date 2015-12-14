<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%

dim courseid,distinct
courseid = request.form("courseid")
distinct = request.form("distinct")
if courseid = "" or distinct = "" then
	response.write("设置失败")
else if distinct = "0" then
	sql = "delete from dbo.tabcourse where courseid = '"&courseid&"'"
	conn.execute(sql)
	sql1 = "delete from dbo.tabsel where courseid = '"&courseid&"'"
	conn.execute(sql1)
	response.write("删除成功")
else if distinct = "1" then
	dim time1,time2,classSite
	time1 = request.form("time1")
	time2 = request.form("time2")
	classSite = request.form("classSite")
	cweekday = request.form("weekday")
	sql2 = "update tabcourse set coursetime='"&time1&"-"&time2&"',areano='"&classSite&"',courseweekday='"&cweekday&"' where courseid='"&courseid&"'"
	conn.execute(sql2)
	response.write("保存成功")

else
	response.write("设置失败")
end if
end if 
end if


%>