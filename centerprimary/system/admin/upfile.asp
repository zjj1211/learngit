<%OPTION EXPLICIT%>
<%Server.ScriptTimeOut=5000%>
<!--#include FILE="upload_5xsoft.inc"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>文件上传</title>
</head>
<body>
<br>图片上传!<hr size=1 noshadow width=300 align=left><br><br>
<%
dim upload,file,formName,formPath,iCount
set upload=new upload_5xsoft
 ''建立上传对象
response.write upload.Version&"<br><br>"  ''显示上传类的版本
'指定文件路径
formPath="D:\Projects\photo\"

iCount=0
for each formName in upload.objForm ''列出所有form数据
 response.write formName&"="&upload.form(formName)&"<br>"
next

response.write "<br>"
for each formName in upload.objFile ''列出所有上传了的文件
 set file=upload.file(formName)  ''生成一个文件对象
 if file.FileSize>0 then         ''如果 FileSize > 0 说明有文件数据
  'file.SaveAs Server.mappath(formPath&file.FileName)   ''保存文件
  file.SaveAs formPath&file.FileName
  response.write file.FilePath&file.FileName&" ("&file.FileSize&") => "&formPath&File.FileName&" 成功!<br>"
  iCount=iCount+1
 end if
 set file=nothing
next

set upload=nothing  ''删除此对象
Htmend iCount&" 个文件上传结束!"

sub HtmEnd(Msg)
 set upload=nothing
 response.write "<br>"&Msg&" [<a href=""javascript:history.back();"">返回</a>]</body></html>"
 response.end
end sub
%>
</body>
</html>
