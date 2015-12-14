<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/admin-header.asp"-->

       <div class="container-fluid">
         <div class="row">
           <div class="col-sm-3 col-md-2 sidebar well">
             <ul class="nav">
               <li class="active"><a href="AdminIndex.asp"><span class="glyphicon glyphicon-folder-close"></span> 基本信息</a></li>
               <li><a href="TeacherManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 教师管理</a></li>
               <li><a href="StudentManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 学生管理</a></li>
               <li><a href="CourseReview.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程审核</a></li>
               <li><a href="CourseManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程管理</a></li>
               <li><a href="CourseArrange.asp"><span class="glyphicon glyphicon-folder-close"></span> 课程计划</a></li>
               <li><a href="NoticeInformation.asp"><span class="glyphicon glyphicon-folder-close"></span> 公告信息</a></li>
               <li><a href="FrontManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 前台管理</a></li>
               
               <!-- <li><a href="#"><span class="glyphicon glyphicon-folder-close"></span> 类别设定</a></li> -->
             </ul>
           </div>
         </div>
         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 well wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading">课程审核</div>
                <div class="panel-body">         
         <form class="form" name="teaform" id="teaform" method="post" action="AddTeacherSave.asp">
         	<table class="table">

         		<tr>
         			<td>教师号</td>
         			<td class="text-left"><input type="text" name="teano" id="teano"></td>
         		</tr>

         		<tr>
         			<td>教师姓名</td>
         			<td class="text-left"><input type="text" name="teaname"id="teaname"></td>
         		</tr>

         		<tr>
         			<td>性别</td>
         			<td class="text-left">
         				<select id="teasex" name="teasex">
         					<option value=''>--</option>
         					<option value="男">男</option>
         					<option value="女">女</option>
         				</select></td>
         			</tr>

         			<tr>
         				<td>电话</td>
         				<td class="text-left"><input type="text" id="teatel" name="teatel"></td>
         			</tr>

         			<tr>
         				<td>在职状况</td>
         				<td class="text-left">
         					<select id="teatype" name="teatype">
         						<option value=''>--</option>
         						<option value="在职">在职</option>
         						<option value="非在职">非在职</option>
         					</select></td>
         				</tr>

         				<tr>
         					<td>职位类型</td>
         					<td class="text-left">
         						<select id="powertype" name="powertype">
         							<option value=''>--</option>
         							<option value="1">超级管理员</option>
         							<option value="2">管理员</option>
         							<option value="3">班主任</option>
         							<option value="4">教师</option>
         						</select></td>
         					</tr>

         					<tr>
         						<td>教师介绍</td>
         						<td class="text-left"><input type="text" id="teaintro" name="teaintro"></td>
         					</tr>


         				</table>
         				<input class="btn btn-info" type="submit" name="submit" value="提交">
         			</form>
                </div>
                
            </div>            
         </div>
<!--#include virtual=/system/common/footer.asp -->  