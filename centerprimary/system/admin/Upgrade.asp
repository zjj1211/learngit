<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->
<%
Dim Classno,Classname,Sex,Sname,Gradtime,Grade,Classnu,SQL

'删除5年级的学生再升级
mySQL0 ="delete from tabstu where classno like '05%'"
conn.execute(mySQL0)

mySQL="select * from tabstu"
Set rs = conn.execute(mySQL)

do while not rs.eof
Classno= rs("classno")
Stuno = rs("stuno")
Sex=rs("sex")
Sname=rs("name")
Classname=rs("classname")
Gradtime=rs("gradtime")

'升级班号
if left(Classno,2)="01" then
 Classno="02"&trim(right(Classno,2))
 else if left(Classno,2)="02" then
   Classno="03"&trim(right(Classno,2))
   else if left(Classno,2)="03" then
      Classno="04"&trim(right(Classno,2))
	 else if left(Classno,2)="04" then
        Classno="05"&trim(right(Classno,2))
		 else if left(Classno,2)="05" then
           Classno="06"&trim(right(Classno,2))
		   end if
		 end if 
	   end if
     end if
end if

'升级班名
if left(Classno,2)="01" then
    Grade="小一"
	else if left(Classno,2)="02" then
       Grade="小二"
	    else if left(Classno,2)="03" then
          Grade="小三"
		  else if left(Classno,2)="04" then
            Grade="小四"
			 else if left(Classno,2)="05" then
               Grade="小五"
			   end if
		     end if
		end if
	end if
end if
if trim(right(Classno,2))="01" then
    Classnu="(1)班"
	else if trim(right(Classno,2))="02" then
       Classnu="(2)班"
	    else if trim(right(Classno,2))="03" then
          Classnu="(3)班"
		  else if trim(right(Classno,2))="04" then
            Classnu="(4)班"
			 else if trim(right(Classno,2))="05" then
               Classnu="(5)班"
			   end if
		     end if
		end if
	end if
end if
Classname=Grade&Classnu
'更新本学期新数据
mySQL1 ="update tabstu Set classno='"&Classno&"',classname='"&Classname&"' where stuno='"&Stuno&"'"
set rs1=conn.execute(mySQL1)

rs.movenext
loop
%>