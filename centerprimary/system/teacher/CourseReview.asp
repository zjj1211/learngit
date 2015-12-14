<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/teacher-header.asp"-->

       
       <div class="container-fluid">
         <div class="row">
           <div class="col-sm-3 col-md-2 sidebar well">
             <ul class="nav">
               <li class="active"><a href="TeacherIndex.asp"><span class="glyphicon glyphicon-folder-close"></span> 基本信息</a></li>
               <li><a href="CourseReview.asp"><span class="glyphicon glyphicon-folder-open"></span> 课程申报</a></li>
               
               <!-- <li><a href="EvaluationManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 评价管理</a></li> -->
               <li><a href="CourseResource.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程简介</a></li>
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
                <div class="panel-heading">课程查看
                  <a href="CourseApplyFor.asp"><button class="btn btn-xs btn-success pull-right applyfor">课程申报</button></a>
                </div>
                <div class="panel-body">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <td>课程号</td>
                        <td>课程名称</td>
                        <td>课程状态</td>
                        <td>申报时间</td>
                        <td class="col-sm-1"></td>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                       Dim Courseid,Course_name,Checkflag,Checkstate,reason
                       sql="select courseid,course_name,checkflag,reason,modifytime from tabkcsb where teano='"&userId&"' order by checkflag"
                       Set rs = conn.execute(sql)
                       if not rs.eof then
                       do while not rs.eof

                       Courseid=rs("courseid")
                       Course_name=rs("course_name")
                       Checkflag=rs("checkflag")
                       modifytime=rs("modifytime")
                       reason=trim(rs("reason"))
                       if reason="" then
                       reason="无"
                       end if
                       if Checkflag=0 then 
                       Checkstate="未审核"
                      %>
                      <tr>
                        <td name="courseid"><%=Courseid%></td>
                        <td><%=Course_name%></td>
                        <td><%=Checkstate%></td>
                        <td><%=modifytime%></td>
                        <td><button class="btn btn-xs btn-info courseDetail">查看详细</button></td>
                      </tr>
                      <%                       
                        else if Checkflag=1 then
                         Checkstate="未通过"
                      %>
                      <tr>
                        <tr class="forclick danger">
                          <td><%=Courseid%></td>
                          <td><%=Course_name%></td>
                          <td><%=Checkstate%>&nbsp;<span class="glyphicon glyphicon-bell" style="color:#0066CC;"></span></td>
                          <td><%=modifytime%></td>
                          <td><a href="CourseApplyFor.asp?courseid=<%=Courseid%>"><button class="btn btn-xs btn-success">继续申报</button></a></td>
                        </tr>
                        <tr>
                          <td colspan="5" class="slideToggle"><%=reason%></td>
                        </tr>
                      </tr>
                      
                      <%                         
                           else if Checkflag=2 then
                             Checkstate="审核通过"
                      %>
                      <tr>
                        <td name="courseid"><%=Courseid%></td>
                        <td><%=Course_name%></td>
                        <td><%=Checkstate%></td>
                        <td><%=modifytime%></td>
                        <td><button class="btn btn-xs btn-info courseDetail" style="margin:1px;">查看详细</button><a href="CourseApplyFor.asp?courseid=<%=Courseid%>"><button class="btn btn-xs btn-success">课程续开</button></a></td>
                      </tr>
                      <%                             
                           end if
                          end if 
                        end if     
                      
                      rs.movenext
                      loop
                      end if
                      %>
                    </tbody>
                  </table>

                </div>
                
            </div>            
         </div>

          <!-- Modal -->
          <div class="modal fade" id="courseModal" tabindex="-1" role="dialog" aria-labelledby="mLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                  <h4 class="modal-title" id="myModalLabel">课程详情</h4>
                </div>
                <div class="modal-body">
                  <table class='table table-bordered' id="courseContent">
                   
                  </table>
                  
                  
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                  <button type="button" class="btn btn-primary">保存设置</button>
                </div>
              </div>
            </div>

          </div>
