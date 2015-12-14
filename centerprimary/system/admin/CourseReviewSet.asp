<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
dim id,checkflag,reason
id=request.form("id")
reason=request.form("reason")
'id=6
'checkflag=2
checkflag=request.form("checkflag")
sql="update dbo.tabkcsb set checkflag="&checkflag&",reason='"&reason&"' where id="&id&""
response.write(1)
conn.execute(sql)

dim insertid,judgeCourse,modifyTime
sql2="select id from dbo.tabcourse where courseid=(select courseid from dbo.tabkcsb where id="&id&")"
response.write(2)
set rs2 = conn.execute(sql2)
if not (rs2.bof and rs2.eof) then
judgeCourse=rs2("id")
sql1="delete from dbo.tabcourse where id='"&judgeCourse&"'"
response.write(3)
conn.execute(sql1)
end if


if checkflag=2 then
sql3="select count(id) from dbo.tabcourse"
response.write(4)
set rs=conn.execute(sql3)
insertid=rs.Fields(0)+1

modifyTime=now()
sql4="insert into dbo.tabcourse (id,courseid,course_name,course_type,coursetimetype,courseweeknum,grade,coursetime,coursehour,stucount,teano,credit,areano,sex_lt,facility,destination,substance,courseplan,current_num,modifytime) select "&insertid&",courseid,course_name,course_type,enrolmode,courseweeknum,grade,coursetime,coursehour,stucount,teano,credit,areano,sex_lt,facility,destination,substance,courseplan,0,modifyTime from dbo.tabkcsb where id="&id&""
response.write(5)
conn.execute(sql4)
end if

%>