<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加密码</title>
<!--#include virtual="/database/ConnDB.asp"-->

<%
 dim teano,teaname,teasex,teatel,teatype,teaintro,powertype

 teano=request.form("teano")
 teaname=request.form("teaname")
 teasex=request.form("teasex")
 teatel=request.form("teatel")
 teatype=request.form("teatype")
 teaintro=request.form("teaintro")
 powertype=request.form("powertype")

 sql1="insert into dbo.tabteach (teano,teaname,sex,mobile,teachtype,teaintro,powertype) values ('"&teano&"','"&teaname&"','"&teasex&"','"&teatel&"','"&teatype&"','"&teaintro&"','"&powertype&"')"
 conn.execute(sql1)

%>
  <script language="javascript">
           alert("教师添加成功"); 
           history.back();
         </script>