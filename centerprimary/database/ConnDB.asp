<%
dim conn,connstr
set conn=server.CreateObject("ADODB.connection")
connstr="Provider=SQLOLEDB;Data Source=SAMSUNG;Initial Catalog=ZBYX;User ID=sa;Password=591610052" 
Conn.open connstr

Sub CloseDatabase() '关闭数据库对象
    Conn.close
    Set Conn = Nothing
    '错误提示！
	   if Err then
	   Response.write "<script language='javascript'>" & chr(13)
       Response.write "alert('系统错误提示：\r\n-----------------------------\r\n"& Err.description &"！\r\n-----------------------------\r\n   请按规定操作！或通知管理员 " & session("SYDWEmail") & " \r\n\r\n  << 自 动 返 回');"& Chr(13) 
       Response.write "window.document.location.href='javascript:history.back(-1);';"&Chr(13)
       Response.write "</script>" & Chr(13)
	   Err.clear
	   'On Err goto 0
	   Response.end
	   end if
End Sub
Public Function MsgShow(str,flag,url)   
'str：提示消息内容；flag：0：返回，标志1：跳转到URL，标志2：关闭窗口 标志3：用于显示  标志4： 刷新页面 标志5： 刷新父窗口 
	Response.write "<body bgcolor=#FFFFFF>"
	Response.write "<script language='javascript'>" & chr(13)
	Response.write "alert('"
	Response.write str
	Response.Write "');"& Chr(13)
	If Cint(flag)=1 then
	  Response.write "window.document.location.href='"
	  Response.Write url
	  Response.Write "';"&Chr(13)
	Elseif Cint(flag)=2 then
	    Response.write "window.close();"&Chr(13)
	Elseif Cint(flag)=0 then
	    Response.write "window.document.location.href='JavaScript:history.back();';"&Chr(13)
	Elseif Cint(flag)=4 then
	    Response.write "location.reload();"&Chr(13)
	Elseif Cint(flag)=5 then
	    Response.write "window.opener.document.location.reload();"&Chr(13)
	    Response.write "window.close();"&Chr(13)
	End IF
	Response.write "</script>" & Chr(13)
	Response.write " </body>"
End Function

function htmlencode22(str)'翻过来界行解释
    dim result
    dim l
    if isNULL(str) then 
       htmlencode22=""
       exit function
    end if
    str = Replace(str, "<Br>",chr(13))
	str = Replace(str, "<br>",chr(13))
	str = Replace(str, "&nbsp;"," ")
	str = Replace(str, "<BR>",chr(13))
	str = Replace(str, "</P><P>", CHR(10) & CHR(10))
	str = Replace(str, "&quot;",CHR(34))
	str = Replace(str, "&lt;",">")
	str = Replace(str, "&quot;",CHR(34))
	str = Replace(str, "&lt;","<")
       htmlencode22=str
   end function

function HTMLEncode(fString)
if not isnull(fString) then
    fString = replace(fString, ">", "&gt;")
    fString = replace(fString, "<", "&lt;")
    fString = Replace(fString, CHR(32), "&nbsp;")
    fString = Replace(fString, CHR(9), "&nbsp;")
    fString = Replace(fString, CHR(34), "&quot;")
    fString = Replace(fString, CHR(13), "<BR>")
    'fString = Replace(fString, CHR(10), "<BR>")
    fString=ChkBadWords(fString)
    HTMLEncode = fString
end if
end function


function ChkBadWords(fString)
    dim bwords,ii
    if not(isnull(BadWords) or isnull(fString)) then
    bwords = split(BadWords, "|")
    for ii = 0 to ubound(bwords)
        fString = Replace(fString, bwords(ii), string(len(bwords(ii)),"*")) 
    next
    ChkBadWords = fString
    end if
end function



 Function NULLToString(PreString)
       if isNULL(PreString) then
       NULLToString = ""
       else
       NULLToString = Trim(Cstr(PreString))
       End if       
      End Function

Function SafeRequest(ParaName,ParaType)'LGFUNCTION函数 防止并对一切ＳＱＬ注入攻击Say NO！
'--- 传入参数 ---
'ParaName:参数名称-字符型
'ParaType:参数类型-数字型(1表示以上参数是数字，0表示以上参数为字符)
Dim ParaValue,Temp_Client_IP,Temp_Reasons
ParaValue=Request(ParaName)
If ParaType=1 then
		 'if Trim(ParaValue) = "" or IsNULL(ParaValue) then
		 '  ParaValue = 0
		 'end if
	If Trim(ParaValue) <> "" and not IsNULL(ParaValue) and not isNumeric(ParaValue) then
		'在PopTitle.asp中定义了 Public Str_BR = "<BR>" 如果是漂亮提示，则回车换行！
		if Str_BR = "" or IsNull(Str_BR) then
		   Str_BR = Chr(13)
		end if
		
		   '-------写入日志结束------------------------------------------------
		Response.end
	End if
Else
           
			ParaValue=replace(ParaValue,"'","''")
			ParaValue=replace(ParaValue," ","&#32;")
			ParaValue=replace(ParaValue,">","&gt;")
			ParaValue=replace(ParaValue,"<","&lt;")
			ParaValue=replace(ParaValue,chr(9),"&nbsp;")
			ParaValue=replace(ParaValue,chr(39),"&#39;")
			ParaValue=replace(ParaValue,chr(34),"&#34;")

End if
SafeRequest=ParaValue
End function

%>

