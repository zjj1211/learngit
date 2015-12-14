<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
	dim table
	dim grade
	dim rep

	table = request.form("table")
	grade = request.form("grade")
	'table = "score201120121"
	'grade = "05"

on error resume next
  Set rs=Server.CreateObject("ADODB.Recordset")
  '设置rs的ActiveConnection属性，绑定到连接
  Set rs.ActiveConnection = Conn
  '设置游标类型
  rs.cursorType  =  1
rs.LockType  =  1
  rs.open "select * from dbo."&table&""
'response.write(err.number)
if not err.number=0 then
	response.write("数据不存在")
else
	dim distinction
	sql1 = "select distinct(testtype) as distinction from dbo."&table&" where classno like '"&grade&"%'"
	'response.write(sql)
	set rs1 = conn.execute(sql1)
	
		do while not rs1.eof
			distinction = rs1("distinction")
			rep = rep&distinction&" "
		rs1.movenext
		loop	
	response.write(rep)
end if
%>