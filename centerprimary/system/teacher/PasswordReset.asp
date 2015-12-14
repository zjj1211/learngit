<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->


    <%
    Dim uName1,uflag,userId
    'server对象的createobject方法建立connection对象
    uName1=session("uName")
    uflag=session("utype")
    userId=session("userId")
    %>
<%
dim stuno,flag,classno
flag=request.form("flag")
if flag=1 then
stuno=request.form("stuno")
sql="update dbo.tabstu set password='"&stuno&"' where stuno='"&stuno&"'"
response.write(sql)
conn.execute(sql)
else if flag = 0 then

sql1="select classno from dbo.tabteach where teano='"&userId&"'"
set rs=conn.execute(sql1)
if not rs.eof then 
classno=rs("classno") 
'取出班主任所在班的所在班级
'response.Write(grade)
end if
sql2="update dbo.tabstu set password=stuno where classno='"&classno&"'"
conn.execute(sql2)
end if
end if

%>