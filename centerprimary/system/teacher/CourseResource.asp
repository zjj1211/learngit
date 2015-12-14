<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/teacher-header.asp"-->

       
       <div class="container-fluid">
         <div class="row">
           <div class="col-sm-3 col-md-2 sidebar well">
             <ul class="nav">
               <li class="active"><a href="TeacherIndex.asp"><span class="glyphicon glyphicon-folder-close"></span> 基本信息</a></li>
               <li><a href="CourseReview.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程申报</a></li>
               
               <!-- <li><a href="EvaluationManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 评价管理</a></li> -->
               <li><a href="CourseResource.asp"><span class="glyphicon glyphicon-folder-open"></span> 课程简介</a></li>
               <li><a href="Recruitment.asp"><span class="glyphicon glyphicon-folder-close"></span> 招生管理</a></li>
               <li><a href="StudentManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 学生管理</a></li>
               <%
                  if uflag = "3" then
                  response.write("<li><a href=""OptionalCourses.asp""><span class=""glyphicon glyphicon-folder-close""></span> 本班可选课程</a></li><li><a href=""SelectionResults.asp""><span class=""glyphicon glyphicon-folder-close""></span> 本班学生管理</a></li>")
                  end if

               %>
             </ul>
           </div>
         </div>

         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 well wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading">课程简介</div>
                <div class="panel-body">
                  <table class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <td>课程号</td>
                        <td>课程名称</td>

                        <td></td>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                       Dim Courseid,Course_name
                       sql="select courseid,course_name from dbo.tabcourse where teano="&userId&""
                       Set rs=conn.execute(sql)
                       do while not rs.eof
                       Courseid=rs("courseid")
                       Course_name=rs("course_name")
                           
                      %>
                      <form method="post" action="CourseResourceUpload.asp?courseid=<%=Courseid%>&coursename=<%=Course_name%>" class="form">
                        <tr>
                          <td name="courseid"><%=Courseid%></td>
                          <td name="coursename"><%=Course_name%></td>
                          <td><button class="btn btn-xs btn-success uploadResource" type="submit">课程简介</button></td>
                        </tr>
                      </form>
                      
                      <%
                      rs.movenext
                      loop
                      %>
                    </tbody>
                  </table>

                </div>
            </div>            
         </div>
