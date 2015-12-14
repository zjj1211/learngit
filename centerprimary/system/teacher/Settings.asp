<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/teacher-header.asp" -->

       <div class="container-fluid">
         <div class="row">
           <div class="col-sm-3 col-md-2 sidebar well">
             <ul class="nav">
               <li class="active"><a href="TeacherIndex.asp"><span class="glyphicon glyphicon-folder-open"></span> 基本信息</a></li>
               <li><a href="CourseReview.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程申报</a></li>
               
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
                <div class="panel-heading">计划</div>
                <div class="panel-body">
	                <form class="form-horizontal" role="form" method="post" action="">
						<div class="form-group">
							<label class="col-sm-2 control-label">原密码</label>
							<div class="col-sm-3">
								<input type="password" class="form-control input-sm" name="pwd1" placeholder="密码长度6~18位">
							</div>
							<span id="errPwd" class="err"></span>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">新密码</label>
							<div class="col-sm-3">
								<input type="password" class="form-control input-sm" name="pwd2" placeholder="密码长度6~18位">
							</div>
							<span id="errNewPwd" class="err"></span>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">确认新密码</label>
							<div class="col-sm-3">
								<input type="password" class="form-control input-sm" name="pwd3" placeholder="密码长度6~18位">
							</div>
							<span id="errConfirmNewPwd" class="err"></span>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2">
								<button class="btn btn-primary btn-sm" type="submit" id="chgPwd">提交</button>&nbsp;&nbsp;<a href="#">忘记密码？</a>
							</div>
							
						</div>
					</form>
                </div>
            </div>            
         </div>
       </div>  
       

<!--#include virtual="/system/common/footer.asp" -->                