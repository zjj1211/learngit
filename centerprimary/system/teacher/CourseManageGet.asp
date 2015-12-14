<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->

<%
dim courseid
courseid=request.form("courseid")
'courseid="A080002 "
sql="select coursetime,courseweeknum,courseweekday,coursehour,stucount,areano from dbo.tabcourse where courseid='"&courseid&"'"
set rs=conn.execute(sql)
'response.write(sql)
if not rs.eof then
dim ctime,cweek,cday,chour,scount,carea
ctime=rs("coursetime")
cweek=rs("courseweeknum")
cday=rs("courseweekday")
chour=rs("coursehour")
scount=rs("stucount")
carea = rs("areano")
response.write("<tr><td>上课时间</td><td>"&cday&ctime&"</td></tr><tr><td>上课地点</td><td>"&carea&"</td></tr><tr><td>课程周数</td><td>"&cweek&"</td></tr><tr><td>课程学时</td><td>"&chour&"</td></tr><tr><td>限制人数</td><td>"&scount&"</td></tr>")
end if
%>