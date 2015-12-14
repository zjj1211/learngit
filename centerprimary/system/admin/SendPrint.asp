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
		<link rel="stylesheet" type="text/css" href="css/print.css">
		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/LodopFuncs.js"></script>
		<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
			<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
		</object>
	</head>
	<body>
	<%
	sql0="select time_segment from dbo.tbltime where status='n'"
	set rs0 = conn.execute(sql0)
	timeseg = trim(rs0("time_segment"))
	timeseg = replace(timeseg,"-","")
	sql1="select * from dbo.tabcourse where termtime like '"&timeseg&"%' order by coursetime"
	set rs=conn.execute(sql1)
	a=0
	b=0
	c=0
	d=0
	e=0
	do while not rs.eof 
	if not rs.eof then 
	Course_name=rs("course_name")
	Coursetime=rs("coursetime")
	Courseweekday=rs("courseweekday")
	Coursesite=rs("areano")
	end if 	
	dim mon,tues,wed,thur,fri

	select case Courseweekday
		case "Monday"
			mon = mon&Coursetime&"  "&Course_name&"<br/>"&Coursesite&"<hr/>"
			a=a+1
		case "Tuesday"
			tues = tues&Coursetime&"  "&Course_name&"<br/>"&Coursesite&"<hr/>"
			b=b+1
		case "Wednesday"
			wed = wed&Coursetime&"  "&Course_name&"<br/>"&Coursesite&"<hr/>"
			c=c+1
		case "Thursday"
			thur = thur&Coursetime&"  "&Course_name&"<br/>"&Coursesite&"<hr/>"
			d=d+1
		case "Friday"
			fri = fri&Coursetime&"  "&Course_name&"<br/>"&Coursesite&"<hr/>"
			e=e+1
		'case else
	end select							

	rs.movenext
	loop

	%>
		<div class="row">
		<div class="pull-right" style="margin-right:50px;">
			<a href="javascript:;" onclick="javascript:createContent();LODOP.PREVIEW();" role="button" class="btn btn-sm btn-info">预览打印</a>
			<a href="javascript:;" onclick="javascript:createContent();LODOP.PRINT_DESIGN();" role="button" class="btn btn-sm btn-info">设计</a>
		</div>
		<div id="printTitle" style="text-align:center;"><h3>排课表</h3></div>    
    	<div class="curriculum col-md-10 col-md-offset-1" id="printContent">
    		<table class="table table-bordered">
	        <thead>
	          <tr>
	            <th>时间</th>
	            <th>周一</th>
	            <th>周二</th>
	            <th>周三</th>
	            <th>周四</th>
	            <th>周五</th>
	          </tr>
	        </thead>
	        <tbody>
<!-- 	          <tr>
	            <td>7:45--8:15</td>
	            <td colspan="5">早锻炼</td>
	          </tr>
	          <tr>
	            <td>8:15--8:40</td>
	            <td colspan="5">早操/晨会</td>
	          </tr>
	          <tr>
	            <td>8:40--11:35</td>
	            <td colspan="5">四节课</td>
	          </tr>
	          <tr>
	            <td>11:35--12:00</td>
	            <td colspan="5">在校午餐</td>
	          </tr> -->

	          <tr>

	            <td>课程</td>
	            <td>
	            	<%=mon%>
	            </td>
	            <td><%=tues%></td>
	            <td><%=wed%></td>
	            <td><%=thur%></td>
	            <td><%=fri%></td>
	          </tr>
	          <tr>
	          	<td>总数</td>
	          	<td><%=a%></td>
	          	<td><%=b%></td>
	          	<td><%=c%></td>
	          	<td><%=d%></td>
	          	<td><%=e%></td>
	          </tr>
	        </tbody>
	      </table>
    	</div>
    </div>	
		<script language="javascript"> 
			var LODOP = getLodop();
			var stylestr = "<style>table{width:100%;border-collapse:collapse;} td,tr{text-align:left;} td,th{border:1px solid #000;}</style>"
			var styletitle =  "<style>h3{font-size:20px;}</style>"
			function createContent(){
				var stringFormHtml = stylestr+document.getElementById("printContent").innerHTML;
				var printTitle = styletitle+document.getElementById("printTitle").innerHTML;
				LODOP.PRINT_INIT("打印成绩表\n");
				LODOP.SET_PRINT_PAGESIZE(2,0,0,"A4");
				LODOP.ADD_PRINT_HTM("5%","50%",70,200,printTitle);
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

