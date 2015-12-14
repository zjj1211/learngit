<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
dim teano
teano = trim(request.form("teano"))
sql = "select * from dbo.tabteach where teano='"&teano&"'"
set rs = conn.execute(sql)

teaname = rs("teaname")
gender = rs("sex")
mobile = rs("mobile")
teaintro = rs("teaintro")
teaimg = rs("teaimg")

response.write()
%>