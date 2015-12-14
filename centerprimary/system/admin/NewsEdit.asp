<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
dim id,rs,table
table=request.form("table")
id=request.form("id")
sql="select Title,Content,Poster from "&table&" where Id="&id&""
set rs=conn.execute(sql)
dim title,content,poster
title=rs("Title")
content=rs("Content")
poster=rs("Poster")

response.write("<form role='form' class='form-horizontal'><div class='form-group'><label class='control-label col-sm-2'>新闻标题</label><div class='col-sm-4'><input type='text' class='form-control' value="&title&" name='retitle'></div></div><div class='form-group'><label class='control-label col-sm-2'>详细内容</label><div class='col-sm-10'><textarea class='form-control' rows='5' name='recontent'>"&content&"</textarea></div></div><div class='form-group'><label class='control-label col-sm-2'>发布者</label><div class='col-sm-4'><input type='text' class='form-control' value="&poster&" name='reposter'></div></div></form>")
%>



