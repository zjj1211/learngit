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
               <li><a href="Recruitment.asp"><span class="glyphicon glyphicon-folder-open"></span> 招生管理</a></li>
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
                <div class="panel-heading">招生管理</div>
                <div class="panel-body">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>课程号</th>
                      <th>课程名称</th>
                      <th>已选/限制人数</th>
                      <th>添加/删除学生</th>
                    </tr>
                  </thead>
                  <tbody>
<!--                     <tr>
                      <td>1</td>
                      <td>A0092j</td>
                      <td>math</td>
                      <td>28</td>
                      <td><button>add</button></td>
                    </tr> -->
                    <%
                    dim courseId,courseName,studentSum,i,currentNum,page
                    Set rs1=Server.CreateObject("ADODB.Recordset")
                    '设置rs的ActiveConnection属性，绑定到连接
                    Set rs1.ActiveConnection = Conn
                    '设置游标类型
                    rs1.CursorType = 3
                    rs1.open"select courseid,course_name,stucount,current_num from dbo.tabcourse where teano="&userId&""
                    if rs1.eof then 
                    response.write("")
                    else
                  '设置每页显示15行记录
                    rs1.PageSize = 15  
                    '读取参数
                    page=int(Request.querystring("page"))
                    'page=int(Request.form("getpage"))
                    pagesum=int(rs1.pagecount)
                    '处理无效页码
                    If page < 1 Then
                      page = 1
                    else if page="" then 
                      page=1
                    
                    else if page>pagesum then
                      page=pagesum
                    end if
                    end if 
                    end if 
                    '设置当前页
                    rs1.AbsolutePage = page
                    
                    for i=1 to rs1.PageSize

                    courseId=rs1("courseid")
                    courseName=rs1("course_name")
                    studentSum=rs1("stucount")
                    currentNum=rs1("current_num")
                    
                    if currentNum="" then 
                    currentNum=0
                    end if

                    sql0 = "select count(courseid) as cnum from dbo.tabsel where courseid='"&courseId&"'"
                    set rs0 = conn.execute(sql0)
                    currentNum = rs0("cnum")

                    %>
                    <tr>
                      <td><%=i%></td>
                      <td class="courseid"><%=courseId%></td>
                      <td><%=courseName%></td>
                      <td><%=currentNum%>/<%=studentSum%></td>
                      <td>
                    <%
                      if currentNum<studentSum then                      
                    %>    
                        <a href="RecruitmentSelect.asp?courseid=<%=courseId%>"><button class="btn btn-xs btn-success moreinfo"><span class="glyphicon glyphicon-plus"></span></button></a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <%
                      else 
                    %>    
                        <a href="#"><button class="btn btn-xs btn-success moreinfo" disabled><span class="glyphicon glyphicon-plus"></span></button></a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <%
                      end if
                    %>

                    <%
                      dim temp
                      temp = left(trim(courseId),1)
                      if temp="C" or temp="D" then
                    %>  
                        <a href="RecruitmentDelete.asp?courseid=<%=courseId%>"><button class="btn btn-xs btn-danger moreinfo"><span class="glyphicon glyphicon-minus"></span></button></a>
                    <%
                      else
                    %>
                        <a href="#"><button class="btn btn-xs btn-danger moreinfo" disabled><span class="glyphicon glyphicon-minus"></span></button></a>
                    <%
                    end if
                    %>                          
                      </td>
                    </tr>
                    <%
                    rs1.movenext
                    if rs1.eof then exit for 
                    next 
                    end if
                    %>
                  </tbody>
                </table>
                </div>   
                <div class="bottomNav">
                  <ul class="pager">
                    <%'设置第一页链接
                    if page=1 then 
                    response.Write("<li><a href=""#"">首页</a></li>")
                    else
                    response.Write("<li><a href=Recruitment.asp?page=1>首页</a></li>")
                    end if 
                    '设置"上一页"链接
                    if page=1 then 
                    response.Write("<li><a href=""#"">上一页</a></li>")
                    else
                    response.Write("<li><a href=Recruitment.asp?page="&page-1&">上一页</a></li>")
                    end if 
                    response.write("<li><a>"&page&"/"&rs1.pagecount&"</a></li>")
                    '设置"下一页"链接
                    if page=rs1.pagecount then 
                    response.Write("<li><a href=""#"">下一页</a></li>")
                    else
                    response.Write("<li><a href=Recruitment.asp?page="&page+1&">下一页</a></li>")
                    end if 
                    '设置"最后一页"链接
                    if page=rs1.pagecount then 
                    response.write("<li><a href=""#"">末页</a></li>")
                    else
                    response.Write("<li><a href=Recruitment.asp?page="&rs1.pagecount&">末页</a></li>")
                    end if 
                    response.write("&nbsp;&nbsp;&nbsp;&nbsp;<li>第<input type='text' class='jumppage' name='getpage'>页<label id='jumpto' class='arrange'>跳转</label></li>")
                    conn.close
                    if conn.state-0 then 
                    end if 
                    '释放connection 对象，关闭数据库
                    Set conn=nothing
                    %>
                  </ul>
                </div>                              
            </div>             
          </div>
        </div>
