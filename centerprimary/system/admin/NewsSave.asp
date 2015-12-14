<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->

<%

table=request.form("table")
title=request.form("title")
content=request.form("content")
newsid=CInt(request.form("newsid"))
postdate = FormatDate(now())

if newsid <> "" then
	if newsid = 0 then
		sql = "insert into "&table&" (Title,Content,PostTime) values ('"&title&"','"&content&"','"&postdate&"')"
	else
		sql = "update "&table&" set Title='"&title&"',Content='"&content&"',PostTime='"&postdate&"' where Id="&newsid&""
	end if

	'response.write(sql)
	conn.execute(sql)
else
response.write("failed")
end if

Private Function FormatDate(strDate) 
Dim strOut 
Dim strDay 
Dim strMonth 
Dim strYear 

strDay = Right(CStr("00" & Day(strDate)),2) 
strMonth = Right(CStr("00" & Month(strDate)),2) 
strYear = Right(CStr("2000" & Year(strDate)),4) 

strOut = strYear & "-" & strMonth & "-" & strDay
FormatDate = strOut 
End Function 

%>