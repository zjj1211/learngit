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
               <li><a href="CourseManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程管理</a></li>
               <li><a href="CourseArrange.asp"><span class="glyphicon glyphicon-folder-close"></span> 排课计划</a></li>
               <li class="active"><a href="NoticeInformation.asp"><span class="glyphicon glyphicon-folder-open"></span> 公告信息</a></li>
               <li><a href="FrontManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 前台管理</a></li>
               <!-- <li><a href="AdvertiseManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 广告管理</a></li> -->
             </ul>
           </div>
         </div>

         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 well wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading">公告信息
                  <!-- <div class="pull-right btn-rectify"><button class="btn btn-success btn-sm" data-toggle="modal" data-target="#detail">增加</button></div> -->
                  <div class="pull-right btn-rectify"><a class="btn btn-success btn-sm" href="NewsAdd.asp?newsId=0!n">增加</a></div>
                </div>
                <div class="panel-body">
                  <div class="row">
                    <div class="col-md-9 col-md-offset-1">
                      <ul class="noticeDisplay" id="noticeDisplay">
                        <!-- <li>关于国庆放假的通知<button class="btn btn-danger btn-xs pull-right">删除</button><button class="btn btn-success btn-xs pull-right">修改</button><p class="pull-right">2014-02-02</p></li> -->
                        <%
                        dim rs,page
                        Set rs=Server.CreateObject("ADODB.Recordset")
                          '设置rs的ActiveConnection属性，绑定到连接
                          Set rs.ActiveConnection = Conn
                          '设置游标类型
                          rs.CursorType = 3
                        rs.open"select Id,Title,PostTime from dbo.Bulletin order by Id desc"

                          rs.PageSize = 15  
                          '读取参数
                          page = CLng(Request.QueryString("page"))
                          '处理无效页码
                          If page < 1 Then
                            page = 1
                          End If
                          If page > rs.PageCount Then
                            page = rs.PageCount
                          End If  
                          '设置当前页
                          rs.AbsolutePage = page

                        For i=1 to rs.pagesize

                        %>                        
                        <li><a class="clickDetail" id="newsDetail" href="NewsAdd.asp?newsId=<%=rs.Fields(0).value%>!n"><%=rs.Fields(1).value%></a><p class="hidden" name="newsId"><%=rs.Fields(0).value%></p><p class="pull-right"><%=rs.Fields(2).value%></p><button class="btn btn-danger btn-xs delete">删除</button></li>
                        <%
                        rs.movenext
                        if rs.eof then exit for 
                        next
                        %>                       
                      </ul>
                    </div>
                  </div>
                  <div class="bottomNav">
                    <ul class="pager">
                     <%'设置第一页链接
                      if page=1 then 
                      response.Write("<li><a href=""#"">第一页</a></li>")
                      else
                      response.Write("<li><a href=NoticeInformation.asp?page=1>第一页</a></li>")
                      end if 
                      '设置"上一页"链接
                      if page=1 then 
                      response.Write("<li><a href=""#"">上一页</a></li>")
                      else
                      response.Write("<li><a href=NoticeInformation.asp?page="&page-1&">上一页</a></li>")
                      end if 
                      response.write("<li><a>"&page&"/"&rs.pagecount&"</a></li>")
                      '设置"下一页"链接
                      if page=rs.pagecount then 
                      response.Write("<li><a href=""#"">下一页</a></li>")
                      else
                      response.Write("<li><a href=NoticeInformation.asp?page="&page+1&">下一页</a></li>")
                      end if 
                      '设置"最后一页"链接
                      if page=rs.pagecount then 
                      response.write("<li><a href=""#"">最后一页</a></li>")
                      else
                      response.Write("<li><a href=NoticeInformation.asp?page="&rs.pagecount&">最后一页</a></li>")
                      end if 

                      conn.close
                      if conn.state-0 then 
                      end if 
                      '释放connection 对象，关闭数据库
                      Set conn=nothing
                      %>
<!--   <div>当前页码：<%=page%></div>    -->               

                      </ul>
                  </div>
                </div>

                  <!-- Modal -->
                  <div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="detailLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="detailLabel">详细信息</h4>
                        </div>
                        <div class="modal-body">
                          <form role="form" class="form-horizontal" id="postNews">
                            <div class="form-group">
                              <label class="control-label col-sm-2">新闻标题</label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="NewsTitle">
                              </div>
                            </div>  
                            <div class="form-group">
                              <label class="control-label col-sm-2">详细内容</label>
                              <div class="col-sm-10">
                                <textarea class="form-control" rows="5" name="NewsContent"></textarea>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-sm-2">发布者</label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="poster">
                              </div>
                            </div>
                          </form>
                        </div>
                        
                        <div class="modal-footer" id="btns">
                          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                          <button type="button" class="btn btn-primary" id="submitbtn">保存更改</button>
                        </div>
                      </div>
                    </div>                    
                  </div>
                  <!--Modal end-->
                  <!-- Modal -->
                  <div class="modal fade" id="NewsEdit" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">详细信息</h4>
                        </div>
                        <div class="modal-body" id="replaceContent">
                          
                        </div>
                        
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                          <button type="button" class="btn btn-primary" id="updateNews">保存更改</button>
                        </div>
                      </div>
                    </div>                    
                  </div>
                  <!--Modal end-->
            </div>  
       
          </div>
        </div>
<!--#include virtual=/system/common/footer.asp -->            