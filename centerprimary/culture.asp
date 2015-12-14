<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/header.asp"-->
	<div class="banner container">
		<img src="/static/img/banner.png">
	</div>
	<div class="container">

		<div class="header"></div>
		<div class="row">
			<div class="col-md-2">
				<ul class="nav nav-stacked sidebar" role="tablist">
					<li role="presentation"><a href="index.asp">回到主页</a></li>
					<li role="presentation" class="selected"><a href="#">课程文化</a></li>
					<li role="presentation"><a href="plan.asp">课程计划</a></li>
					<li role="presentation"><a href="display.asp">课程展示</a></li>
					<li role="presentation"><a href="/system/student/StudentCenter.asp">学生中心</a></li>
				</ul>
			</div>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h5>课程文章</h5>
					</div>
					<div class="panel-body">
						<ul class="noticeDisplay">
	                        <%
							dim rs1,title1,posttime1
							sql1="select top 5 Id,Title,PostTime from dbo.article order by Id desc"
							set rs1=conn.execute(sql1)
							do while not rs1.eof
							id = rs1("Id")
							title1=rs1("Title")
							posttime1=rs1("PostTime")
							%>						
	                        <li><a href="culturedetail.asp?table=article&id=<%=id%>"><%=title1%></a><p class="date"><%=posttime1%></p></li>
	                        <%
	                        rs1.movenext
	                        loop
	                        %>
	                    </ul>
					</div>
				</div>
			</div>			
		</div>
	</div>
<!--#include virtual="/system/common/footer.asp"-->