<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/database/ConnDB.asp"-->
<script src="../third-party/jquery.min.js"></script>
<script src="../third-party/mathquill/mathquill.min.js"></script>
<link rel="stylesheet" href="../third-party/mathquill/mathquill.css"/>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<%
	Dim content,courseid
	content = Request.Form("content")
	courseid = Request.Form("courseid")
	'Response.Write("<div class='content'>" + content + "</div>")
	sql = "update dbo.tabcourse set introduction='"&content&"' where courseid='"&courseid&"'"
	conn.execute(sql)
%>