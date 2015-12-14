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
               <li><a href="OptionalCourses.asp"><span class="glyphicon glyphicon-folder-close"></span> 本班可选课程</a></li>
               <li><a href="SelectionResults.asp"><span class="glyphicon glyphicon-folder-open"></span> 本班学生管理</a></li>
             </ul>
           </div>
         </div>

         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 well wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading">学生去向
                <button class="btn btn-xs btn-danger pull-right applyfor" type="submit" id="resetAll">全部重置</button>
                <a href="CurriculumAll.asp" target="_blank"><button class="btn btn-xs btn-success pull-right applyfor">学生课表</button></a>
                
                </div>
                <div class="panel-body">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>学号</th>
                          <th>姓名</th>
<!--                           <th>课程号</th>
                          <th>教师号</th>
                          <th>教师姓名</th>
                          <th>课程名称</th>
                          <th>课程类型</th> -->
                          <th>课表</th>
                          <th>密码重置</th>
                        </tr>
                      </thead>
                      <tbody>

                      <% 
                      dim rs,Classno,Grade,page

                      sql0="select classno from dbo.tabteach where teano='"&userId&"'"
                      set rs0=conn.execute(sql0)
                      if not rs0.eof then 
                      Classno=rs0("classno") 
                      '取出班主任所在班的所在班级

                      '根据班主任所在班级找到tabsel中对应的本班级学生
                      sql1 = "select stuno,name from dbo.tabstu where classno='"&Classno&"'" 
                      set rs = conn.execute(sql1)
                      dim varNo
                      varNo = 0
                      do while not rs.eof 
                      varNo=varNo+1
                      Stuno=rs("stuno")
                      Sname=rs("name")


                      %>
                        <tr>
                          <td><%=varNo%></td>
                          <td name="stuno"><%=Stuno%></td>
                          <td><%=Sname%></td>
                          <td><a href="Curriculum.asp?studentNO=<%=Stuno%>" target="_blank">课表</a></td>
                          <td><button class="btn btn-xs btn-danger passwordReset">重置</button></td>
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
