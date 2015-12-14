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

               %>
             </ul>
           </div>
         </div>

         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 well wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading">学生管理
                  <!-- <form class="form rectify">
                    <input type="text" class="form-control navbar-form pull-right search" placeholder="搜索。。。" onkeyup ="?">
                  </form> -->  
                </div>
                <div class="panel-body">
                  <table class="table table-bordered table-condensed">
                    <thead>
                        <th>#</th>
                        <th>课程号</th>
                        <th>课程名</th>
                        <th>查看</th>
                        
                    </thead>
                    <tbody>
                    
                    <%
                    Dim Courseid,Course_name
                    Set rs=Server.CreateObject("ADODB.Recordset")
                    '设置rs的ActiveConnection属性，绑定到连接
                    Set rs.ActiveConnection = Conn
                    '设置游标类型
                    rs.CursorType = 3
                    rs.open"SELECT courseid,course_name FROM dbo.tabcourse WHERE teano = '"&userId&"'"
                    if rs.eof then 
                    response.write("")
                    else
                    rs.PageSize = 15  
                    '读取参数
                    pagesum=int(rs.pagecount)
                    page=int(Request.querystring("page"))

                    '处理无效页码
                    If page < 1 Then
                      page = 1
                    else if page="" then 
                      page = 1
                    
                    else if page>pagesum then
                      page=pagesum
                    end if
                    end if 
                    end if 
                    '设置当前页
                    rs.AbsolutePage = page

                    for i=1 to rs.PageSize
                    varNo=(page-1)*rs.PageSize+i

                    Courseid=rs("courseid")
                   
                    Course_name = rs("course_name")

                    %>
                        <tr>
                            <td><%=CStr(varNo)%></td>
                            <td class="courseid"><%=Courseid%></td>
                            <td><%=course_name%></td>
                            <td><a href="StudentManageCourse.asp?courseid=<%=Courseid%>"><button class="btn btn-success btn-xs addLoading">查看</button></a></td>

                        </tr>
                      <%
                      rs.movenext
                      if rs.eof then exit for 
                       next 
                       end if
                      %>
                    </tbody>
                </table>
                <div class="bottomNav">
                  <form method="post" action="StudentManage.asp">
                    <ul class="pager">
                      <%'设置第一页链接
                      if page=1 then 
                      response.Write("<li><a href=StudentManage.asp?page=1>首页</a></li>")
                      else
                      response.Write("<li><a href=StudentManage.asp?page=1>首页</a></li>")
                      end if 
                      '设置"上一页"链接
                      if page=1 then 
                      response.Write("<li><a href=""#"">上一页</a></li>")
                      else
                      response.Write("<li><a href=StudentManage.asp?page="&page-1&">上一页</a></li>")
                      end if 
                      response.write("<li><a>"&page&"/"&rs.pagecount&"</a></li>")
                      '设置"下一页"链接
                      if page=rs.pagecount then 
                      response.Write("<li><a href=""#"">下一页</a></li>")
                      else
                      response.Write("<li><a href=StudentManage.asp?page="&page+1&">下一页</a></li>")
                      end if 
                      '设置"最后一页"链接
                      if page=rs.pagecount then 
                      response.write("<li><a href=""#"">末页</a></li>")
                      else
                      response.Write("<li><a href=StudentManage.asp?page="&rs.pagecount&">末页</a></li>")
                      end if 
                      response.write("&nbsp;&nbsp;&nbsp;&nbsp;<li>第<input type='text' class='jumppage' name='getpage'>页<label id='jumpto'>跳转</label></li>")
                      conn.close
                      if conn.state-0 then 
                      end if 
                      '释放connection 对象，关闭数据库
                      Set conn=nothing
                      %>
                    </ul>
                  </form>
                </div>                
                </div>
                
            </div>
            
         </div>
