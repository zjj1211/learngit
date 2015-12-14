<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
dim id
id=request.form("id")
sql="select course_type,courseweeknum,facility,destination,substance,courseplan from dbo.tabkcsb where id="&id&""
set rs=conn.execute(sql)
dim ctype,cweek,cfacility,cdestination,csubstance,cplan
ctype=rs("course_type")
cweek=rs("courseweeknum")
cfacility=rs("facility")
cdestination=rs("destination")
csubstance=rs("courseplan")
cplan=rs("courseplan")
response.write("<table class='table table-bordered'><tr><td>课程类型</td><td>"&ctype&"</td></tr><tr><td>课程周数</td><td>"&cweek&"</td></tr><tr><td>所需设备</td><td>"&cfacility&"</td></tr><tr><td>教学目的</td><td>"&cdestination&"</td></tr><tr><td>教学内容</td><td>"&csubstance&"</td></tr><tr><td>计划时间</td><td>"&cplan&"</td></tr></table>")
%>