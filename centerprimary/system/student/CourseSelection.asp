<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/header.asp"-->


<%
Dim Courseid,Course_name,Course_type,Credit,Areano,Score,Tname,Sex_lt,cid,Tno
Dim mySQL1,mySQL2,str
  Courseid=Split(Request("xuanke"),",") 

Dim Time_segment,Term_time,T,Tcurrent
  sql="select time_segment,status,term_time from tbltime where status='n'"
  set myres=conn.execute(sql)
  if not myres.eof then
  Time_segment=myres("time_segment")
  Term_time=myres("term_time")
  end if 
  T=split(Time_segment,"-")
  Tcurrent=T(0)&T(1)&Term_time

  '取出所选课程的courseid集合中的每个课程课程编号，并到课程表中去查询，是否有该门课程，将课程的所有信息取出分存变量，课程名称、教师编号、学分。
  for each cid in Courseid 
  

mySQL1 ="select course_name,teano,course_type,credit,areano,sex_lt from tabcourse where courseid='"&trim(cid)&"'"

  set rs1=conn.execute(mySQL1)
  if not rs1.eof then
  Course_name = rs1("course_name")  
  Tno = rs1("teano")
  
  '按照课程号和用户账号，查询该门课程是否已经选过，如果未选就将新选的课程选到tabsel中。
mySQL="select * from tabsel where stuno='"&trim(userId)&"' and courseid='"&trim(cid)&"' "
 set myRes=conn.execute(mySQL)
 if  not myRes.eof or not myRes.bof then
 else
mySQL="insert into tabsel(stuno,courseid,teano,score,termtime) values('"&trim(userId)&"','"&trim(cid)&"','"&trim(Tno)&"','"&trim(Score)&"','"&trim(Tcurrent)&"')"
conn.execute(mySQL)

 end if 
 end if 
 sql2 = "select count(courseid) as cnum from dbo.tabsel where courseid='"&cid&"'"
 
  set rs2 = conn.execute(sql2)
  dim cnum 
  cnum = rs2("cnum")
  sql3 = "update dbo.tabcourse set current_num='"&cnum&"' where courseid='"&cid&"'"
  conn.execute(sql3)
 next
 %>
	<div class="container">
		<div >
		<img src="/static/img/banner.png">
		</div>
		<div class="header"></div>
		<div class="row">
			<div class="col-md-2">
				<ul class="nav nav-stacked sidebar" role="tablist">
					<li role="presentation"><a href="StudentIndex.asp">回到主页</a></li>
					<li role="presentation"><a href="CourseCulture.asp">课程文化</a></li>
					<li role="presentation"><a href="CoursePlan.asp">课程计划</a></li>
					<li role="presentation"><a href="CourseDisplay.asp">课程展示</a></li>
					<li role="presentation" class="selected">
						<a href="#myCollapse"  data-toggle="collapse">学生中心<span class="caret"></span></a>
						<div class="list-group collapse subMenu" id="myCollapse" >
							<a href="/Students/StudentCenter.asp#collapseOne" data-toggle="tab" class="list-group-item">我要报名</a>
							<a href="/Students/StudentCenter.asp#collapseTwo" data-toggle="tab" class="list-group-item">我的课程</a>
							<a href="/Students/StudentCenter.asp#collapseThree" data-toggle="tab" class="list-group-item">我的脚印</a>
							<a href="/Students/StudentCenter.asp#collapseFour" data-toggle="tab" class="list-group-item">我的设置</a>
						</div>					
					</li>
				</ul>
			</div>	
			<div>
				<p style="text-align:center;">完成选课<a  class="btn btn-sm btn-primary" href="StudentCenter.asp#collapseTwo">返回</a></p>
			</div>
		</div>
	</div>		
   <div class="footer">
     <div class="container" id="copyright">
       <p>copyright</p>
       
     </div>
   </div>	
</body>
</html>