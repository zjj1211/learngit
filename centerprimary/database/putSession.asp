<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户身份密码验证</title>
<%
Dim uName,uPwd,conn,uName1,uflag
'取获取的用户名和密码
uName=Request.Form("txtUserName")
uPwd=Request.Form("txtPwd")
'Session("txtUserName")=uName
'Session("txtPwd")=uPwd
'server对象的createobject方法建立connection对象
set conn=Server.CreateObject("ADODB.Connection") 
connstr="Provider=SQLOLEDB;Data Source=SAMSUNG;Initial Catalog=ZBYX;User ID=sa;Password=591610052" 
conn.Open connstr
'执行查询语句
'if conn.state=1 then
'response.Write("数据库成功打开")
'end if
'判断学生
 if len(uName)=6 then 
     sql="select * from dbo.tabstu where stuno='"&trim(uName)&"'and password='"&trim(uPwd)&"'"
        set rs = conn.execute(sql)
        if rs.eof then %>
	    <script language="javascript">
          alert("同学，你的用户名或密码错误，请重新输入"); 
           history.back();
        </script>
      <%
		else 
			 uName1=rs("name")
			 uflag="02"
			 session("userId")=uName
			 session("uName")=uName1
             session("utype")=uflag 
			 response.Redirect("../system/student/StudentCenter.asp")
	    end if 
'判断老师
  else  if len(uName)=3 then
	     sql="select * from dbo.tabteach where teano='"&trim(uName)&"'and tpassword='"&trim(uPwd)&"'"
            set rs=conn.execute(sql)
            if rs.eof then  
	       %>
	     <script language="javascript">
           alert("老师，您的用户名或密码错误，请重新输入"); 
           history.back();
         </script>
          <%
            else
	        uflag=rs("powertype")
	        uName1=rs("teaname")
		    session("userId")=uName
		    session("uName")=uName1
		        if uflag="1" then 
		          session("utype")=uflag 
	              response.Redirect("../system/admin/AdminIndex.asp") 
	            else if uflag="2" then 
		          session("utype")=uflag 
	              response.Redirect("../system/admin/AdminIndex.asp")
		        else if uflag="3" then 
				  session("utype")=uflag 
				  response.Redirect("../system/teacher/TeacherIndex.asp") 
                else if uflag="4" then
                  session("utype")=uflag 
				  response.Redirect("../system/teacher/TeacherIndex.asp")
				else 
                            %>
	                 <script language="javascript">
                     alert("对不起，您没有访问权限，请浏览本校其他相关介绍"); 
                     // history.back();
                     </script>
                            <%
				        end if  
		            end if 
		         end if
	           end if	 
            end if
	else
    %>
     <script language="javascript">
     alert("对不起，您没有访问权限，请浏览本校其他相关介绍"); 
          </script>
    <%
    	response.Redirect("StudentIndex.asp")	            
		end if


	end if	
%>
<style type="text/css">
body {
	background-image: url(image/20130409_084533.jpg);
}
</style>
</head>
<body>
</body>
</html>