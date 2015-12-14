<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="ConnDB.asp" -->

<%
dim Stuno,Sname,Sgender,Classno,Classname,Stime
Stuno=request.form("Stuno")
Sname=request.form("Sname")
Sgender=request.form("Sgender")
Classno=request.form("Classno")
Classname=request.form("Classname")
Stime=request.form("Stime")
distinct=request.form("distinct")
%>



<%
if Stuno="" or distinct="" then
  response.write("设置失败")
else if distinct="0" then
  sql = "delete from dbo.tabstu where stuno = '"&Stuno&"'"
  conn.execute(sql)
  response.write("删除学生成功")
else if distinct="1" then
  sql2="update dbo.tabstu set name='"&Sname&"',sex='"&Sgender&"',classno='"&Classno&"',classname='"&Classname&"' where stuno='"&Stuno&"'"
  conn.execute(sql2)
  response.write("保存成功")
else
  response.write("设置不正确")
end if
end if 
end if
%>
