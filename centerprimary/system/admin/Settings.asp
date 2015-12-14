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
               <li class="active"><a href="CourseArrange.asp"><span class="glyphicon glyphicon-folder-open"></span> 排课计划</a></li>
               <li><a href="NoticeInformation.asp"><span class="glyphicon glyphicon-folder-close"></span> 公告信息</a></li>
               <li><a href="FrontManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 前台管理</a></li>
               <!-- <li><a href="AdvertiseManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 广告管理</a></li> -->
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
       
<!--#include virtual=/system/common/footer.asp -->            