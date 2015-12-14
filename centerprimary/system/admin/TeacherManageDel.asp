<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->

<%

dim Teano,Tname,Ttype,intr,distinct
Teano=request.form("Teano")
Tname=request.form("Tname")
Tgender=request.form("Tgender")
Ttype=request.form("Ttype")
intr=request.form("intr")
distinct=request.form("distinct")

%>



<%
if Teano= "" or distinct = "" then
  response.write("设置失败")
else if distinct = "0" then
  sql = "delete from dbo.tabteach where teano = '"&Teano&"'"
  conn.execute(sql)
  response.write("删除教师成功")
else if distinct="1" then
  sql2="update dbo.tabteach set teaname='"&Tname&"',sex='"&Tgender&"',teachtype='"&Ttype&"',teaintro='"&intr&"' where teano='"&Teano&"'"
  conn.execute(sql2)
  response.write("保存成功")
else
  response.write("设置失败")
end if
end if 
end if
%>
