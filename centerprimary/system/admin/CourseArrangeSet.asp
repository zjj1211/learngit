<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
Dim Time_segment,Term_time,T,Tcurrent
  sql="select time_segment,status,term_time from tbltime where status='n'"
  set myres=conn.execute(sql)
  if not myres.eof then
  Time_segment=myres("time_segment")
  Term_time=myres("term_time")
  end if 
  T=split(Time_segment,"-")
  Tcurrent=T(0)&T(1)&Term_time

dim result,courseid,sarray,teano,stuno,cstuno

courseid=trim(request.form("courseid"))
'courseid= "A020002-数学A,A020014-数学D,A020012-数学B,A000013-数学C,A020015-数学E,"
'result1=" 109010226,109010227,109010418,109010422,109010438,109010109,109010134,109010432,109010229,3101080001120090341,109010404,109010217,109010420,109010122,109010424,109010429,109010237,109010436,109010239,109010240,109010242,109010305,109010326,109010431,109010334,109010205,109010211,3101080001120090141,109010140,109010221,"
'result2 =" 109010108,109010136,109010215,109010236,109010129,109010415,109010238,109010222,109010127,109010105,109010427,109010111,109010307,109010322,109010324,109010235,109010102,109010123,109010330,109010216,109010338,109010132,109010406,109010433,109010219,109010113,109010201,109010329,109010106,109010304,"

'result3 =" 109010214,109010223,109010416,109010119,109010409,109010118,109010425,109010128,109010107,109010125,109010403,109010104,109010437,109010302,109010210,3101080001120090340,109010233,109010327,109010114,109010204,109010333,109010230,109010411,3101080001120090441,109010419,109010130,109010435,109010335,109010413,109010410,"

'result4 =" 109010303,109010220,109010402,109010117,109010115,109010116,109010135,109010133,109010313,109010407,109010317,109010337,109010439,109010209,109010101,109010139,3101080001120090243,109010241,109010131,3101080001120090440,109010208,109010314,109010138,109010414,109010213,109010417,109010336,109010203,109010232,109010228,"
'result5 =" 109010412,109010321,109010309,109010315,109010401,109010124,109010319,109010325,109010311,109010120,109010331,109010405,109010137,109010339,109010207,109010308,109010312,109010112,109010126,109010103,109010318,109010224,109010332,109010434,109010408,109010306,109010316,109010234,109010212,109010301,109010428,109010328,"

result1 = trim(request.form("result1"))
result2 = trim(request.form("result2"))
result3 = trim(request.form("result3"))
result4 = trim(request.form("result4"))
result5 = trim(request.form("result5"))
courseArray = split(courseid,",")
resultArray0 = split(result1,",")
resultArray1 = split(result2,",")
resultArray2 = split(result3,",")
resultArray3 = split(result4,",")
resultArray4 = split(result5,",")


for i=0 to ubound(courseArray)-1
	tcourseid = left(trim(courseArray(i)),7)
	sql0 = "select teano from dbo.tabcourse where courseid='"&tcourseid&"'"
	set rs0 = conn.execute(sql0)
	if not rs0.eof then
	teano = rs0("teano")
	end if
	call arr(i)	

	sql2 = "update dbo.tabcourse set current_num=(select count(courseid) from dbo.tabsel where courseid='"&courseid&"') where courseid='"&courseid&"'"
	conn.execute(sql2)
next	

function arr(e)
	select case e
		case 0 
			for j=0 to ubound(resultArray0)-1
			stuno = trim(resultArray0(j))
			sql1 = "insert into dbo.tabsel(courseid,stuno,teano,termtime) values('"&trim(tcourseid)&"','"&right(trim(stuno),6)&"','"&trim(teano)&"','"&Tcurrent&"')"
			conn.execute(sql1)
			'response.write("save 1st")
			next
		case 1 
			for j=0 to ubound(resultArray1)-1
			stuno = trim(resultArray1(j))
			sql1 = "insert into dbo.tabsel(courseid,stuno,teano,termtime) values('"&trim(tcourseid)&"','"&right(trim(stuno),7)&"','"&trim(teano)&"','"&Tcurrent&"')"
			conn.execute(sql1)
			'response.write("save 2nd")
			next
		case 2 
			for j=0 to ubound(resultArray2)-1
			stuno = trim(resultArray2(j))
			sql1 = "insert into dbo.tabsel(courseid,stuno,teano,termtime) values('"&trim(tcourseid)&"','"&right(trim(stuno),7)&"','"&trim(teano)&"','"&Tcurrent&"')"
			conn.execute(sql1)
			'response.write("save 3th")
			next
		case 3 
			for j=0 to ubound(resultArray3)-1
			stuno = trim(resultArray3(j))
			sql1 = "insert into dbo.tabsel(courseid,stuno,teano,termtime) values('"&trim(tcourseid)&"','"&right(trim(stuno),7)&"','"&trim(teano)&"','"&Tcurrent&"')"
			conn.execute(sql1)
			'response.write("save 4th")
			next
		case 4 
			for j=0 to ubound(resultArray4)-1
			stuno = trim(resultArray4(j))
			sql1 = "insert into dbo.tabsel(courseid,stuno,teano,termtime) values('"&trim(tcourseid)&"','"&right(trim(stuno),7)&"','"&trim(teano)&"','"&Tcurrent&"')"
			conn.execute(sql1)
			'response.write("save 5th")
			next
		case else 
			response.write("overflow")
	end select
end function								
'sarray=split(result,",")
'for each stuno in sarray
'cstuno=right(trim(stuno),7)
'sql1="insert into dbo.tabsel(courseid,stuno,teano,termtime) values('"&trim(courseid)&"','"&trim(cstuno)&"','"&trim(teano)&"','"&Tcurrent&"')"
'response.write(sql1)
'conn.execute(sql1)
'next

'sql2 = "update dbo.tabcourse set current_num=(select count(courseid) from dbo.tabsel where courseid='"&courseid&"') where courseid='"&courseid&"'"
'conn.execute(sql2)
%>