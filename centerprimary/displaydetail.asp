<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/header.asp"-->

	<%
		courseid = request.querystring("courseid")
		sql = "select * from dbo.tabcourse where courseid='"&courseid&"'"
		set rs = conn.execute(sql)
		if not rs.eof then
			coursename = rs("course_name")
			introduction = rs("introduction")
		end if	
	%>
	<div class="container">
		<div  class="banner">
		<img src="/static/img/banner.png">
		</div>
		<div class="header"></div>
		<div class="panel panel-success">
			<div class="panel-heading">课程名称: <%=coursename%></div>
			<div class="panel-body cdetail">
				<%=introduction%>
			</div>
		</div>

	</div>

<!--#include virtual="/system/common/footer.asp"-->