<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生密码修改处理</title>

<!--#include virtual="/database/ConnDB.asp"-->
<%
Dim uName1,uflag,userId,oldpass,newpass,newpass1
dim sql             'sql字符串
dim rs  
'server对象的createobject方法建立connection对象
uName1=session("uName")
uflag=session("utype")
userId=session("userId")

oldpass=Trim(Request.Form("opass"))
newpass=Trim(request.Form("npass")) 
newpass1=Trim(request.Form("npass1"))
 
session("oldpass")=oldpass
session("newpass")=newpass
session("newpass1")=newpass1

if newpass1<>newpass then%>
  <script language="javascript">
  alert("两次输入的密码不匹配"); 
  history.back();
  </script>
   <%
  response.End()
  end if
  sql="select * from dbo.tabstu where stuno='"&trim(userId)&"'and password='"&trim(oldpass)&"'"
 set rs=conn.Execute(sql)
 if rs.eof then %>
 <script language="javascript">
 alert("对不起，同学。你输入的原始密码错误，请查实<% response.write(sql) %>");
 history.back();
 </script>
<%
 response.End()
 end if
 sql="update dbo.tabstu set password='"&newpass&"' where stuno='"&userId&"'" 
 conn.execute(sql)
 %>
   <script language="javascript">
   alert("同学，你的密码已经成功修改，请牢记新密码"); 
   history.back();
   </script>
<%
 response.End()        
%>
<body>
    <td width="121" class="m1"><span class="m">学号</span>：<%=userId%></td>
     <td width="121" class="m1"><span class="m">原始密码</span>：<%=oldpass%></td>
      <td width="121" class="m1"><span class="m">新密码</span>：<%=newpass1%></td>



</body>
</html>
