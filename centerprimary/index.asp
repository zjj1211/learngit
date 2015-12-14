<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp" -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="xy">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <link rel="icon" href="">
	<title>闸北区第一中心小学</title>
	<link rel="stylesheet" type="text/css" href="static/style/bootstrap.min.css">
	<!--[if lte IE 7]>
	<meta http-equiv="refresh" content="0;URL=http://<%=Request.ServerVariables("SERVER_NAME") %>/upgrade.html"/>
	<![endif]-->  
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
	<script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="static/style/index.css">

	<script type="text/javascript" src="static/script/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="static/script/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/script/jquery.flexisel.js"></script>
	<script type="text/javascript" src="static/script/script.js"></script>

</head>
<script Language="JavaScript">
function ChkFields() {
if (document.form1.txtUserName.value=="") {
window.alert ("请输入用户名！")
return false
}
if (document.form1.txtPwd.value == "") {		
window.alert ("请输入密码！")
return false
}
return true
}
</script>
<%   Dim uName1,uflag,userId
    'server对象的createobject方法建立connection对象
    uflag=session("utype")
    uName1=session("uName")
    userId=session("userId")
 %>
<body>
	<div class="navbar navbar-ghost filter">
			<div class="container">
				<form action="database/putSession.asp" target="_blank" method="post" name="form1" id="form1" class="nav navbar-form form-ctrl" >
                    <% if userId<>"" then %>
                    <div class="form-group">
                        <label>姓名：<%=uName1%>&nbsp;&nbsp;</label>
                    </div>
                    <div class="form-group">
                        <label><% 
                        	if uflag <> "02" then response.write("工号") else response.write("学号") end if %>：<%=userId%>&nbsp;&nbsp;</label>
                    </div>
                    <a href="system/common/logout.asp"class="btn btn-danger btn-xs">退出</a>
                    <% else %>
                    <div class="form-group">
                        <label for="txtUserName">用户名</label>
                        <input type="text" name="txtUserName" id="txtUserName" placeholder="用户名" class="form-control login">
                    </div>
                    <div class="form-group">
                        <label for="txtPwd">密码</label>
                        <input type="password" name="txtPwd"   id="txtPwd" placeholder="密码" class="form-control login">
                    </div>
                    <input type="submit" name="Submit" onclick="return ChkFields()" class="btn btn-success btn-xs" value="登录"></input>
                    <% end if %>
				</form>
			</div>
	</div>
	<div class="banner container">
		<img src="static/img/banner.png">
	</div>
	<div class="container">

		<div class="navbar">
			<ul class="nav  nav-justified top-nav">
				<li><a href="http://www.zb1.org/web/index.asp">学校主页</a></li>
				<li><a href="culture.asp">课程文化</a></li>
				<li><a href="plan.asp">课程计划</a></li>
				<li><a href="display.asp">课程展示</a></li>
				<li><a href="system/student/StudentCenter.asp">学生中心</a></li>
			</ul>
		</div>


		<div class="row">
 			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h5>最新课程</h5>
					</div>
					<div class="panel-body">
						<ul class="noticeDisplay">
							<%
							dim rs2,Course_name,modifytime
							sql2="select top 5 courseid,course_name,modifytime from dbo.tabcourse order by modifytime desc"
							set rs2=conn.execute(sql2)						
							do while not rs2.eof
							courseid = rs2("courseid")
							Course_name=rs2("course_name")
							modifytime=rs2("modifytime")

							%>
							<li><a href="displaydetail.asp?courseid=<%=courseid%>"><%=Course_name%></a><p class="date"><%=modifytime%></p></li>
							<%
	                        rs2.movenext
	                        loop
	                        %>
	                    </ul>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h5>文化文章</h5>
					</div>
					<div class="panel-body">
						<ul class="noticeDisplay">
	                        <%
							dim rs1,title1,posttime1
							sql1="select top 5 Title,PostTime,Id from dbo.article order by Id desc"
							set rs1=conn.execute(sql1)
							do while not rs1.eof
							title1=rs1("Title")
							posttime1=rs1("PostTime")
							id=rs1("Id")
							%>						
	                        <li><a href="detail.asp?table=dbo.article&id=<%=id%>" target="_blank"><%=title1%><p class="date"><%=posttime1%></p></a></li>
	                        <%
	                        rs1.movenext
	                        loop
	                        %>
	                    </ul>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h5>公告等等</h5>
					</div>
					<div class="panel-body">
						<ul class="noticeDisplay" id="notice">
							<%
							dim rs,title,posttime,id
							sql="select top 5 Title,PostTime,Id from dbo.Bulletin order by Id desc"
							set rs=conn.execute(sql)
							do while not rs.eof
							title=rs("Title")
							posttime=rs("PostTime")
							id=rs("Id")
							%>						
	                        <li><a href="detail.asp?table=dbo.Bulletin&id=<%=id%>" target="_blank"><%=title%><span class="hidden"><%=id%></span><p class="date"><%=posttime%></p></a></li>
	                        <%
	                        rs.movenext
	                        loop
	                        %>
	                    </ul>
					</div>
				</div>
			</div>
		</div>

		<div class="">
			<!-- <h2><span>展示</span></h2>  
			<p>作品、荣誉、活动、学生等展示</p> -->   
 			<%
				sql3 = "select top 8 * from dbo.tabcourse"
				set rs3 = conn.execute(sql3)
				dim arra(7)
				dim arrb(7)
				dim i
				i = 0
					do while not rs3.eof
						carcourseid = rs3("courseid")
						carcoursename = rs3("course_name")
						arra(i) = carcourseid
						arrb(i) = carcoursename
						i = i+1	
						rs3.movenext
					loop	
					
			%>
			<ul id="myCarousel">
 
				<li><a href="displaydetail.asp?courseid=<%=arra(0)%>" target="_blank"><img src="static/img/icon/icon_11.png" /></a><p><%=arrb(0)%></p></li>
				<li><a href="displaydetail.asp?courseid=<%=arra(1)%>" target="_blank"><img src="static/img/icon/icon_18.png" /></a><p><%=arrb(1)%></p></li>
				<li><a href="displaydetail.asp?courseid=<%=arra(2)%>" target="_blank"><img src="static/img/icon/icon_13.png" /></a><p><%=arrb(2)%></p></li>
				<li><a href="displaydetail.asp?courseid=<%=arra(3)%>" target="_blank"><img src="static/img/icon/icon_09.png" /></a><p><%=arrb(3)%></p></li>
				<li><a href="displaydetail.asp?courseid=<%=arra(4)%>" target="_blank"><img src="static/img/icon/icon_05.png" /></a><p><%=arrb(4)%></p></li>
				<li><a href="displaydetail.asp?courseid=<%=arra(5)%>" target="_blank"><img src="static/img/icon/icon_16.png" /></a><p><%=arrb(5)%></p></li>
				<li><a href="displaydetail.asp?courseid=<%=arra(6)%>" target="_blank"><img src="static/img/icon/icon_14.png" /></a><p><%=arrb(6)%></p></li>
				<li><a href="displaydetail.asp?courseid=<%=arra(7)%>" target="_blank"><img src="static/img/icon/icon_19.png" /></a><p><%=arrb(7)%></p></li>
			</ul>
			 <script type="text/javascript">
				$(window).load(function() {
				  $("#myCarousel").flexisel({
				    visibleItems: 5,
				    animationSpeed: 800,
				    autoPlay: true,
				    autoPlaySpeed: 3000,
				    pauseOnHover: true,
				    
				    enableResponsiveBreakpoints: true,
				    responsiveBreakpoints: {
				      portrait: {
				        changePoint:480,
				        visibleItems: 1
				      }, 
				      landscape: {
				        changePoint:640,
				        visibleItems: 2
				      },
				      tablet: {
				        changePoint:768,
				        visibleItems: 3
				      }
				    }
				  });
				});
			 </script>
		</div>
	</div>
       <div class="footer">
         <div class="container" id="copyright">
           <p>copyright</p>
         </div>
       </div>
  <!--[if lte IE 6]>
  <script type="text/javascript" src="js/bootstrap-ie.js"></script>
  <![endif]-->   
 
</body>
</html>