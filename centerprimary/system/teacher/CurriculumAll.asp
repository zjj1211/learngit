<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/teacher-header.asp"-->

	<%
	'server对象的createobject方法建立connection对象
	if uflag<>3 and uflag<>4 then
	response.redirect("/index.asp")
	end if
	%>
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
		<div id="printTitle"><h3>学生课程表</h3></div>    
    	<div class="curriculum" id="printContent">
	      <table class="table table-bordered">
	      	<thead>
	      		<tr>
	      			<td>name</td>
	      			<td>week</td>
	      			<td>上午</td>

	      			<td>下午</td>

	      		</tr>
	      	</thead>
			<%
			sql0="select stuno,name from dbo.tabstu where classno=(select classno from dbo.tabteach where teano="&userId&")"
			set rs0=conn.execute(sql0)

			Dim studentNO,studentName
			do while not rs0.eof

			studentNO=rs0("stuno")
			studentName=rs0("name") 
			sql1="select courseid,teano from dbo.tabsel where stuno='"&studentNO&"'"
			set rs=conn.execute(sql1)

			do while not rs.eof
			Courseid=rs("courseid")
			Teano=rs("teano")

			sql2="select course_name,coursetime,courseweekday,areano from dbo.tabcourse where courseid='"&Courseid&"' order by coursetime"
			set rs1=conn.execute(sql2)

			if not rs1.eof then 
			Course_name=rs1("course_name")
			Coursetime=rs1("coursetime")
			Courseweekday=rs1("courseweekday")
			Area = rs1("areano")
			end if 	

			dim mon,tues,wed,thur,fri
			select case Courseweekday
				case "Monday"
					mon = mon&Coursetime&Course_name&"/"&Area&"<br/>"
				case "Tuesday"
					tues = tue&Coursetime&Course_name&"/"&Area&"<br/>"
				case "Wednesday"
					wed = wed&Coursetime&Course_name&"/"&Area&"<br/>"
				case "Thursday"
					thur = thu&Coursetime&Course_name&"/"&Area&"<br/>"
				case "Friday"
					fri = fri&Coursetime&Course_name&"/"&Area&"<br/>"
				'case else
			end select	

			rs.movenext
			loop

			%>				

	      	<tbody>
	      		<tr>
	      			<td rowspan="5"><%=studentName%></td>	      			
	      			<td>Mon</td>	      			
	      			<td rowspan="5"></td>

	      			<td><%=mon%></td>
	      		</tr>
	      		<tr>
	      			
	      			<td>Tues</td>	      			
	      			<td><%=tues%></td>
	      		</tr>
	      		<tr>	      			
	      			<td>Wed</td>	      			
	      			<td><%=wed%></td>
	      		</tr>
	      		<tr>
	      			<td>Thur</td>	      			
	      			<td><%=thur%></td>
	      		</tr>
	      		<tr>
	      			<td>Fri</td>	      			
	      			<td><%=fri%></td>

	      		</tr>
				<%
				rs0.movenext
				loop
				%>	      		
	      	</tbody>
	      </table>
    	</div>
    </div>

	<script language="javascript"> 
	  var LODOP = getLodop();
	  var stylestr = "<style>table{width:100%;border-collapse:collapse;} td,tr{text-align:center;} td,th{border:1px solid #000;}</style>"
	  var styletitle =  "<style>h3{font-size:20px; text-align:center;}</style>"
	  function createContent(){
	    var stringFormHtml = stylestr+document.getElementById("printContent").innerHTML;
	    var printTitle = styletitle+document.getElementById("printTitle").innerHTML;
	  	LODOP.PRINT_INIT("打印课程表\n");
	  	LODOP.SET_PRINT_PAGESIZE(1,0,0,"A4");
	  	LODOP.ADD_PRINT_HTM("5%","45%",350,200,printTitle);
	  	//LODOP.SET_PRINT_STYLEA(0,"FontSize",17);
	  	//
	  	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	  	LODOP.SET_PRINT_STYLEA(0,"Horient",2);
	  	LODOP.ADD_PRINT_TABLE("8%","5%","90%","75%",stringFormHtml);
	  	LODOP.ADD_PRINT_TEXT("89%","30%",200,30,"审核者：			");
	  	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	  	LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
		LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
		  LODOP.ADD_PRINT_TEXT("89%","50%",200,30,"日期：			");
	  	LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
	  	LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
		LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
	  	LODOP.ADD_PRINT_TEXT("90%","90%",165,22,"第#页/共&页");
	  	LODOP.SET_PRINT_STYLEA(0,"ItemType",2);
	  	LODOP.SET_PRINT_STYLEA(0,"Horient",1);
	  	LODOP.SET_PRINT_STYLEA(0,"Vorient",1);

	  }

	</script>      	
    </body>
</html>
