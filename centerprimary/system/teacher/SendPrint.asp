<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp"-->

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="">
		<title></title>

		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="css/global.css" rel="stylesheet" type="text/css">
		<link href="css/style.css" rel="stylesheet" type="text/css">

		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/LodopFuncs.js"></script>
		<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
			<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
		</object>
	</head>
	<body>



	<%
	dim courseid,user,stuname,stuno,score
	'' courseid = request.querystring("courseid")
	courseid = session("courseid")
	user = session("userId")
	mySql0 = "select course_name from tabcourse where courseid='"&courseid&"'"
	set ms0 = conn.execute(mySql0)
	mySql = "select time_segment from tbltime where status='n'"
	set ms = conn.execute(mySql)

	%>



	<div class="row">
		<div class="pull-right" style="margin-right:50px;">
			<a href="javascript:;" onclick="javascript:createContent();LODOP.PREVIEW();" role="button" class="btn btn-sm btn-info">预览打印</a>
			<a href="javascript:;" onclick="javascript:createContent();LODOP.PRINT_DESIGN();" role="button" class="btn btn-sm btn-info">设计</a>
		</div>
		<div id="printTitle"><h3><%=ms("time_segment")%> 学年 <%=courseid%><%=ms0("course_name")%> 学生记成绩表</h3></div>
		<div class="col-md-offset-1 col-md-10" id="printContent">						
			<table class="table table-bordered table-condensed">
				<thead>
					<tr>
						<!-- <th rowspan="2" class="col-md-1 S">学号</th> -->
						<th rowspan="2" class="col-md-1 S">姓名</th>
						<th rowspan="2" class="col-md-1 M">班级</th>
						<th colspan="6" class="col-md-3">记分记录</th>
						<th rowspan="2" class="col-md-1">成绩</th>
					</tr>
					<tr>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					</tr>
				</thead>

				<%

				sql = "select stuno,score from tabsel where (teano = '"&user&"' and courseid='"&courseid&"') order by stuno"
					 'response.write(sql)
					 set rs = conn.execute(sql)
					 if not rs.eof then
					 do while not rs.eof
					 score = rs("score")
					 stuno = rs("stuno")
					 sql1 = "select name,classno from tabstu where stuno='"&Stuno&"'"
					 set rs1 = conn.execute(sql1)
					 if not rs1.eof then
					 stuname = rs1("name")
					 classno = rs1("classno")
					 end if

					 select case left(Classno,2)
					 case "01" 
					 Grade = "小一年级"
					 case "02" 
					 Grade = "小二年级"
					 case "03" 
					 Grade = "小三年级"
					 case "04" 
					 Grade = "小四年级"
					 case "05" 
					 Grade = "小五年级"		
					 end select

					 nClass = right(Classno,2)&"班"				 	
					 %>
					 <tr>
					 	<!-- <td><%=stuno%></td> -->
					 	<td><%=stuname%></td>
					 	<td><%=Grade%><%=nClass%></td>
					 	<td class="N"></td>
					 	<td class="N"></td>
					 	<td class="N"></td>
					 	<td class="N"></td>
					 	<td class="N"></td>
					 	<td class="N"></td>
					 	<td><%=score%></td>
					 </tr>
					 <%		
					 rs.movenext
					 loop
					 end if		
					 %>
<!-- 					<tfoot>
						<tr>
							<th colspan="3" style="text-align:right;">审核者：</th>
							<th></th>
						</tr>

					</tfoot> -->
				</table>			
			</div>
		</div>
		<script language="javascript"> 
			var LODOP = getLodop();
			var stylestr = "<style>table{width:100%;border-collapse:collapse;} td,tr{text-align:center;} td,th{border:1px solid #000;} .col-md-1{width:15%;} .col.md-3{width:45%;} .N{width:7.5%;}</style>"
			var styletitle =  "<style>h3{font-size:20px;}</style>"
			function createContent(){
				var stringFormHtml = stylestr+document.getElementById("printContent").innerHTML;
				var printTitle = styletitle+document.getElementById("printTitle").innerHTML;
				LODOP.PRINT_INIT("打印成绩表\n");
				LODOP.SET_PRINT_PAGESIZE(1,0,0,"A4");
				LODOP.ADD_PRINT_HTM("5%","15%",500,200,printTitle);
		  	//LODOP.SET_PRINT_STYLEA(0,"FontSize",17);
		  	//
		  	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		  	LODOP.SET_PRINT_STYLEA(0,"Horient",2);
		  	LODOP.ADD_PRINT_TABLE("8%","5%","90%","75%",stringFormHtml);
		  	LODOP.ADD_PRINT_TEXT("89%","30%",200,30,"审核者：			");
		  	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		  	LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
		  	LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
		  	LODOP.ADD_PRINT_TEXT("89%","50%",200,30,"日期：			");
		  	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		  	LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
		  	LODOP.SET_PRINT_STYLEA(0,"FontSize",14);
		  	LODOP.ADD_PRINT_TEXT("90%","90%",165,22,"第#页/共&页");
		  	LODOP.SET_PRINT_STYLEA(0,"ItemType",2);
		  	LODOP.SET_PRINT_STYLEA(0,"Horient",1);
		  	LODOP.SET_PRINT_STYLEA(0,"Vorient",1);

		  }

		</script>
	</body>
	</html>

	