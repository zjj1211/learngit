<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/teacher-header.asp"-->

       
       <div class="container-fluid">
         <div class="row">
           <div class="col-sm-3 col-md-2 sidebar well">
             <ul class="nav">
               <li class="active"><a href="TeacherIndex.asp"><span class="glyphicon glyphicon-folder-close"></span> 基本信息</a></li>
               <li><a href="CourseReview.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程申报</a></li>
               
               <!-- <li><a href="EvaluationManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 评价管理</a></li> -->
               <li><a href="CourseResource.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程简介</a></li>
               <li><a href="Recruitment.asp"><span class="glyphicon glyphicon-folder-close"></span> 招生管理</a></li>
               <li><a href="StudentManage.asp"><span class="glyphicon glyphicon-folder-open"></span> 学生管理</a></li>
               <%
                  if uflag = "3" then
                  response.write("<li><a href=""OptionalCourses.asp""><span class=""glyphicon glyphicon-folder-close""></span> 本班可选课程</a></li><li><a href=""SelectionResults.asp""><span class=""glyphicon glyphicon-folder-close""></span> 本班学生管理</a></li>")
                  end if

                 dim courseid
                    
                  courseid=Request.querystring("courseid")
                  if courseid<>"" then
                    session("courseid")=courseid
                  else
                  courseid=session("courseid")
                  end if
               %>
             </ul>
           </div>
         </div>

         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 well wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading">学生管理

                  <!-- <form class="form rectify pull-right">
                    <input type="text" class="form-control navbar-form search" placeholder="搜索。。。" onkeyup ="?">

                  </form> -->  
                  <a href="SendPrint.asp?courseid=<%=courseid%>" role="button" class="btn btn-sm pull-right print" target="_blank"><span class="glyphicon glyphicon-print pull-right"></span></a>
                </div>
                <div class="panel-body">
                  <table class="table table-condensed table-striped">
                    <thead>
                        <th>#</th>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>原始班级</th>
                        <th>班主任</th>
                        <th class="col-md-1">选课成绩</th>
                    </thead>
                    <tbody>
                    
                    <%
                    Dim Stuno,Sname,Ssex,Classno,Grade,Banji,Score,Headteacher,mySQL,mySQL1,mySQL2,mySQL3
                   
                    sql = "SELECT stuno,score FROM tabsel WHERE (teano = '"&userId&"' and courseid='"&courseid&"')"
                    set rs = conn.execute(sql)
                    varNo = 0
                    if not rs.eof then
                    do while not rs.eof
                    varNo = varNo+1
                    Stuno = rs("stuno")
                    Score = rs("score")

                    mySQL1 ="select course_name from tabcourse where courseid='"&Courseid&"'"
                    set rs1=conn.execute(mySQL1)
                    if not rs1.eof then
                    Course_name = rs1("course_name")
                    end if

                    mySQL2 ="select name,sex,classno from tabstu where stuno='"&Stuno&"'"
                    set rs2=conn.execute(mySQL2)
                    if not rs2.eof then
                    Sname = rs2("name")
                    Ssex = rs2("sex")
                    Classno = rs2("classno")
                    end if

                    mySQL3="select teaname from tabteach where classno='"&trim(Classno)&"'"
                    set rs3=conn.execute(mySQL3)
                    if not rs3.eof then
                    Headteacher=rs3("teaname")
                    end if 
                    %>
                    <%
                    if Left(Classno,2)="01" then
                           Grade="小一年级"
                         else if Left(Classno,2)="02"  then
                            Grade="小二年级"
                         else if  Left(Classno,2)="03"   then
                              Grade="小三年级"
                            else if Left(Classno,2)="04"   then
                                  Grade="小四年级"
                               else if Left(Classno,2)="05"   then
                                       Grade="小五年级"
                                end if 
                             end if 
                          end if 
                        end if 
                      end if 
                    if  Right(Classno,2)="01" then 
                           Banji="一班"
                         else if Right(Classno,2)="02" then 
                             Banji="二班"
                          else if Right(Classno,2)="03" then 
                               Banji="三班"
                             else if Right(Classno,2)="04" then 
                                 Banji="四班"
                              else if Right(Classno,2)="05" then 
                                Banji="五班"
                                else if Right(Classno,2)="06" then
                                Banji="六班"
                               else if Right(Classno,2)="07" then
                                  Banji="七班" 
                                  else if Right(Classno,2)="08" then 
                                    Banji="八班"
                                    else if Right(Classno,2)="09" then 
                                      Banji="九班"
                                  else if Right(Classno,2)="10" then 
                                      Banji="十班"
                                       end if 
                                     end if 
                                     end if 
                                   end if 
                                 end if 
                               end if 
                               end if 
                            end if 
                          end if 
                        end if 
                      
                    %>                    
                        <tr>
                            <td><%=varNo%></td>
                            <td name="stuno"><%=Stuno%></td>
                            <td><%=Sname%></td>
                            <td><%=Ssex%></td>
                            <td><%=Grade%><%=Banji%></td>
                            <td><%=Headteacher%></td>
                            <td>
                              <select class="form-control scores">
                              <%
                                if Score<>"" then 
                              %>
                                <option><%=Score%></option>
                              <%
                                end if
                              %>
                                <option>--</option>
                                <option class="bg-info">金章</option>
                                <option class="bg-warning">银章</option>  
                                <option class="bg-success">铜章</option>
  
                             </select>
                            </td>
                        </tr>
                      <%
                      rs.movenext
                      loop
                       end if
                      %>
                    </tbody>
                </table>
                 
                </div>               
            </div>
         </div>



<!--#include virtual=/system/common/footer.asp -->