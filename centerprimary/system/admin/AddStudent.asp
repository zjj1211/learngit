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
                	<form name="stuform" id="stuform" method="post" action="AddStudentSave.asp">
                	<table class="table">


                			<tr>
                				<td>学籍号</td>
                				<td><input type="text" name="stuno_sh" id="stuno_sh"></td>
                				<td class="text-left"><font color="red">*</font></td>
                			</tr>

                			<tr>
                				<td>学号</td>
                				<td><input type="text" name="stuno" id="stuno"></td>
                				<td class="text-left"><font color="red">*(学籍号后六位)</font></td>
                			</tr>

                			<tr>
                				<td>学生姓名</td>
                				<td><input type="text" name="name"id="name"></td>
                				<td class="text-left"><font color="red">*</font></td>
                			</tr>

                			<tr>
                				<td>性别*</td>
                				<td>
                					<select id="sex" name="sex">
                						<option value=''>--</option>
                						<option value="男">男</option>
                						<option value="女">女</option>
                					</select></td>
                					<td class="text-left"><font color="red">*</font></td>
                				</tr>

                				<tr>
                					<td>班级号</td>
                					<td><input type="text" name="classno"id="classno"></td>
                					<td class="text-left"><font color="red">*(格式类似：0304)</font></td>
                				</tr>

                				<tr>
                					<td>班级名称</td>
                					<td><input type="text" name="classname"id="classname"></td>
                					<td class="text-left"><font color="red">*(格式类似：小四(五)班 ；其中括号为英文半角状态下的括号)</font></td>
                				</tr>

                				<tr>
                					<td>入学时间</td>
                					<td><input type="text" name="starttime" value="2014-03-02 00:00:00.000" id="starttime"></td>
                					<td class="text-left"><font color="red">*(请根据具体入学自行修改，不要改变原有格式)</font></td>
                				</tr>

                				<tr>
                					<td>毕业时间</td>
                					<td><input type="text" name="endtime"   value="2019-03-02 00:00:00.000" id="endtime"></td>
                					<td class="text-left"><font color="red">*(请根据具体毕业自行修改，不要改变原有格式)</font></td>
                				</tr>


                				<tr>
                					<td>默认登陆密码</td>
                					<td><input type="text" id="password" placeholder="123456" value="123456" name="password"></td>
                					<td class="text-left"><font color="red">*(默认密码)</font></td>
                				</tr>


                			</table>
                			<input type="submit" name="submit" value="提交">
                		</form>
                </div>
                
            </div>            
         </div>                      
<!--#include virtual=/system/common/footer.asp -->   
