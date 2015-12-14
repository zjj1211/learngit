<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->

<%
courseid = session("courseid")
stuno = request.form("stuno")
score = request.form("score")

sql = "update tabsel set score='"&score&"' where stuno='"&stuno&"' and courseid='"&courseid&"'"
conn.execute(sql)
%>