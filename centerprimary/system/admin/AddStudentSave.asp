<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加密码</title>
<!--#include virtual="/database/ConnDB.asp"-->


<%
 dim stuno_sh,stuno,name,sex,classno,classname,starttime,endtime,password,pstatus

 stuno_sh=request.form("stuno_sh")
 stuno=request.form("stuno")
 name=request.form("name")
 sex=request.form("sex")
 classno=request.form("classno")
 classname=request.form("classname")
 starttime=request.form("starttime")
 endtime=request.form("endtime")
 password=request.form("password")
 
 '默认在读状态
 pstatus="a"

 sql="insert into dbo.tabstu (stuno_sh,stuno,name,sex,classno,classname,stu_status_time,gradtime,password,status) values ('"&stuno_sh&"','"&stuno&"','"&name&"','"&sex&"','"&classno&"','"&classname&"','"&starttime&"','"&endtime&"','"&password&"','"&pstatus&"')"
 conn.execute(sql)

%>
  <script language="javascript">
           alert("学生添加成功"); 
           history.back();
         </script>