<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->

<%
dim originPwd,newPwd,newConfirmPwd
userId=session("userId")
originPwd = request.form("originPwd")
newPwd = request.form("newPwd")
sql0 = "select tpassword from dbo.tabteach where teano='"&userId&"'"
set rs0 = conn.execute(sql0)
dim tpwd
tpwd = trim(rs0("tpassword"))
if originPwd = tpwd then
sql = "update dbo.tabteach set tpassword='"&newPwd&"' where teano='"&userId&"'"
conn.execute(sql)
response.write("修改成功！")
else
response.write("原密码不匹配！")
end if
%>