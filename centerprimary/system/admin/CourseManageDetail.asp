<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/admin-header.asp"-->

       
       <div class="container-fluid">
         <div class="row">
           <div class="col-sm-3 col-md-2 sidebar well">
             <ul class="nav nav-sidebar">
               <li><a href="AdminIndex.asp"><span class="glyphicon glyphicon-folder-close"></span> 基本信息</a></li>
               <li><a href="TeacherManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 教师管理</a></li>
               <li><a href="StudentManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 学生管理</a></li>
               <li><a href="CourseReview.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程审核</a></li>
               <li><a href="CourseManage.asp"><span class="glyphicon glyphicon-folder-open"></span> 课程管理</a></li>
               <li><a href="CourseArrange.asp"><span class="glyphicon glyphicon-folder-close"></span> 排课计划</a></li>
               <li><a href="NoticeInformation.asp"><span class="glyphicon glyphicon-folder-close"></span> 公告信息</a></li>
               <li><a href="FrontManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 前台管理</a></li>
               <!-- <li class="active"><a href="AdvertiseManage.asp"><span class="glyphicon glyphicon-folder-open"></span> 广告管理</a></li> -->
             </ul>
           </div>
         </div>

         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 well wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading">课程查看
                </div>
                <div class="panel-body">
                      <table class="table table-condensed">
                        <thead>
                          <tr>
                            <!-- <th><input type="checkbox"></th> -->
                            <th>#</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>班级</th>
                            <!-- <th>删除</th> -->
                            <th><input type="checkbox" id="allChecked"></th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                        dim courseid
                        
                        courseid=Request.querystring("courseid")
                        
                        sql1 = "select stuno,name,classno from dbo.tabstu where stuno in (select stuno from dbo.tabsel where courseid='"&trim(courseid)&"')"
                        set rs1 = conn.execute(sql1)
                        if not rs1.eof then
                        dim i
                        i = 0
                        do while not rs1.eof 
                        stuno=rs1("stuno")
                        name=rs1("name")
                        classno=rs1("classno")
                        i = i+1
                        %>
                          <tr>
                            <td><%=i%></td>                            
                            <td name="stuno"><%=stuno%></td>
                            <td><%=name%></td>
                            <td><%=classno%></td>
                            <!-- <td><p class="hidden"><%=courseid%></p><button class="btn btn-xs btn-danger deleteStu">删除</button></td> -->
                            <td><input type="checkbox" name="checkList" value="<%=stuno%>"></td>
                          </tr>
                        <%

                        rs1.movenext
                        loop
                        end if
                        %>  
                        </tbody>
                      </table>
                      <p  name="courseid" class="hidden"><%=courseid%></p>
                      <button class="btn btn-sm btn-danger pull-right" id="delStuSave">删除</button>
                </div>
                
            </div>            
         </div>
         

<!--#include virtual=/system/common/footer.asp -->            