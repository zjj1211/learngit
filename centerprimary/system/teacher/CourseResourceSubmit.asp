<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html">
        <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
        <link rel="icon" href="">
        <title>选课系统</title>
        <body>
        	

<%
session("tjcs")=session("tjcs")+1
Dim TotalCount,sum
sum="0000"
if session("tjzc")>2 then
str="对不起,同一内容请勿多次提交!谢谢合作"
url="kcsb.asp"
MsgShow str,"1",url   
'str：提示消息内容；flag：0：返回，标志1：跳转到URL，标志2：关闭窗口 标志3：用于显示  标志4： 刷新页面 标志5： 刷新父窗口 
else
	jsbh=replace(trim(request.form("jsbh")),"'","")
	'先把字符中的单引号替换成空
	jsbh=replace(jsbh," ","")
	'再把字符中的单个空格替换成空
	jsbh=replace(jsbh,"　","")
	'再把字符中的多个空格替换成空
	jsxm=replace(trim(request.form("jsxm")),"'","")
	jsxm=replace(jsxm," ","")
	jsxm=replace(jsxm,"　","")

    uName=session("uName")
    userId=session("userId")
    if uName <> jsxm or userId <> jsbh then
    Response.Write("用户信息有误")
    else

	
	kclx=request.form("kclx")
	zsfs=request.form("zsfs")
	skzs=request.form("skzs")
	'sksj1=request.form("sksj1")
	'sksj2=request.form("sksj2")
	'sksj3=request.form("sksj3")
	'sksj4=request.form("sksj4")

	
	mxnj=request.Form("mxnj")
	dim final
	final = 0
	arr = split(mxnj,",")
	for i=0 to ubound(arr)
		final = final + arr(i)
	next
	select case final
		case 3
			mxnj = 06
		case 6
			mxnj = 07
		case 12
			mxnj = 08
		case 21
			mxnj = 09
		case 7
			mxnj = 10
		case 14
			mxnj = 11
		case 25
			mxnj = 12
		case 15
			mxnj = 13
		case 27
			mxnj = 14
		case 28
			mxnj = 15						
		case 1
		case 2
		case 4
		case 8
		case 13
			mxnj = 0&final
		case else
			mxnj = 0	
	end select		
				

	kcmc=request.form("kcmc")
	zxss=request.form("zxss")
	kcxf=request.form("kcxf")
	xzxb=request.form("xzxb")
	xzrs=request.form("xzrs")
	cjxz=request.form("cjxz")
	'skdd=request.form("skdd")
	
	
	
	sxsb=HTMLEncode(request.form("sxsb"))
	jxmb=HTMLEncode(request.form("jxmb"))
	nrzy=HTMLEncode(request.form("nrzy"))
	ssjh=HTMLEncode(request.form("ssjh"))
	
	 'If xzrs = "" or IsNULL(xzrs) or (not isNumeric(xzrs)) then
	'	Response.Write "<script language=javascript>alert(' 限制人数必须为数字格式！\n\n系统将自动返回前一页面...');history.back();'</'script>"
	'	Response.End
	 'end if
	
     
     set RS=Server.CreateObject("ADODB.RecordSet")
	 sql_kcsb="select * from tabkcsb"
	 RS.open sql_kcsb,conn,1,3
	  TotalCount=RS.Recordcount
	  RS.addnew
	  RS("id")=TotalCount+1
	  RS("teano")=jsbh
	  RS("teaname")=jsxm
	  RS("course_type")=kclx
	  RS("enrolmode")=zsfs
	  RS("courseweeknum")=skzs
	  'RS("coursetime")=sksj1&chr(58)&sksj2&chr(45)&sksj3&chr(58)&sksj4
	  RS("grade")=mxnj
	  RS("course_name")=kcmc
	  TotalCount=TotalCount+1
	  RS("coursehour")=zxss
	  RS("credit")=kcxf
	  RS("sex_lt")=xzxb
	  RS("stucount")=xzrs
	  RS("select_lt")=cjxz
	  'RS("areano")=skdd
	  
	 RS("facility")=sxsb
	 RS("destination")=jxmb
	 RS("substance")=nrzy
	 RS("courseplan")=ssjh
	 RS("modifytime")=Now()
	 RS("checkflag")="0"
	 if TotalCount<10 then 
	 sum="000"&TotalCount
	   else if TotalCount<100 then
	    sum="00"&TotalCount
		  else if TotalCount<1000 then
		    sum="0"&TotalCount
			end if 
			end if
			end if 
 	dim courseid
 	courseid = request.querystring("courseid")
 	if courseid <> "" then
 		RS("courseid") = courseid
 	else	
		RS("courseid")=kclx&mxnj&sum
	end if 
	'-------------------------------
	  RS.Update
	 Conn.Close
	if Conn.State=0 then 
	end if
	set Conn=nothing
    str="您所填写信息已经成功提交!"
    url="CourseReview.asp"
    MsgShow str,"1",url   
'str：提示消息内容；flag：0：返回，标志1：跳转到URL，标志2：关闭窗口 标志3：用于显示  标志4： 刷新页面 标志5： 刷新父窗口 
end if
end if
%>
        </body>
    </html>