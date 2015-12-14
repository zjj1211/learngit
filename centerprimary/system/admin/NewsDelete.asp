<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
dim id,table
table=request.form("table")
id=request.form("id")
sql="delete from "&table&" where Id="&id&""
response.write(sql)
conn.execute(sql)
%>