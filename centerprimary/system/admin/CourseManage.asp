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
                <div class="panel-heading">课程管理<a href="SendPrint.asp" role="button" class="btn btn-sm pull-right print" target="_blank"><span class="glyphicon glyphicon-print pull-right"></span></a></div>
                <div class="panel-body">
                  <table class="table table-condensed">
                    <thead>
                      <tr>
                        <th>序号</th>
                        <th>课程号</th>
                        <th>课程名</th>
                        <th>教师号</th>
                        <th>教师名</th>
                        <th>课程状态</th>
                        <th>课程时间</th>
                        <!-- <th>查看纤细</th> -->
                      </tr>
                    </thead>
                    <tbody>
                    <%
                      sql3 = "select * from field"
                      set rs3 = conn.execute(sql3)
                      dim sitelist
                      if not rs3.eof then
                        do while not rs3.eof
                          sitename = rs3("name")
                          sitedetail = rs3("site")

                          sitelist = sitelist&"<option>"&sitename&sitedetail&"</option>"

                      rs3.movenext
                      loop
                    end if
                    %>



                    <%
                    sql = "select * from dbo.tabcourse order by courseid"
                    set rs = conn.execute(sql)
                    sql2 = "select time_segment from tbltime where status='n'"
                    set rs2 = conn.execute(sql2)
                    cstatus = split(rs2("time_segment"),"-")
                    Tstatus = cstatus(0)&cstatus(1)
                    dim i 
                    i = 0
                    if not rs.eof then 
                      do while not rs.eof
                      courseId = rs("courseid")
                      courseName = rs("course_name")
                      teacherNO = rs("teano")
                      courseStatus = rs("termtime")
                      timeseg = rs("coursetime")

                      if timeseg<>"" then
                        timestart = split(timeseg,"-")(0)
                        timeend = split(timeseg,"-")(1)
                      end if 

                      i = i+1
                      sql1 = "select teaname from dbo.tabteach where teano='"&teacherNO&"'"
                      set rs1 = conn.execute(sql1)

                      if left(courseStatus,8)=Tstatus then
                        nstatus = "本学期在开"
                      else 
                        nstatus = "本学期未开"
                      end if  
                      tweekday = rs("courseweekday")
                    select case tweekday
                      case "Monday"
                        cweekday = "周一"
                      case "Tuesday"
                        cweekday = "周二"
                      case "Wednesday"
                        cweekday = "周三"
                      case "Thursday"
                        cweekday = "周四"
                      case "Friday"
                        cweekday = "周五"
                    end select    



                    %>
                      <tr class="courseClick">
                        <td><%=i%></td>
                        <td name="courseid"><%=courseId%></td>
                        <td><%=courseName%></td>
                        <td><%=teacherNO%></td>
                        <td><%=rs1("teaname")%></td>
                        <td><%=nstatus%></td>
                        <td><%=cweekday%></td>
                        <!-- <td><button class="btn btn-xs btn-success">查看</button></td> -->

                      </tr>
                     <tr class="attachTool info" name="<%=courseId%>">
                       <td colspan="7">
                         <div class="attach">
                           <span><label>星期</label><select class="round weekday"><option value="<%=tweekday%>"><%=cweekday%></option><option value="Monday">一</option><option value="Tuesday">二</option><option value="Wednesday">三</option><option value="Thursday">四</option><option value="Friday">五</option></select></span>
                           <span><label>开始时间</label><input type="text" class="datePicker round date1" style="width:80px;" value="<%=timestart%>"></span>
                           <span><label>结束时间</label><input type="text"  class="datePicker round date2" style="width:80px;" value="<%=timeend%>"></span>
                           <span><label>设置地点</label>
                           <select class="round csite" style="width:200px;">
                           <%

                           %>
                              <%=sitelist%>
                          </select></span>
                           <span class="btns"><button  class="btn btn-xs btn-info saveTimeSite">保存</button><button class="btn btn-xs btn-danger delCourse">删除课程</button><a href="CourseManageDetail.asp?courseid=<%=courseId%>" class="btn btn-xs btn-success">查看学生</a></span>
                         </div>
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
            
<script type="text/javascript">
      $('.datePicker').datetimepicker({
        format:'hh:ii',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
      });

</script>
<!--#include virtual=/system/common/footer.asp -->            