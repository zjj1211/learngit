<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
dim Keyword
Keyword=request.querystring("Keyword")
'response.Write(Keyword)
%>
<% dim rs,Teaname
  Teaname="%"&Keyword&"%"
  Set rs=Server.CreateObject("ADODB.Recordset")
  '设置rs的ActiveConnection属性，绑定到连接
  Set rs.ActiveConnection = Conn
  '设置游标类型
  rs.CursorType = 3
  '打开记录集
 ' rs.Open "SELECT id,teano,teaname,sex,teachtype FROM dbo.tabteach where teaname='"&Teaname&"'"
%>
<%
  dim i,Teano,Sex,Teachtype
  'response.Write("按姓名查找的内容如下：")
  if isNumeric(Keyword) then
  sql="SELECT teano,teaname,sex,teachtype FROM dbo.tabteach where teano like '"&Teaname&"' order by teano" 

  else
  sql="SELECT teano,teaname,sex,teachtype FROM dbo.tabteach where teaname like '"&Teaname&"' order by teano" 
  end if
  Set rs1 = conn.execute(sql)
  i=0

  do while not rs1.eof 
  i=i+1
  Teano = rs1("teano")
  Teaname = rs1("teaname")
  Sex = rs1("sex")
  Teachtype = rs1("teachtype")

  response.Write("<tr><td>"&i&"</td><td>"&Teano&"</td><td>"&Teaname&"</td><td>"&Sex&"</td><td>"&Teachtype&"</td></tr>")
%>


<%
rs1.movenext
loop
%>