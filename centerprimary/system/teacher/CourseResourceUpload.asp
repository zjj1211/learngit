<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/teacher-header.asp"-->
       
       <div class="container-fluid">
         <div class="row">
           <div class="col-sm-3 col-md-2 sidebar well">
             <ul class="nav">
               <li class="active"><a href="TeacherIndex.asp"><span class="glyphicon glyphicon-folder-close"></span> 基本信息</a></li>
               <li><a href="CourseReview.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程申报</a></li>
               
               <!-- <li><a href="EvaluationManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 评价管理</a></li> -->
               <li><a href="CourseResource.asp"><span class="glyphicon glyphicon-folder-open"></span> 课程简介</a></li>
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
                <div class="panel-heading">上传课程资源</div>
                <div class="panel-body">
                  <form class="form form-horizontal" method="post">
                    <div class="form-group">
                      <%
                      dim courseid,coursename,introduction
                      courseid=request.QueryString("courseid")
                      coursename=request.QueryString("coursename")
                      dim rs
                      Set rs=Server.CreateObject("ADODB.Recordset")
                      '设置rs的ActiveConnection属性，绑定到连接
                      Set rs.ActiveConnection = Conn
                      '设置游标类型
                      rs.CursorType = 3
                      '打开记录集
                      rs.Open "SELECT introduction,coursephoto2 FROM dbo.tabcourse where courseid='"&courseid&"'"
                      introduction=rs("introduction")                    
                      %>
                      <label class="col-sm-2 control-label">课程名称</label>
                      <div class="col-sm-10">
                        <p class="courseid pull-left"><%=courseid%></p>
                        <p class="col-sm-2 pull-left"><%=coursename%></p>
                      </div>
                      
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">教学简介</label>
                      <div class="col-sm-10">
                        <!-- <textarea type="text" class="form-control" rows="6" name=""><%=introduction%></textarea> -->
                        <script type="text/plain" id="myEditor" style="width:100%;height:240px;">
                            <p><%=introduction%></p>
                        </script>
                      </div>
                    </div>
                  </form>

                  <button id="submitBrief" class="btn btn-success pull-right">提交</button>
                </div>
            </div>            
         </div>         
<script type="text/javascript">
    //实例化编辑器
    var um = UM.getEditor('myEditor');
</script>
<!--#include virtual=/system/common/footer.asp -->