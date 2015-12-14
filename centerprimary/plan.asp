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
					<li role="presentation" class="selected"><a href="plan.asp">课程计划</a></li>
					<li role="presentation"><a href="display.asp">课程展示</a></li>
					<li role="presentation"><a href="/system/student/StudentCenter.asp">学生中心</a></li>
				</ul>
			</div>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h5>课程变动</h5>
					</div>
					<div class="panel-body">
						<ul class="noticeDisplay">
							<%
							dim rs1,title,posttime,id
							sql1="select top 5 Title,PostTime,Id from dbo.Bulletin order by Id desc"
							set rs1=conn.execute(sql1)
							do while not rs1.eof
							title=rs1("Title")
							posttime=rs1("PostTime")
							id=rs1("Id")
							%>						
	                        <li><a href="detail.asp?table=Bulletin&id=<%=id%>"><%=title%></a><span class="hidden"><%=id%></span><p class="date"><%=posttime%></p></li>
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