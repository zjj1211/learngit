<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/admin-header.asp"-->
<% dim rs,page
 Set rs=Server.CreateObject("ADODB.Recordset")
  '设置rs的ActiveConnection属性，绑定到连接
  Set rs.ActiveConnection = Conn
  '设置游标类型
  rs.CursorType = 3
  '打开记录集
  rs.Open "SELECT id,stuno,name,sex,classname,classno,stu_status_time FROM dbo.tabstu"
   
    '设置每页显示15行记录
  rs.PageSize = 15  
  '读取参数
  page=int(Request.querystring("page"))
  'page=int(Request.form("getpage"))
  pagesum=int(rs.pagecount)
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
  rs.AbsolutePage = page
%>       
       <div class="container-fluid">
         <div class="row">
           <div class="col-sm-3 col-md-2 sidebar well">
             <ul class="nav nav-sidebar">
               <li><a href="AdminIndex.asp"><span class="glyphicon glyphicon-folder-close"></span> 基本信息</a></li>
               <li><a href="TeacherManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 教师管理</a></li>
               <li class="active"><a href="#"><span class="glyphicon glyphicon-folder-open"></span> 学生管理</a></li>
               <li><a href="CourseReview.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程审核</a></li>
               <li><a href="CourseManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程管理</a></li>
               <li><a href="CourseArrange.asp"><span class="glyphicon glyphicon-folder-close"></span> 排课计划</a></li>
               <li><a href="NoticeInformation.asp"><span class="glyphicon glyphicon-folder-close"></span> 公告信息</a></li>
               <li><a href="FrontManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 前台管理</a></li>
               <!-- <li><a href="AdvertiseManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 广告管理</a></li> -->
             </ul>
           </div>
         </div>

         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 well wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading">学生管理
                   <form class="form rectify">
                    <input type="text" class="form-control navbar-form pull-right search" placeholder="搜索。。。" onkeyup ="showHintStu(this.value)">
                  </form>
                   <button class="btn btn-danger btn-sm" margin-right="10px" float="right" value="添加" id="addstudent" onClick="window.location.href='AddStudent.asp'">添加</button>
                </div>
                <div class="panel-body">
                  <table class="table table-condensed table-hover">
                      <thead>
                          <th>序号</th>
                          <th>学号</th>
                          <th>姓名</th>
                          <th>性别</th>
                          <th>班级号</th>
                          <th>班级</th>
                          <th>入学时间</th>
                          <!-- <th>已选课程</th> -->
  <!--                         <th>报名照</th>
                          <th>简介</th> -->
                          <th>操作</th>

                      </thead>
                      <tbody class="studentEdit" id="allStudents">
                       <%

                        For i=1 to rs.pagesize
                        varNo=(page-1)*rs.PageSize+i
                        %>
                        <%
                       dim id,stuno,name,sex,classname,stu_status_time,classno
                       id=rs("id")
                       stuno=rs("stuno")
                       name=rs("name")
                       sex=rs("sex")
                       classno=rs("classno")
                       classname=rs("classname")
                       stu_status_time=rs("stu_status_time")
                       %> 
                        <tr class="stuInfo" >
                          <td><%=CStr(varNo)%></td>
                          <td name="stuno"><%=stuno%></td>
                          <td><%=name%></td>
                          <td><%=sex%></td>
                          <td><%=classno%></td>
                          <td><%=classname%></td>
                          <td><%=stu_status_time%></td>
                          <td><button class="btn btn-success btn-xs stuInfoCat" style="margin-right:3px">查看</button><button class="btn btn-xs btn-warning stuEdit">修改</button></td>
                        </tr> 
                          
                        <%
                          rs.Movenext
                          if rs.eof then exit for 
                          next 

                       %>                       
                      </tbody>
                  </table>
                </div>
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
                    response.write("&nbsp;&nbsp;&nbsp;&nbsp;<li>第<input type='text' class='jumppage' name='getpage'>页<label id='jumpto' class='arrange'>跳转</label></li>")
                    conn.close
                    if conn.state-0 then 
                    end if 
                    '释放connection 对象，关闭数据库
                    Set conn=nothing
                    %>
                  <!--   <div>当前页码：<%=page%></div>    -->               

                  </ul>
                  </form>
                  <!-- Modal -->
                  <div class="modal fade" id="stuModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">本学年课程</h4>
                        </div>
                        <div class="modal-body">
                          <table class="table">
                            <thead>
                              <tr>
                                <th>课程号</th>
                                <th>课程名称</th>
                                <th>课程类型</th>
                              </tr>
                            </thead>
                            <tbody  id="stuDetail">
                              
                            </tbody>
                          </table>
                        </div>
                        
                        <div class="modal-footer">
                          <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                        
                        </div>
                      </div>
                    </div>                    
                  </div>
                  <!--Modal end-->
              </div>                  
            </div>
            
         </div>

                <!-- Modal -->
                <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="stuModalLabel">学生信息</h4>
                      </div>
                      <div class="modal-body">
                        <form role="form" class="form-horizontal">

                          <div class="form-group">
                       <!--      <label id="teanum"><%=teano%></label> -->
                         <!--    <label class="control-label col-sm-2" >学号</label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control" id="stuNo">
                            </div>
                            <label class="control-label col-sm-2" >*</label>
                          </div>
 -->
                            <div class="form-group">
                       <!--      <label id="teanum"><%=teano%></label> -->
                            <label class="control-label col-sm-2" >学生姓名</label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control" id="stuName">
                            </div>
                            <label class="control-label col-sm-2" >*</label>
                          </div>

                          <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-3" >
                               <select id="stuoptionsRadios">
                               <option value="男">男</option>
                               <option value="女">女</option>
                               </select>
                            </div>
                            <label class="control-label col-sm-2" >*</label>
                          </div>

                          <div class="form-group">
                            <label class="control-label col-sm-2" >班级号</label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control" id="classNo">
                            </div>
                            <label class="control-label " >* 格式为：0601代表6年级1班</label>
                          </div>

                          <div class="form-group">
                            <label class="control-label col-sm-2" >班级名称</label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control" id="className">
                            </div>
                            <label class="control-label " >* 格式为：小六(1)班括号为英文半角</label>
                          </div>


                          <div class="form-group">
                            <label class="control-label col-sm-2" >入学时间</label>
                            <div class="col-sm-6">
                              <input type="text" value="2014-03-02 00:00:00.000" class="form-control" id="startTime">
                            </div>
                            <label class="control-label col-sm-4" >* 请保持时间格式，修改年月日即可</label>
                          </div>

                        </form>
                      </div>

                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="saveStuChange">保存修改</button>
                        <button type="button" class="btn btn-danger"  id="delStuno">删除</button>
                      </div>
                    </div>
                  </div>
                </div>         
<!--#include virtual=/system/common/footer.asp -->