<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->

<%
session("utype") = ""
session("uName") = ""
session("userId") = ""
%>
<div>退出成功</div>
<%
response.redirect("../../index.asp")
%>