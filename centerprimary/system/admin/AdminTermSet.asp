<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->

<%
dim distinction
distinction = request.form("distinction")
if distinction = "0" then
dim schoolyear,term1,term2
schoolyear=trim(request.form("termyear"))
term1=request.form("term1")
term2=request.form("term2")

dim term1start,term1end,term2start,term2end,termarray1,termarray2
termarray1=split(term1,"~")
termarray2=split(term2,"~")
term1start=termarray1(0)
term1end=termarray1(1)
term2start=termarray2(0)
term2end=termarray2(1)

'20150912添加功能验证 
sql0="select * from TermCompare where year='"&schoolyear&"'"
set rs=conn.execute(sql0)

response.write(term1start)
response.write(term1end)
'如果没有新学年则添加
'新学年和学期
if rs.eof then
sql1="update dbo.TermCompare set CurrentTerm=0"
sql2="insert into dbo.TermCompare (year,Term1Start,Term1End,Term2Start,Term2End,CurrentTerm) values ('"&schoolyear&"','"&term1start&"','"&term1end&"','"&term2start&"','"&term2end&"',1)"
conn.execute(sql1)
conn.execute(sql2)
response.write(sql1)
response.write(sql2)
else 
'否则只更新当前学期
sql3="update dbo.TermCompare set CurrentTerm=0"
sql4="update dbo.TermCompare set Term1Start='"&term1start&"',Term1End='"&term1end&"',Term2Start='"&term2start&"',Term2End='"&term2end&"',CurrentTerm='1' where year='"&schoolyear&"'"
conn.execute(sql3)
conn.execute(sql4)
response.write(sql3)
response.write(sql4)

end if

else if distinction = "1" then
dim opentime
opentime = request.form("selecttime")
selecttime = split(opentime,"~")
sql3 = "select time_segment from dbo.tbltime where status='n'"
set rs3 = conn.execute(sql3)
yearseg = rs3("time_segment")
sql4 = "update dbo.TermCompare set opentime='"&selecttime(0)&"',closetime='"&selecttime(1)&"' where year like '%"&yearseg&"%'"
conn.execute(sql4)
end if
end if
%>