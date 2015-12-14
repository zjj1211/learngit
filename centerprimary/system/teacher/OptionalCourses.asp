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
               <li><a href="StudentManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 学生管理</a></li>
               <li><a href="OptionalCourses.asp"><span class="glyphicon glyphicon-folder-open"></span> 本班可选课程</a></li>
               <li><a href="SelectionResults.asp"><span class="glyphicon glyphicon-folder-close"></span> 本班学生管理</a></li>
             </ul>
           </div>
         </div>

         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 well wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading">可选课程</div>
                <div class="panel-body">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>课程号</th>
                          <th>课程名称</th>
                          <th>课程类型</th>
                        </tr>
                      </thead>
                      <tbody>
<% 
dim rs,Classno,Grade
sql="select classno from dbo.tabteach where teano='"&userId&"' "
set rs=conn.execute(sql)
if not rs.eof then 
Classno=rs("classno") 
Grade=left(Classno,2)
'取出班主任所在班的所在年级
'response.Write(grade)
end if
'根据班主任所在年级找到tabcourse中对应的在年级限制内的课程 
if Grade="01" then 
sql="select courseid,course_name,course_type from dbo.tabcourse where grade='01' or grade='06'or grade='10'or grade='13'or grade='15'"
   else if Grade="02" then
   sql="select courseid,course_name,course_type from dbo.tabcourse where grade='02' or grade='06'or grade='07'or grade='10'or grade='11'or grade='13'or grade='14'or grade='15'"
      else if Grade="03" then
      sql="select courseid,course_name,course_type from dbo.tabcourse where grade='03' or grade='07'or grade='08'or grade='10'or grade='11'or grade='12'or grade='13'or grade='14'or grade='15'"
      else if Grade="04" then
        sql="select courseid,course_name,course_type from dbo.tabcourse where grade='04' or grade='08'or grade='09'or grade='11'or grade='12' or grade='13'or grade='14'or grade='15'"
        else 
            sql="select courseid,course_name,course_type from dbo.tabcourse where grade='05' or grade='09' or grade='12' or grade='14' or grade='15'"
       end if
     end if 
  end if      
end if  

set rs=conn.execute(sql)
do while not rs.eof 

Courseid=rs("courseid") 
Course_name=rs("course_name")
Course_type=rs("course_type")

%>                      
                        <tr>
                          <td><%=Courseid%></td>
                          <td><%=Course_name%></td>
                          <td><%=Course_type%></td>
                        </tr>
                        <%
                        rs.movenext
                        loop
                        %>
                      </tbody>
                    </table>
                </div>
                
            </div>

<!--             <div class="bottomNav">
                <ul class="pagination">
                    <li><a>«</a></li>
                    <li class="active"><a>1</a></li>
                    <li><a>2</a></li>
                    <li><a>3</a></li>
                    <li><a>4</a></li>
                    <li><a>5</a></li>
                    <li><a>»</a></li>
                </ul>
            </div> -->
            
         </div>
