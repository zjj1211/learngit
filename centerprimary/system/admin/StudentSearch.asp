<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
dim Keyword
Keyword=request.querystring("Keyword")
'response.Write(Keyword)
%>
<% dim rs,Stuname
  Stuname="%"&Keyword&"%"
  Set rs=Server.CreateObject("ADODB.Recordset")
  '设置rs的ActiveConnection属性，绑定到连接
  Set rs.ActiveConnection = Conn
  '设置游标类型
  rs.CursorType = 3
  '打开记录集
 ' rs.Open "SELECT id,teano,teaname,sex,teachtype FROM dbo.tabteach where teaname='"&Teaname&"'"
%>
<%
  dim i,Stuno,Sex,Classname,stu_time
  'response.Write("按姓名查找的内容如下：")
  if isNumeric(Keyword) then
  sql="SELECT stuno,name,sex,classname,stu_status_time FROM dbo.tabstu where stuno like '%"&Stuname&"%' order by stuno" 
  else
  sql="SELECT stuno,name,sex,classname,stu_status_time FROM dbo.tabstu where name like '%"&Stuname&"%' order by stuno" 
  end if
  Set rs1 = conn.execute(sql)
  i=0

  do while not rs1.eof 
  i=i+1
  Stuno = rs1("stuno")
  Stuname = rs1("name")
  Sex = rs1("sex")
  Classname = rs1("classname")
  stu_time = rs1("stu_status_time")

  response.Write("<tr class='stuInfo'><td>"&i&"</td><td name='stuno'>"&Stuno&"</td><td>"&Stuname&"</td><td>"&Sex&"</td><td>"&classname&"</td><td>"&stu_time&"</td></tr>")
%>


<%
rs1.movenext
loop
%>