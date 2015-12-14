<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/header.asp"-->

<% 
if uflag<>02 then
response.redirect("/login.asp")
end if
 dim rs
 Set rs=Server.CreateObject("ADODB.Recordset")
  '设置rs的ActiveConnection属性，绑定到连接
  Set rs.ActiveConnection = Conn
  '设置游标类型
  rs.CursorType = 3
  '打开记录集
  rs.Open "SELECT stuno_sh,stuno,name,sex,classname,stu_status_time FROM dbo.tabstu where stuno='"&userId&"'"
%>
<%
Dim Stuno_sh,Stuno,Stuname,Stusex,Classname,stu_status_time
if not rs.eof then
Stuno_sh=rs("stuno_sh")
Stuno = rs("stuno")
Stuname = rs("name")
Stusex = rs("sex")
Classname = rs("classname")
stu_status_time = rs("stu_status_time")
end if
%>
 	<div class="container">
		<div class="banner">
		<img src="/static/img/banner.png">
		</div>
		<div class="header"></div>
		<div class="row">
			<div class="col-md-2">
				<ul class="nav nav-stacked sidebar" role="tablist">
					<li role="presentation"><a href="../../index.asp">回到主页</a></li>
					<li role="presentation"><a href="../../culture.asp">课程文化</a></li>
					<li role="presentation"><a href="../../plan.asp">课程计划</a></li>
					<li role="presentation"><a href="../../display.asp">课程展示</a></li>
					<li role="presentation" class="selected">
						<a href="#myCollapse"  data-toggle="collapse">学生中心<span class="caret"></span></a>
						<div class="list-group collapse subMenu" id="myCollapse" >
							<a href="#collapseOne" data-toggle="tab" class="list-group-item">我要报名</a>
							<a href="#collapseTwo" data-toggle="tab" class="list-group-item">我的课程</a>
							<a href="#collapseThree" data-toggle="tab" class="list-group-item">我的脚印</a>
							<a href="#collapseFour" data-toggle="tab" class="list-group-item">我的设置</a>
						</div>					
					</li>
				</ul>
			</div>
			<div class="col-md-10">
				<div class="panel panel-default">
					<!-- <div class="panel-heading">
						<h5>title</h5>
					</div> -->
					<div class="panel-body"></div>
					<table class="table">
						<thead>
							<tr>
								<td>学籍号</td>
								<td>姓名</td>
								<td>性别</td>
								<td>学号</td>
								<td>班级</td>								
								<td>入学时间</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=Stuno_sh%></td>
								<td><%=Stuname%></td>
								<td><%=Stusex%></td>
								<td><%=Stuno%></td>
								<td><%=Classname%></td>								
								<td><%=stu_status_time%></td>
							</tr>
						</tbody>
					</table>
					<div class="tab-content">
						<div id="collapseOne" class="panel-body tab-pane">
						<%
							sql0 = "select opentime,closetime from dbo.TermCompare where year like (select time_segment from dbo.tbltime where status='n')"
							set rs00 = conn.execute(sql0)
							opentime = rs00("opentime")
							closetime = rs00("closetime")
							'opentime = replace(opentime,"-","")
							'closetime = replace(closetime,"-","")
							Private Function FormatDate(strDate) 
								Dim strOut 
								Dim strDay 
								Dim strMonth 
								Dim strYear 
								Dim strHour 
								Dim strMinute 
								Dim strSecond 
								strDay = Right(CStr("00" & Day(strDate)),2) 
								strMonth = Right(CStr("00" & Month(strDate)),2) 
								strYear = Right(CStr("2000" & Year(strDate)),4) 
								strOut = strYear & "-" & strMonth & "-" & strDay
								FormatDate = strOut 
							End Function

							nowdate = FormatDate(date())
							'response.write(nowdate)
							if nowdate>=opentime and nowdate<=closetime then
						%>
							<form method="post" action="CourseSelection.asp" class="form">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>课程编号</th>
											<th>课程名称</th>
											<th>教师姓名</th>
											<th>课程类型</th>
											<th>课时</th>
											<th>课程周数</th>
											<th>上课时间</th>
											<th>上课地点</th>
											<th>性别限制</th>
											
											<th>已选</th>
											<th>选课</th>
										</tr>
									</thead>
									<tbody>
									<%
									Dim Course_name_all,Course_type_all,Credit_all,Areano_all,Score_all,Tname_all,Sex_lt_all,Class_2
									Dim mySQL1,mySQL2,mySQL3
									Class_2=left(Classname,2)

									mySQL1 ="select * from tabcourse where (course_type<>'A' and grade in (select gradeno from dbo.tblgrade where gradename like '%"&Class_2&"%'))"
									set rs1=conn.execute(mySQL1)
									if not rs1.eof then
									do while not rs1.eof
									Courseid_all=rs1("courseid")
									Course_name_all = rs1("course_name")
									Course_type_all = rs1("course_type")
									Coursehour_all = rs1("coursehour")
									Areano_all = rs1("areano")
									Teano_all = rs1("teano")
									Sex_lt_all = rs1("sex_lt")
									'Select_lt_all=rs1("select_lt")
									mySQL2 ="select teaname from tabteach where teano='"&Teano_all&"'"
									set rs2=conn.execute(mySQL2)
									if not rs2.eof then
									Tname_all = rs2("teaname")
									end if
									mySQL3="select count(stuno) as countNum  from dbo.tabsel where courseid='"&Courseid_all&"'"
									set rs3=conn.execute(mySQL3)

									sql3 = "select stucount from dbo.tabcourse where courseid='"&Courseid_all&"'"
									set rs4=conn.execute(sql3)
									if not rs3.eof then
									dim countNum,limitnum
									countNum=rs3("countNum")
									limitnum = rs4("stucount")
									
									end if

									'if Areano_all=1 then
									'Areano_all="教室"
									 'else if Areano_all=2 then
									 'Areano_all="操场"
									  '' else if Areano_all=3 then 
									   'Areano_all="多功能厅"
								        'end if
									 'end if 
								    'end if 

								    mySQL4 = "select coursetime,courseweeknum,courseweekday from tabcourse where courseid='"&Courseid_all&"'"
								    set rs5 = conn.execute(mySQL4)
								    if not rs5.eof then
								    ctime = rs5("coursetime")
								    cweek = rs5("courseweeknum")
								    cweekday = rs5("courseweekday")
								    end if
								    select case cweekday
								    	case "Monday"
								    		cweekday = "周一"
								    	case "Tuesday"
								    		cweekday = "周二"
								    	case "Wednesday"
								    		cweekday = "周三"
								    	case "Thursday"
								    		cweekday = "周四"
								    	case "Friday"
								    		cweekday = "周五"
								    end select						
									%>
										<tr class="item">
											<td><%=Courseid_all%></td>
											<td><%=Course_name_all%></td>
											<td><%=Tname_all%></td>
											<td><%=Course_type_all%></td>
											<td><%=Coursehour_all%></td>
											<td><%=cweek%></td>
											<td><%=cweekday%>&nbsp;<%=ctime%></td>
											<td><%=Areano_all%></td>
											<td><%=Sex_lt_all%></td>
											<!-- <td><%=Select_lt_all%></td> -->
											<!-- <td><button class="btn btn-xs btn-info">选课</button></td> -->
											<td class="countNum"><%=countNum%>/<%=limitnum%></td>
										
											<td><input id="<%=Courseid_all%>" name="xuanke" type="checkbox" value="<%=Courseid_all%>"></td>
										</tr>
										<%
										if (countNum >= limitnum or (Stusex<>Sex_lt_all and Sex_lt_all<>"无")) then
										%>
										<script type="text/javascript">
										$('#<%=Courseid_all%>').attr('disabled',true);
										</script>
										<%
										end if
										rs1.movenext
										loop
										end if
										%>
									</tbody>
								</table>
								<button class="btn btn-success pull-right" type="submit" name="but_select" id="but_select">提交</button>
							</form>
							<%
								else
							%>	
							<h3 style="text-align:center;">选课未开始</h3>	
							<%
							end if
							%>					
						</div>

						<div id="collapseTwo" class="panel-body tab-pane">
							<div><p>本学期学习的课程<a href="javascript:;" onclick="javascript:createContent();LODOP.PREVIEW();"><span class="glyphicon glyphicon-print pull-right" style="font-size:22px;"></span></a></p></div>
							<div id="termTable">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>课程号</th>
											<th>课程名称</th>
											<th>课时</th>
											<th>上课时间</th>
											<th>地点</th>
										</tr>
									</thead>
									<tbody>

										<%

										dim termyear,tcourseid,tcoursename,tcoursetype,tdistinction
										termyear = left(Tcurrent,8)
										sql1 = "select distinct (substring(courseid,1,1)) as distinction from dbo.tabsel where (termtime like '"&termyear&"%' and stuno='"&userId&"')"
										set rs1 = conn.execute(sql1)
										if not rs1.eof then
											do while not rs1.eof
											tdistinction = rs1("distinction")
											tdescribe = tdistinction
											select case tdistinction
												case "A" tdescribe = "跑班"
												case "B" tdescribe = "普及型拓展课程"
												case "C" tdescribe = "社团"
												case else tdescribe = "其它"
											end select	
												%>
												<tr><td colspan="5" class="danger"><%=tdescribe%>类</td></tr>	
												<%											
												sql2 = "select courseid from dbo.tabsel where (termtime like '"&termyear&"%' and stuno='"&userId&"' and courseid like '"&tdistinction&"%')"
												set rs2 = conn.execute(sql2)
												if not rs2.eof then
												do while not rs2.eof
												
												tcourseid = rs2("courseid")
												sql3 = "select course_name,coursehour,courseweekday,areano,coursetime from dbo.tabcourse where courseid='"&tcourseid&"'"
												set rs3 = conn.execute(sql3)
												tcoursename = rs3("course_name")
												tcoursehour = rs3("coursehour")
												tcourseweekday = rs3("courseweekday")
												tcoursetime = rs3("coursetime")
												tareano = rs3("areano")
											    select case tcourseweekday
											    	case "Monday"
											    		tcourseweekday = "周一"
											    	case "Tuesday"
											    		tcourseweekday = "周二"
											    	case "Wednesday"
											    		tcourseweekday = "周三"
											    	case "Thursday"
											    		tcourseweekday = "周四"
											    	case "Friday"
											    		tcourseweekday = "周五"
											    end select												
												%>
												<tr>
													<td><%=tcourseid%></td>
													<td><%=tcoursename%></td>
													<td><%=tcoursehour%></td>
													<td><%=tcourseweekday%><%=tcoursetime%></td>
													<td><%=tareano%></td>
												</tr>
												<%
												rs2.movenext
												loop
												end if

											rs1.movenext
											loop
										end if 

										%>
									</tbody>
								</table>								
							</div>

						</div>

						
						<div id="collapseThree" class="panel-body tab-pane">
							<div><a href="PrintTable.asp" target="_blank"><span class="glyphicon glyphicon-print pull-right" style="font-size:22px;"></span></a></div>
							<ul class="timeline">

							<%
							dim distinction,academy1,academy2,terms
							mySQL0="select distinct (substring(termtime,1,9)) as distinction from dbo.tabsel where stuno = '"&userId&"'"
							set rs0 = conn.execute(mySQL0)
							if not rs0.eof then
								do while not rs0.eof
									distinction = rs0("distinction")
									academy1 = mid(distinction,1,4)
									academy2 = mid(distinction,5,4)
									terms = mid(distinction,9,1)
							%>
									<li>
										<div class="time"><%=academy1%>-<%=academy2%></div>
										<div class="version">学期<%=terms%></div>
										<div class="number"></div>
										<div class="content">
											<pre>
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>课程编号</th>
															<th>课程名称</th>
															<th>课程类型</th>
															<!-- <th>课程学分</th> -->
															<!-- <th>上课地点</th> -->
															<th>教师姓名</th>
															<th>成绩</th>
														</tr>
													</thead>
													<tbody>
														<%
														Dim Courseid,Course_name,Course_type,Credit,Areano,Teano,Score,mySQL
														mySQL ="SELECT courseid,teano,score FROM tabsel WHERE (stuno = '"&userId&"' and termtime like '"&distinction&"%') order by termtime"
														Set rs = conn.execute(mySQL)
														if not rs.eof then
														do while not rs.eof
														Courseid = rs("courseid")
														Teano = rs("teano")
														Score = rs("score")
														
														mySQL1 ="select course_name,course_type,credit,areano from tabcourse where courseid='"&Courseid&"'"
														set rs1=conn.execute(mySQL1)
														if not rs1.eof then
														Course_name = rs1("course_name")
														Course_type = rs1("course_type")
														Credit = rs1("credit")
														Areano = rs1("areano")
														end if
														mySQL2 ="select teaname from tabteach where teano='"&Teano&"'"
														set rs2=conn.execute(mySQL2)
														if not rs2.eof then
														Tname = rs2("teaname")
														end if

														'if Areano=1 then
														'Areano="教室"
														 'else if Areano=2 then
														 'Areano="操场"
														  '' else if Areano=3 then 
														   'Areano="多功能厅"
														    ''    end if
															'end if 
														  'end if 						
														%>						
														<tr>
															<td><%=Courseid%></td>
															<td><%=Course_name%></td>
															<td><%=Course_type%></td>
															<!-- <td><%=Credit%></td> -->
															<!-- <td><%=Areano%></td> -->
															<td><%=Tname%></td>
															<td><%=Score%></td>
														</tr>
														<%
														rs.movenext
														loop
														end if
														%>														
													</tbody>
												</table>
											</pre>
										</div>
									</li>						
									<%		
									rs0.movenext
									loop
									end if 
									%>

							</ul>
						</div>
						<div id="collapseFour" class="panel-body tab-pane">
							<form class="form-horizontal" role="form" method="post" action="student_update_pass1.asp" id="form2" name="form2">
								<div class="form-group">
									<label class="col-sm-2 control-label">原密码</label>
									<div class="col-sm-3">
										<input type="password" class="form-control input-sm" name="opass">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">新密码</label>
									<div class="col-sm-3">
										<input type="password" class="form-control input-sm" name="npass">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">新密码</label>
									<div class="col-sm-3">
										<input type="password" class="form-control input-sm" name="npass1">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-3">
										<button class="btn btn-primary btn-sm" type="submit">提交</button>&nbsp;&nbsp;<a href="/system/common/help.asp">忘记密码？</a>
									</div>
									
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</div>
<!--#include virtual="/system/common/footer.asp"-->