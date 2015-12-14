<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/admin-header.asp"-->
    <script src="js/LodopFuncs.js"></script>
    <object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
      <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
    </object>
       <div class="container-fluid">
         <div class="row">
           <div class="col-sm-3 col-md-2 sidebar well">
             <ul class="nav nav-sidebar">
               <li><a href="AdminIndex.asp"><span class="glyphicon glyphicon-folder-close"></span> 基本信息</a></li>
               <li><a href="TeacherManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 教师管理</a></li>
               <li><a href="StudentManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 学生管理</a></li>
               <li><a href="CourseReview.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程审核</a></li>
               <li><a href="CourseManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程管理</a></li>
               <li class="active"><a href="CourseArrange.asp"><span class="glyphicon glyphicon-folder-open"></span> 排课计划</a></li>
               <li><a href="NoticeInformation.asp"><span class="glyphicon glyphicon-folder-close"></span> 公告信息</a></li>
               <li><a href="FrontManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 前台管理</a></li>
               <!-- <li><a href="AdvertiseManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 广告管理</a></li> -->
             </ul>
           </div>
         </div>
         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 well wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading feedback">计划<a href="javascript:;" onclick="javascript:createContent();LODOP.PREVIEW();" role="button" class="btn btn-sm pull-right print" target="_blank"><span class="glyphicon glyphicon-print pull-right"></span></a></div>
                <div class="panel-body">         
                <%
                session("tjcs")=session("tjcs")+1
                Dim TotalCount,sum
                sum="0000"
                if session("tjzc")>2 then
                str="对不起,同一内容请勿多次提交!谢谢合作"
                url="chengjipaixu.asp"
                MsgShow str,"1",url   
                'str：提示消息内容；flag：0：返回，标志1：跳转到URL，标志2：关闭窗口 标志3：用于显示  标志4： 刷新页面 标志5： 刷新父窗口 
                else
                    '筛选学年，学期，年级，筛选条件1、2、3，学科1、2、3和筛选百分比 
                  stuyear=request.form("year")
                  stuterm=request.form("term")
                  grade=request.Form("grade")

                  'stuyear="2013-2014"
                  'stuterm="2"
                  'grade="05"
                  '考试类型

                  testtype1=request.form("testtype1")'
                  testtype2=request.form("testtype2")
                  testtype3=request.form("testtype3")

                  'testtype1="质量监控"
                  '考试学科

                  subject1=request.Form("subject1")
                  subject2=request.Form("subject2")
                  subject3=request.Form("subject3")
                  'subject1="数学"

                  percent1=request.form("percent1")
                  percent2=request.form("percent2")
                  percent3=request.form("percent3")
                  percent4=request.form("percent4")
                  percent5=request.form("percent5")

                  percent1="20"
                  percent2="20"
                  percent3="20"
                  percent4="20"
                  percent5="20"

                  courseid1 = request.form("courseid1")
                  courseid2 = request.form("courseid2")
                  courseid3 = request.form("courseid3")
                  courseid4 = request.form("courseid4")
                  courseid5 = request.form("courseid5")

                dim stuyear,tblname
                    stuyear=split(stuyear,"-")
                    tblname="score"&stuyear(0)&stuyear(1)&stuterm
                 ' response.Write(tblname)

                  
                dim rs1,dicSum

                set dicSum = CreateObject("Scripting.Dictionary")
                sql1="select stuno,classno,course,score from "&tblname&" where course='"&subject1&"' and testtype='"&testtype1&"' and classno like '"&grade&"%'"

                set rs1=conn.execute(sql1)
                do while not rs1.eof 

                Stuno=rs1("stuno")
                Classno=rs1("classno")
                Course1=rs1("course")
                Score1=rs1("score")
                'response.Write(Course1)
                'response.Write(Score1)
                dim rs2
                sql2="select classno,course,score from "&tblname&" where course='"&subject2&"' and testtype='"&testtype2&"' and stuno='"&Stuno&"'"
                set rs2=conn.execute(sql2)
                if not rs2.eof then 
                Score2=rs2("score")
                Course2=rs2("course")
                'response.Write(Course2)
                'response.Write(Score2)
                end if 

                dim rs3
                sql3="select classno,course,score from "&tblname&" where course='"&subject3&"' and testtype='"&testtype3&"' and stuno='"&Stuno&"'"
                set rs3=conn.execute(sql3)
                if not rs3.eof then 
                Score3=rs3("score")
                Course3=rs3("course")
                'response.Write(Course3)
                'response.Write(Score3)
                end if 

                dim Sumscore
                Sumscore=Score1+Score2+Score3


                'sql="insert into scoreorder values('"&Stuno&"','"&Classno&"','"&Sumscore&"')"
                'sql4="select name from dbo.tabstul where stuno='"&Stuno&"'"
                'set rs4 = conn.execute(sql4)
                'dim stuname
                'stuname = rs4("name")
                'conn.execute(sql)
                'conn.close
                'set conn=nothing
                'response.Write("数据表添加成功")
                dim studentNO,t1,t2
                studentNO = trim(stuno)
                'response.Write(studentNO&","&Classno&","&Sumscore&","&stuname&"?")
                dicSum.Add studentNO,Sumscore

                rs1.movenext
                loop
                end if 

                '重新对字典内存储的键值对排序
                '依照分数从大到小
                key = dicSum.keys
                for k=0 to dicSum.count-1
                  for j=k+1 to dicSum.count-1
                  if dicSum(key(k)) < dicSum(key(j)) then
                    temp = key(k)
                    key(k) = key(j)
                    key(j) = temp
                  end if
                  next  
                next
                '读取对应名字
                dim names()
                for i=0 to dicSum.count-1
                  redim preserve names(i)
                  sql4  = "select name from dbo.tabstul where stuno='"&key(i)&"'"
                  set rs4 = conn.execute(sql4)
                  names(i) = rs4("name")
                next


                a1 = round(dicSum.count*percent1/100)
                a2 = round(dicSum.count*percent2/100)
                a3 = round(dicSum.count*percent3/100)
                a4 = round(dicSum.count*percent4/100)
                a5 = round(dicSum.count-a1-a2-a3-a4)
                'response.Write(a1&","&a2&","&a3&","&a4&","&a5)
                %>
                  <div>
                    <ul class="nav nav-tabs" role="tablist">
                      <li role="presentation" class="active"><a href="#a1" role="tab" data-toggle="tab" id="b1"><%=courseid1%></a></li>
                      <li role="presentation"><a href="#a2" role="tab" data-toggle="tab" id="b2"><%=courseid2%></a></li>
                      <li role="presentation"><a href="#a3" role="tab" data-toggle="tab" id="b3"><%=courseid3%></a></li>
                      <li role="presentation"><a href="#a4" role="tab" data-toggle="tab" id="b4"><%=courseid4%></a></li>
                      <li role="presentation"><a href="#a5" role="tab" data-toggle="tab" id="b5"><%=courseid5%></a></li>
                    </ul>
                  </div>

                  <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="a1">
                      <table class="table table-condensed">
                        <thead>
                          <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>成绩</th>
                          </tr>
                        </thead>
                        <tbody>  
                        <%
                        for i=0 to a1-1
                        %>

                              <tr>
                                <td><%=i+1%></td>
                                <td class="a1-stuno"><%=key(i)%></td>
                                <td class="a1-name"><%=names(i)%></td>
                                <td><%=dicSum(key(i))%></td>
                              </tr>

                        <%
                        'response.Write(key(i)&"-"&dicSum(key(i))&"<br/>")
                        next
                        %>

                        </tbody>
                      </table>                             
                    </div>
                    <div role="tabpanel" class="tab-pane" id="a2">
                      <table class="table table-condensed">
                        <thead>
                          <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>成绩</th>
                          </tr>
                        </thead>
                        <tbody>  
                        <%
                        for i=a1 to a1+a2-1
                        %>

                              <tr>
                                <td><%=i+1%></td>
                                <td class="a2-stuno"><%=key(i)%></td>
                                <td class="a2-name"><%=names(i)%></td>
                                <td><%=dicSum(key(i))%></td>
                              </tr>

                        <%
                        'response.Write(key(i)&"-"&dicSum(key(i))&"<br/>")
                        next
                        %>

                        </tbody>
                      </table>                             
                    </div>
                    <div role="tabpanel" class="tab-pane" id="a3">
                      <table class="table table-condensed">
                        <thead>
                          <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>成绩</th>
                          </tr>
                        </thead>
                        <tbody>  
                        <%
                        for i=a1+a2 to a1+a2+a3-1
                        %>

                              <tr>
                                <td><%=i+1%></td>
                                <td class="a3-stuno"><%=key(i)%></td>
                                <td class="a3-name"><%=names(i)%></td>
                                <td><%=dicSum(key(i))%></td>
                              </tr>

                        <%
                        'response.Write(key(i)&"-"&dicSum(key(i))&"<br/>")
                        next
                        %>

                        </tbody>
                      </table>                             
                    </div>                    
                    <div role="tabpanel" class="tab-pane" id="a4">
                      <table class="table table-condensed">
                        <thead>
                          <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>成绩</th>
                          </tr>
                        </thead>
                        <tbody>  
                        <%
                        for i=a1+a2+a3 to dicSum.count-a5-1
                        %>

                              <tr>
                                <td><%=i+1%></td>
                                <td class="a4-stuno"><%=key(i)%></td>
                                <td class="a4-name"><%=names(i)%></td>
                                <td><%=dicSum(key(i))%></td>
                              </tr>

                        <%
                        'response.Write(key(i)&"-"&dicSum(key(i))&"<br/>")
                        next
                        %>

                        </tbody>
                      </table>                             
                    </div>                    
                    <div role="tabpanel" class="tab-pane" id="a5">
                      <table class="table table-condensed">
                        <thead>
                          <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>成绩</th>
                          </tr>
                        </thead>
                        <tbody>  
                        <%
                        for i=dicSum.count-a5 to dicSum.count-1

                        %>

                              <tr>
                                <td><%=i+1%></td>
                                <td class="a5-stuno"><%=key(i)%></td>
                                <td class="a5-name"><%=names(i)%></td>
                                <td><%=dicSum(key(i))%></td>
                              </tr>

                        <%
                        'response.Write(key(i)&"-"&dicSum(key(i))&"<br/>")
                        next
                        %>

                        </tbody>
                      </table>                             
                    </div>
                    <button class="btn btn-success btn-sm toSave">确定</button>
                    <a href="#"><button class="btn btn-warning btn-sm">取消</button></a>
                  </div>             
                </div>
            </div>            
         </div>
       </div>  
    <script language="javascript"> 
      var LODOP = getLodop();
      var stylestr = "<style>table{width:100%;border-collapse:collapse;} td,tr{text-align:left;} td,th{border:1px solid #000;}td{width:10%;}</style>"
      var ehead = '<table><thead><tr><th>姓名</th><th colspan="9"></tr></thead><tbody><tr><td>';
      var efoot = '</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td></td></tr></tbody></table>'

      function createContent(){
        // var stringFormHtml = stylestr+document.getElementById("printContent").innerHTML;
        // var printTitle = styletitle+document.getElementById("printTitle").innerHTML;
        LODOP.PRINT_INIT("排课计划\n");
        LODOP.SET_PRINT_PAGESIZE(1,0,0,"A4");

        createAllPages();
        LODOP.ADD_PRINT_TEXT("89%","30%",200,30,"审核者：     ");
        LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
        LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
        LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
        LODOP.ADD_PRINT_TEXT("89%","50%",200,30,"日期：      ");
        LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
        LODOP.SET_PRINT_STYLEA(0,"Alignment",3);
        LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
        LODOP.ADD_PRINT_TEXT("90%","90%",165,22,"第#页/共&页");
        LODOP.SET_PRINT_STYLEA(0,"ItemType",2);
        LODOP.SET_PRINT_STYLEA(0,"Horient",1);
        LODOP.SET_PRINT_STYLEA(0,"Vorient",1);

      }
      function createAllPages(){
        var pa1 = [];
        var pa2 = [];
        var pa3 = [];
        var pa4 = [];
        var pa5 = [];

        var a1 = $('.a1-name').each(function() {
          pa1.push($(this).text());
        });
        var a2 = $('.a2-name').each(function() {
          pa2.push($(this).text());
        });
        var a3 = $('.a3-name').each(function() {
          pa3.push($(this).text());
        });
        var a4 = $('.a4-name').each(function() {
          pa4.push($(this).text());
        });
        var a5 = $('.a5-name').each(function() {
          pa5.push($(this).text());
        });

        var pa = {};
        var tem = "</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>"
        pa[0] = ehead + pa1.join(tem) + efoot;
        pa[1] = ehead + pa2.join(tem) + efoot;
        pa[2] = ehead + pa3.join(tem) + efoot;
        pa[3] = ehead + pa4.join(tem) + efoot;
        pa[4] = ehead + pa5.join(tem) + efoot;

        console.log(pa[0]);
        for(i=1;i<6;i++){

          LODOP.NewPage();
          LODOP.ADD_PRINT_HTM("5%","50%",150,200,stylestr+"<h3>"+document.getElementById("b"+i).text+"</h3>");
          //LODOP.SET_PRINT_STYLEA(0,"FontSize",17);
          //
          LODOP.SET_PRINT_STYLEA(0,"ItemType",0);
          LODOP.SET_PRINT_STYLEA(0,"Horient",2);
          LODOP.ADD_PRINT_TABLE("8%","5%","90%","75%",stylestr+pa[i-1]);
        }
      }
    </script>
<!--#include virtual=/system/common/footer.asp -->            