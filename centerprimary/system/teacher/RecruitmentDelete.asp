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
                        if courseid<>"" then
                          session("courseid")=courseid
                        else
                        courseid=session("courseid")
                        end if
                        Set rs1=Server.CreateObject("ADODB.Recordset")
                        '设置rs的ActiveConnection属性，绑定到连接
                        Set rs1.ActiveConnection = Conn
                        '设置游标类型
                        rs1.CursorType = 3

                        rs1.open"select stuno,name,classno from dbo.tabstu where stuno in (select stuno from dbo.tabsel where courseid='"&trim(courseid)&"')"
                        if not rs1.eof then

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

                        
                        dim stuno,name,count,classno
                        
                        for i=1 to rs1.PageSize
                        stuno=rs1("stuno")
                        name=rs1("name")
                        classno=rs1("classno")
                        varNo=(page-1)*rs1.PageSize+i
                        
                        %>
                          <tr>
                            <td><%=varNo%></td>                            
                            <td name="stuno"><%=stuno%></td>
                            <td><%=name%></td>
                            <td><%=classno%></td>
                            <!-- <td><p class="hidden"><%=courseid%></p><button class="btn btn-xs btn-danger deleteStu">删除</button></td> -->
                            <td><input type="checkbox" name="checkList" value="<%=stuno%>"></td>
                          </tr>
                        <%

                        rs1.movenext
                        if rs1.eof then exit for 
                        next 
                        end if
                        %>  
                        </tbody>
                      </table>
                      <p  name="courseid" class="hidden"><%=courseid%></p>
                      <button class="btn btn-sm btn-danger pull-right" id="delStuSave">删除</button>
                      <div class="bottomNav">
                  <ul class="pager">
                    <%'设置第一页链接
                    if page=1 then 
                    response.Write("<li><a href=""#"">首页</a></li>")
                    else
                    response.Write("<li><a href=RecruitmentDelete.asp?page=1>首页</a></li>")
                    end if 
                    '设置"上一页"链接
                    if page=1 then 
                    response.Write("<li><a href=""#"">上一页</a></li>")
                    else
                    response.Write("<li><a href=RecruitmentDelete.asp?page="&page-1&">上一页</a></li>")
                    end if 
                    response.write("<li><a>"&page&"/"&rs1.pagecount&"</a></li>")
                    '设置"下一页"链接
                    if page=rs1.pagecount then 
                    response.Write("<li><a href=""#"">下一页</a></li>")
                    else
                    response.Write("<li><a href=RecruitmentDelete.asp?page="&page+1&">下一页</a></li>")
                    end if 
                    '设置"最后一页"链接
                    if page=rs1.pagecount then 
                    response.write("<li><a href=""#"">末页</a></li>")
                    else
                    response.Write("<li><a href=RecruitmentDelete.asp?page="&rs1.pagecount&">末页</a></li>")
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
        </div>

            
<!--#include virtual=/system/common/footer.asp -->