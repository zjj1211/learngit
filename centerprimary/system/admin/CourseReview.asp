<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/admin-header.asp"-->
       
       <div class="container-fluid">
         <div class="row">
           <div class="col-sm-3 col-md-2 sidebar well">
             <ul class="nav nav-sidebar">
               <li><a href="AdminIndex.asp"><span class="glyphicon glyphicon-folder-close"></span> 基本信息</a></li>
               <li><a href="TeacherManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 教师管理</a></li>
               <li><a href="StudentManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 学生管理</a></li>
               <li class="active"><a href="CourseReview.asp"><span class="glyphicon glyphicon-folder-open"></span> 课程审核</a></li>
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
                <div class="panel-heading">课程审核</div>
                <div class="panel-body">
                  <table class="table table-bordered table-striped table-condensed">
                    <thead>
                      <tr>
                        <td>课程号</td>
                        <td>课程名称</td>
                        <td>课程类型</td>
                        <td>申请人</td>
                        <td>课程状态</td>
                        <td>查看详情</td>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                      dim rs,state
                      Set rs=Server.CreateObject("ADODB.Recordset")
                      '设置rs的ActiveConnection属性，绑定到连接
                      Set rs.ActiveConnection = Conn
                      '设置游标类型
                      rs.CursorType = 3
                      '打开记录集
                      rs.open"select id,courseid,course_name,course_type,teaname,checkflag from dbo.tabkcsb order by checkflag"
                      
                      
                        '设置每页显示15行记录
                      rs.PageSize = 15  
                      '读取参数
                        page = CLng(Request.QueryString("page"))
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

                      For i=1 to rs.pagesize
                      state=rs.Fields(5).value
                      if state=0 then
                      state="未审核"
                      else if state=1 then
                      state="审核未通过"
                      else if state=2 then
                      state="通过审核"
                      end if
                      end if
                      end if
                      %>
                      <tr>
                        <td class="hidden" name="id"><%=rs.Fields(0).value%></td>
                        <td><%=rs.Fields(1).value%></td>
                        <td name="name"><%=rs.Fields(2).value%></td>
                        <td><%=rs.Fields(3).value%></td>
                        <td><%=rs.Fields(4).value%></td>
                        <td><%=state%></td>
                        <td><button class="btn btn-xs btn-success courseDetail" data-toggle="modal" data-target="#detailReview">查看详情</button></td>
                      </tr>
                      <%
                      rs.Movenext
                      if rs.eof then exit for 
                      next 
                      %>
                    </tbody>
                  </table>

                  <!-- Modal -->
                  <div class="modal fade" id="detailReview" tabindex="-1" role="dialog" aria-labelledby="detailLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="detailLabel">详细信息</h4>
                        </div>
                        <div class="modal-body">
                          <div>
                            <div id="titleReplace">
                            
                            </div>
                            <div id="contentReplace">
                            
                            </div>
                          </div>  
                          <form role="form" class="form-horizontal">
                            <div class="form-group radio" id="yon">
                              <label class="col-sm-2 control-label">审核意见</label>
                              <label class="col-sm-2 control-label"><input type="radio" value="2" name="optionsRadios" id="optionsRadios1">通过</label>
                              <label class="col-sm-2 control-label"><input type="radio" value="1" name="optionsRadios" id="optionsRadios2">不通过</label>
                              <div class="reason"><textarea class="form-control col-sm-4" rows="3" name="reason"></textarea></div>
                            </div>
                          </form>
                        </div>
                        
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                          <button type="button" class="btn btn-primary" id="submitReview">保存更改</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="bottomNav">
                    <form method="post" action="CourseReview.asp">
                      <ul class="pager">
                          <%'设置第一页链接
                          if page=1 then 
                          response.Write("<li><a href=""#"">首页</a></li>")
                          else
                          response.Write("<li><a href=CourseReview.asp?page=1>首页</a></li>")
                          end if 
                          '设置"上一页"链接
                          if page=1 then 
                          response.Write("<li><a href=""#"">上一页</a></li>")
                          else
                          response.Write("<li><a href=CourseReview.asp?page="&page-1&">上一页</a></li>")
                          end if 
                          response.write("<li><a>"&page&"/"&rs.pagecount&"</a></li>")
                          '设置"下一页"链接
                          if page=rs.pagecount then 
                          response.Write("<li><a href=""#"">下一页</a></li>")
                          else
                          response.Write("<li><a href=CourseReview.asp?page="&page+1&">下一页</a></li>")
                          end if 
                          '设置"最后一页"链接
                          if page=rs.pagecount then 
                          response.write("<li><a href=""#"">末页</a></li>")
                          else
                          response.Write("<li><a href=CourseReview.asp?page="&rs.pagecount&">末页</a></li>")
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
                  </div>
                </div>
                
            </div>            
         </div>




<!--#include virtual=/system/common/footer.asp -->            