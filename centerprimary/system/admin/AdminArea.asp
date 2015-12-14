<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
dim name,func,brief,site
name=request.form("name")
func=request.form("type")
brief=request.form("brief")
site=request.form("site")
sql0="select max(id) as id from dbo.field"
set rs0=conn.execute(sql0)
'id=rs0("id")
'id=id+1
sql="insert into dbo.field (name,type,introduction,site) values ('"&name&"','"&func&"','"&brief&"','"&site&"')"
conn.execute(sql)
response.write("<tr><td>New</td><td>"&name&"</td><td>"&site&"</td><td>"&func&"</td><td>"&brief&"</td></tr>")
%>