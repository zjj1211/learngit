<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/header.asp"-->

	<div class="container">
	<div class="banner">
		<img src="/static/img/banner.png">
	</div>
	<div class="header"></div>
		<div class="row">
			<div class="col-md-2">
				<ul class="nav nav-pills nav-stacked sidebar" role="tablist">
					<li role="presentation"><a href="index.asp">回到主页</a></li>
					<li role="presentation"><a href="culture.asp">课程文化</a></li>
					<li role="presentation"><a href="plan.asp">课程计划</a></li>
					<li role="presentation" class="selected"><a href="diplay.asp">课程展示</a></li>
					<li role="presentation"><a href="/system/student/StudentCenter.asp">学生中心</a></li>
				</ul>
			</div>
			<div class="col-md-10">
				<table class="table table-bordered table-bg">
					<thead>
						<tr>
							<th class="col-md-2">课程号</th>
							<th class="col-md-2">课程名称</th>
							<th class="col-md-8">课程简介</th>
							<!-- <th class="col-md-3">课程图片</th> -->
						</tr>
					</thead>
					<tbody>
						<%
						dim courseName,courseNo,courseType,courseIntroduction,coursephoto2
						sql="select course_name,courseid,course_type,introduction,coursephoto2 from dbo.tabcourse"
						set rs=conn.execute(sql)
						
						do while not rs.eof
						courseName=rs("course_name")
						courseNo=rs("courseid")
						courseType=rs("course_type")
						courseIntroduction=rs("introduction")
						coursephoto2=rs("coursephoto2")
						%>
						<tr>
							
							<td><%=courseNo%></td>
							<td><a href="displaydetail.asp?courseid=<%=courseNo%>"><%=courseName%></a></td>
							<td class="alignLeft"><%=courseIntroduction%></td>
						</tr>
						<%
						rs.movenext
						loop
						%>
					</tbody>
				</table>

				
			</div>
		</div>
	</div>	
<!--#include virtual="/system/common/footer.asp"-->