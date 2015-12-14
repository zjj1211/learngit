<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/teacher-header.asp"-->
	<%
	Dim studentNO,temp,syear
	studentNO=request.QueryString("studentNO")


	mySql = "select time_segment from tbltime where status='n'"
	set ms = conn.execute(mySql)
	if not ms.eof then
		temp = split(trim(ms("time_segment")),"-")
		syear = temp(0)&temp(1)
	end if	
	%>

	<%
	sql1="select courseid,teano from dbo.tabsel where stuno='"&studentNO&"' and termtime like '"&syear&"%'"
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
	CourseSite=rs1("areano")
	end if 	
	dim mon,tues,wed,thur,fri
	select case Courseweekday
		case "Monday"
			mon = mon&Coursetime&" "&Course_name&"<br/>"&CourseSite&"<hr/>"
		case "Tuesday"
			tues = tue&Coursetime&" "&Course_name&"<br/>"&CourseSite&"<hr/>"
		case "Wednesday"
			wed = wed&Coursetime&" "&Course_name&"<br/>"&CourseSite&"<hr/>"
		case "Thursday"
			thur = thu&Coursetime&" "&Course_name&"<br/>"&CourseSite&"<hr/>"
		case "Friday"
			fri = fri&Coursetime&" "&Course_name&"<br/>"&CourseSite&"<hr/>"
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
		<div id="printTitle"><h3><%=ms("time_segment")%> 学年 学生课程表</h3></div>    
    	<div class="curriculum" id="printContent">
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
	          <tr>
	            <td>上午</td>
	            <td colspan="5"></td>
	          </tr>
	          <tr>

	            <td>下午</td>
	            <td>
	            	<%=mon%>
	            </td>
	            <td><%=tues%></td>
	            <td><%=wed%></td>
	            <td><%=thur%></td>
	            <td><%=fri%></td>
	          </tr>
	        </tbody>
	      </table>
    	</div>
    </div>	
	<script language="javascript"> 
	  var LODOP = getLodop();
	  var stylestr = "<style>table{width:100%;border-collapse:collapse;} td,tr{text-align:center;} td,th{border:1px solid #000;}</style>"
	  var styletitle =  "<style>h3{font-size:20px;}</style>"
	  function createContent(){
	    var stringFormHtml = stylestr+document.getElementById("printContent").innerHTML;
	    var printTitle = styletitle+document.getElementById("printTitle").innerHTML;
	  	LODOP.PRINT_INIT("打印课程表\n");
	  	LODOP.SET_PRINT_PAGESIZE(2,0,0,"A4");
	  	LODOP.ADD_PRINT_HTM("5%","15%",450,200,printTitle);
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
  <!--[if lte IE 6]>
  <script type="text/javascript" src="js/bootstrap-ie.js"></script>
  <![endif]-->  		
    </body>
</html>



						
