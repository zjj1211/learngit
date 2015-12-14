<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/admin-header.asp"-->
  <% dim rs,page,pagesum
  Set rs=Server.CreateObject("ADODB.Recordset")
  '设置rs的ActiveConnection属性，绑定到连接
  Set rs.ActiveConnection = Conn
  '设置游标类型
  rs.CursorType = 3
  '打开记录集
  rs.Open "SELECT id,teano,teaname,sex,teachtype FROM dbo.tabteach"
   
    '设置每页显示15行记录
  rs.PageSize = 15  
  '读取参数
  page = CLng(Request.QueryString("page"))
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
               <li class="active"><a href="TeacherManage.asp"><span class="glyphicon glyphicon-folder-open"></span> 教师管理</a></li>
               <li><a href="StudentManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 学生管理</a></li>
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
                <div class="panel-heading">教师管理<!-- <button class="btn" id="clearblow">clear</button> -->
                  <form class="form rectify">
                    <input type="text" class="form-control navbar-form pull-right search" placeholder="搜索。。。" onkeyup ="showHint(this.value)"><!-- <button type="submit"  name="chaxun" id="chaxun" id="searchTeacher" class="btn btn-xs btn-danger addTeacher">查询</button><button type="reset" name="chongzhi" id="chongzhi" class="btn btn-xs btn-danger addTeacher">清除</button> -->
                  </form>
                  <button class="btn btn-danger btn-sm" margin-right="10px" float="right" value="添加" id="addteacher" onClick="window.location.href='AddTeacher.asp'">添加</button>
                </div>

                <div class="panel-body">
                  <table class="table table-condensed table-hover">
                      <thead>
                          <th>序号</th>
                          <th>教师号</th>
                          <th>教师姓名</th>
                          <th>性别</th>
                          <th>在职类别</th>
                          <th class="col-md-1">所授课程</th>
                          <th class="col-md-1">详细信息</th>
                      </thead>
                      <tbody class="teacherEdit" id="allTeachers">
                      <%

                      For i=1 to rs.pagesize
                      varNo=(page-1)*rs.PageSize+i
                      %>
                      <%
                       dim id,teano,teaname,sex,teachtype
                       id=rs("id")
                       teano=rs("teano")
                       teaname=rs("teaname")
                       sex=rs("sex")
                       teachtype=rs("teachtype")
                       %> 
                        <tr class="teaInfo">
                          <td><%=CStr(varNo)%></td>
                          <td name="teano"><%=teano%></td>
                          <td><%=teaname%></td>
                          <td><%=sex%></td>
                          <td><%=teachtype%></td>
                          <td><button class="viewcourse btn btn-xs btn-info">查看</button></td>
                          <td id="<%=teano%>"><button class="viewtea btn btn-xs btn-warning">编辑</button></td>
                        </tr>  
                      <%
                        rs.Movenext
                        if rs.eof then exit for 
                        next 

                        %>
  <!--                         <tr>
                            <td><input type="text" class="form-control"></td>
                            <td><select class="form-control"><option>男</option><option>女</option></select></td>
                            <td><input type="date" class="form-control"></td>
                            <td><select class="form-control"><option>讲师</option><option>教授</option><option>特级教师</option></select></td>
                            <td><select class="form-control"><option>数学</option><option>语文</option><option>英语</option></select></td>
                            <td></td>
                            <td><input type="text" class="form-control"></td>
                            <td><button class="btn btn-success btn-xs">完成</button></td>
                          </tr> -->
                      </tbody>

                  </table>

                  <div class="bottomNav">

                    <form method="post" action="TeacherManage.asp">
                      <ul class="pager">
                     <%'设置第一页链接

                      if page=1 then 
                      response.Write("<li><a href=""#"">首页</a></li>")
                      else
                      response.Write("<li><a href=TeacherManage.asp?page=1>首页</a></li>")
                      end if 
                      '设置"上一页"链接
                      if page=1 then 
                      response.Write("<li><a href=""#"">上一页</a></li>")
                      else
                      response.Write("<li><a href=TeacherManage.asp?page="&page-1&">上一页</a></li>")
                      end if 
                      response.write("<li><a>"&page&"/"&rs.pagecount&"</a></li>")
                      '设置"下一页"链接
                      if page=rs.pagecount then 
                      response.Write("<li><a href=""#"">下一页</a></li>")
                      else
                      response.Write("<li><a href=TeacherManage.asp?page="&page+1&">下一页</a></li>")
                      end if 
                      '设置"最后一页"链接
                      if page=rs.pagecount then 
                      response.write("<li><a href=""#"">末页</a></li>")
                      else
                      response.Write("<li><a href=TeacherManage.asp?page="&rs.pagecount&">末页</a></li>")
                      end if 
                        response.write("&nbsp;&nbsp;&nbsp;&nbsp;<li>第<input type='text' class='jumppage' name='getpage'>页<label id='jumpto' class='arrange'>跳转</label></li>")
                      conn.close
                      if conn.state-0 then 
                      end if 
                      '释放connection 对象，关闭数据库
                      Set conn=nothing
                      %>
                      </ul>
                    </form>
                  <!-- Modal -->
                  <div class="modal fade" id="teaModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">所授课程</h4>
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
                            <tbody  id="teaDetail">
                              
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
                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="teaModalLabel">教师信息</h4>
                      </div>
                      <div class="modal-body">
                        <form role="form" class="form-horizontal">

                          <div class="form-group">
                            <label class="control-label col-sm-2" >教师姓名</label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control" id="teacherName">
                            </div>
                          </div>

                          <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-3" >

                            <select id="optionsRadios">
                              <option value="男">男</option>
                              <option value="女">女</option>
                            </select>
                            </div>
                            
                          </div>

                          <div class="form-group">
                            <label class="col-sm-2 control-label">在职类别</label>
                            <div class="col-sm-4">
                              <select class="form-control" id="Ttype">
                              <option>在职</option><option>实习</option><option>非在职</option>
                            </select>
                            </div>
                          </div>    
                          <div class="form-group">
                            <label class="col-sm-2 control-label">简介</label>
                            <div class="col-sm-10">
                              <textarea class="form-control" rows="5" id="selfIntroduction"></textarea>
                            </div>
                          </div>
                        </form>
                      </div>

                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="saveTeaChange">保存修改</button>
                        <button type="button" class="btn btn-danger"  id="delTeano">删除</button>
                      </div>
                    </div>
                  </div>
                </div>

            </div>           
         </div>
<!--#include virtual=/system/common/footer.asp -->            