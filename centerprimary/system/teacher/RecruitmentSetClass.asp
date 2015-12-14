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
dim grade,classno,couseid
grade=request.form("grade")
classno=request.form("classno")
courseid=request.form("courseid")
sql="select stuno from dbo.tabstu where classno='"&grade&""&classno&"'"
set rs=conn.execute(sql)
do while not rs.eof
dim studentNum
studentNum=rs("stuno")
sql1="insert into dbo.tabsel (stuno,courseid,teano,year) values('"&studentNum&"','"&courseid&"','"&userId&"','"&Tcurrent&"')"
'response.write(sql1)
conn.execute(sql1)
rs.movenext
loop

sql2="update dbo.tabcourse set current_num=(select count(courseid) from dbo.tabsel where courseid='"&courseid&"') where courseid='"&courseid&"'"
'conn.execute(sql2)
%>