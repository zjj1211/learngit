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
                  <form class="form-horizontal arrangeForm" role="form" action="CourseArrangeResult.asp" method="post">
                    <div class="form-group">
                      <label class="control-label col-sm-2">学年</label>
                      <div class="col-sm-3">
                        <select class="form-control input-sm" name="year" id="tyear">
                          <option value="">学年</option>
                          <%'获取表TermCompare学期年限表单里的数据
                          dim rs 
                          sql="select year from TermCompare"
                          set rs=conn.execute(sql)
                          do while not rs.eof  
                          %>
                          <option><%=rs("year")%></option>
                          <%rs.movenext
                          loop
                          rs.close
                          set rs=nothing
                          %>
                        </select>
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="control-label col-sm-2">学期</label>
                      <div class="col-sm-3">
                        <select class="form-control input-sm" name="term" id="tterm">
                          <option value="">学期</option>
                          <option value="1">第一学期</option>
                          <option value="2">第二学期</option>
                        </select>
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="control-label col-sm-2">年级</label>
                      <div class="col-sm-3">
                        <select class="form-control input-sm" name="grade" id="tgrade">
                          <option value="">年级</option>
                          <option value="01">一年级</option>
                          <option value="02">二年级</option>
                          <option value="03">三年级</option>
                          <option value="04">四年级</option>
                          <option value="05">五年级</option>
                        </select>
                      </div>
                    </div>



                    <div class="form-group">
                      <label class="control-label col-sm-2">筛选条件一</label>
                      <div class="col-sm-3">
                        <select class="form-control input-sm conditions" name="testtype1">
                          <option value="">考试</option>

                        </select>
                      </div>
                      <div class="col-sm-3">  
                        <select class="form-control input-sm " name="subject1">
                          <option value="">学科</option>
                          <option>语文</option>
                          <option>数学</option>
                          <option>外语</option>
                        </select>
                      </div>
                    </div>

                     <div class="form-group">
                      <label class="control-label col-sm-2">筛选条件二</label>
                      <div class="col-sm-3">
                        <select class="form-control input-sm conditions" name="testtype2">
                          <option value="">考试</option>

                        </select>
                      </div>
                      <div class="col-sm-3">  
                        <select class="form-control input-sm" name="subject2">
                          <option value="">学科</option>
                          <option>语文</option>
                          <option>数学</option>
                          <option>外语</option>
                        </select>
                      </div>
                    </div>

                     <div class="form-group">
                      <label class="control-label col-sm-2">筛选条件三</label>
                      <div class="col-sm-3">
                        <select class="form-control input-sm conditions" name="testtype3">
                          <option value="">考试</option>

                        </select>
                      </div>
                      <div class="col-sm-3">  
                        <select class="form-control input-sm" name="subject3">
                          <option value="">学科</option>
                          <option>语文</option>
                          <option>数学</option>
                          <option>外语</option>
                        </select>
                      </div>
                    </div>
                    <div class="progress">
                      <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"  style="width: 0%;">0%</div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-sm-2">A1班</label>
                      <div class="col-sm-3">
                        <select class="form-control input-sm" name="courseid1">
                          <option value="">课程</option>
                          <%
                          dim courseArray(),i
                          
                          sql0 = "select courseid,course_name from dbo.tabcourse where course_type='A' order by course_name"
                          set rs0 = conn.execute(sql0)
                          i=0
                          do while not rs0.eof 
                          redim preserve courseArray(i)                
                          courseArray(i) = trim(rs0("courseid"))&"-"&trim(rs0("course_name"))
                          response.write("<option>"&courseArray(i)&"</option>")
                          i = i+1
                          rs0.movenext
                          loop
                          rs0.close
                          set rs0=nothing
                          %>
                          
                          
                          
                        </select>
                      </div>
                      <div class="col-sm-3">
                        <div class="input-group">
                          <input type="text" class="input-sm form-control percent" name="percent1" placeholder="0"><div class="input-group-addon">%</div>
                        </div>
                      </div>                                           
                    </div>
                    <div class="form-group">
                      <label class="control-label col-sm-2">A2班</label>
                      <div class="col-sm-3">
                        <select class="form-control input-sm" name="courseid2">
                          <option value="">课程</option>
                          <%
                          for i=0 to ubound(courseArray)
                          response.write("<option>"&courseArray(i)&"</option>")
                          next
                          %>
                        </select>
                      </div>
                      <div class="col-sm-3">
                        <div class="input-group">
                          <input type="text" class="input-sm form-control percent" name="percent2" placeholder="0"><div class="input-group-addon">%</div>
                        </div>
                      </div>                                           
                    </div>
                    <div class="form-group">
                      <label class="control-label col-sm-2">A3班</label>
                      <div class="col-sm-3">
                        <select class="form-control input-sm" name="courseid3">
                          <option value="">课程</option>
                          <%
                          for i=0 to ubound(courseArray)
                          response.write("<option>"&courseArray(i)&"</option>")
                          next
                          %>
                        </select>
                      </div>
                      <div class="col-sm-3">
                        <div class="input-group">
                          <input type="text" class="input-sm form-control percent" name="percent3" placeholder="0"><div class="input-group-addon">%</div>
                        </div>
                      </div>                                           
                    </div>
                    <div class="form-group">
                      <label class="control-label col-sm-2">A4班</label>
                      <div class="col-sm-3">
                        <select class="form-control input-sm" name="courseid4">
                          <option value="">课程</option>
                          <%
                          for i=0 to ubound(courseArray)
                          response.write("<option>"&courseArray(i)&"</option>")
                          next
                          %>
                        </select>
                      </div>
                      <div class="col-sm-3">
                        <div class="input-group">
                          <input type="text" class="input-sm form-control percent" name="percent4" placeholder="0"><div class="input-group-addon">%</div>
                        </div>
                      </div>                                           
                    </div>
                    <div class="form-group">
                      <label class="control-label col-sm-2">A5班</label>
                      <div class="col-sm-3">
                        <select class="form-control input-sm" name="courseid5">
                          <option value="">课程</option>
                          <%
                          for i=0 to ubound(courseArray)
                          response.write("<option>"&courseArray(i)&"</option>")
                          next
                          %>
                        </select>
                      </div>
                      <div class="col-sm-3 ">
                        <div class="input-group">
                          <input type="text" class="input-sm form-control percent" name="percent5" placeholder="0"><div class="input-group-addon">%</div>
                        </div>
                      </div>                                           
                    </div> 
                    

                    <div class="form-group">
                      <div class="col-sm-offset-2 col-sm-2">
                        <button class="btn btn-primary toresult" type="submit" >提交</button>
                        <!-- <label id="arrange" class="arrange">提交</label> -->
                        <!-- <button class="btn btn-warning btn-xs " type="reset">重置</button> -->
                      </div>
                    </div>
                  </form>
                
<!--                 <div class="hidden chosenSave pull-right">
                  <button class="btn btn-sm btn-success toSave">保存</button><button class="btn btn-sm btn-danger toCancel">取消</button>
                </div>   -->
                
                </div>
            </div>            
         </div>
       </div>  
       

<!--#include virtual=/system/common/footer.asp -->   