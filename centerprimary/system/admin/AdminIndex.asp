<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/admin-header.asp"-->



       <div class="container-fluid">
         <div class="row">
           <div class="col-sm-3 col-md-2 sidebar well">
             <ul class="nav">
               <li class="active"><a href="AdminIndex.asp"><span class="glyphicon glyphicon-folder-open"></span> 基本信息</a></li>
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
          <ul class="nav nav-tabs" role="tablist">
            <li class="active"><a href="#name" role="tab" data-toggle="tab">学校名称</a></li>
            <li><a href="#time" role="tab" data-toggle="tab">时间设置</a></li>
            <li><a href="#grade" role="tab" data-toggle="tab">年级信息</a></li>
            <li><a href="#class" role="tab" data-toggle="tab">班级信息</a></li>
            <li><a href="#subject" role="tab" data-toggle="tab">学科设置</a></li>
            <li><a href="#area" role="tab" data-toggle="tab">场地设置</a></li>
            <li><a href="#sysset" role="tab" data-toggle="tab">系统设置</a></li>
            <li><a href="#copyright" role="tab" data-toggle="tab">版权信息</a></li>
            
          </ul>

          <div class="tab-content">
            <div class="tab-pane active" id="name">
              <p>学校名称：上海市闸北区第一中心小学</p>
            </div>
                <%

                dim schoolYear,term1start,term1end,term2start,term2end
                sql1="select year,Term1Start,Term1End,Term2Start,Term2End from dbo.TermCompare where CurrentTerm=1"
                set rs1=conn.execute(sql1)
                schoolYear=rs1("year")
                term1start=rs1("Term1Start")
                term1end=rs1("Term1End")
                term2start=rs1("Term2Start")
                term2end=rs1("Term2End")
                %>
            <div class="tab-pane fade" id="time">
              <p>当前学年：<%=schoolYear%> </p>
              <span>第一学期：<%=term1start%></span>至<span><%=term1end%></span></br>
              <span>第二学期：<%=term2start%></span>至<span><%=term2end%></span>
              <div>
                <form class="form-horizontal form" method="post">
                  <h3>设置新学年和学期</h3>
                  <div class="form-group">
                    <label class="control-label col-sm-2">学年设置</label> 

                    <div class="input-group col-sm-3">
                      <span class="glyphicon glyphicon-calendar input-group-addon"></span>
                      <select style="width: 200px" type="text" class="form-control" name="schoolyear" id="yearpick" >
                      </select>
                    </div>

                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2">第一学期设置</label>
                    <div class="input-group">
                      <span class="glyphicon glyphicon-calendar input-group-addon"></span><input type="text" style="width: 200px" id="term1set" class="form-control" value="<%=term1start%>~<%=term1end%>" name="term1"/> 
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2">第二学期设置</label>
                    <div class="input-group">
                      <span class="glyphicon glyphicon-calendar input-group-addon"></span><input type="text" style="width: 200px" id="term2set" class="form-control" value="<%=term2start%>~<%=term2end%>" name="term2"/> 
                    </div>
                  </div>

                </form>
                <div class="form-group">
                  <div class="col-sm-offset-2">
                    <button class="btn btn-sm btn-success" id="termSet">确定</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane fade" id="grade">
              <p>增加、修改、删除年级，如“一年级”</p>
              <p>共有年级：5个</p>
              <ul class="infoDisplay">
                
                <li><label class="label label-primary">一年级</label></li>
                <li><label class="label label-primary">二年级</label></li>
                <li><label class="label label-primary">三年级</label></li>
                <li><label class="label label-primary">四年级</label></li>
                <li><label class="label label-primary">五年级</label></li>
              </ul>
            </div>
            <div class="tab-pane fade" id="class">
              <!-- <p>增加、修改、删除班级，如“一（1）班”</p> -->
              <div class="panel-group" id="accordion">
                <div class="panel panel-info">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a href="#collapseOne" data-parent="#accordion" data-toggle="collapse">一年级</a>
                    </h4>
                  </div>

                  <div id="collapseOne" class="panel-collapse collapse in">
                    <div class="panel-body">
                      <table class="table">
                        <tbody>
                          <tr>
                            <td>1班</td>
                            <td>2班</td>
                            <td>3班</td>
                            <td>4班</td>
                            <td>5班</td>
                            <td>6班</td>
                            <td>7班</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                 </div>

                 <div class="panel panel-info">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a href="#collapseTwo" data-parent="#accordion" data-toggle="collapse">二年级</a>
                    </h4>
                  </div>
                  
                  <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                      <table class="table">
                        <tbody>
                          <tr>
                            <td>1班</td>
                            <td>2班</td>
                            <td>3班</td>
                            <td>4班</td>
                            <td>5班</td>
                            <td>6班</td>
                            <td>7班</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    </div>
                  </div>

                <div class="panel panel-info">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a href="#collapseThree" data-parent="#accordion" data-toggle="collapse">三年级</a>
                    </h4>
                  
                  </div>
                  <div id="collapseThree" class="panel-collapse collapse">
                    <div class="panel-body">
                      <table class="table">
                        <tbody>
                          <tr>
                            <td>1班</td>
                            <td>2班</td>
                            <td>3班</td>
                            <td>4班</td>
                            <td>5班</td>
                            <td>6班</td>
                            <td>7班</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>


                <div class="panel panel-info">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a href="#collapseFour" data-parent="#accordion" data-toggle="collapse">四年级</a>
                    </h4>
                  
                  </div>
                  <div id="collapseFour" class="panel-collapse collapse">
                    <div class="panel-body">
                      <table class="table">
                        <tbody>
                          <tr>
                            <td>1班</td>
                            <td>2班</td>
                            <td>3班</td>
                            <td>4班</td>
                            <td>5班</td>
                            <td>6班</td>
                            <td>7班</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>


                <div class="panel panel-info">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a href="#collapseFive" data-parent="#accordion" data-toggle="collapse">五年级</a>
                    </h4>
                  
                  </div>
                  <div id="collapseFive" class="panel-collapse collapse">
                    <div class="panel-body">
                      <table class="table">
                        <tbody>
                          <tr>
                            <td>1班</td>
                            <td>2班</td>
                            <td>3班</td>
                            <td>4班</td>
                            <td>5班</td>
                            <td>6班</td>
                            <td>7班</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>                                
              </div>            
            </div>
            <div class="tab-pane fade" id="subject">
              <p>增加、修改、删除学科名称，如“语文”</p>
              <p>共有学科：6个</p>
              <ul class="infoDisplay">
                
                <li><div><label class="label label-primary ">语文</label></div></li>
                <li><label class="label label-primary">数学</label></li>
                <li><label class="label label-primary">英语</label></li>
                <li><label class="label label-primary">历史</label></li>
                <li><label class="label label-primary">劳技</label></li>
                <li><label class="label label-primary">体育</label></li>

              </ul>

            </div>
            <div class="tab-pane fade" id="area">
              <table class="table table-striped">
                <thead>
                  <th>序号</th>
                  <th>名称</th>
                  <th>地点</th>
                  <th>类型</th>
                  <th>简介</th>
                </thead>
                <tbody>
                  
                  <tr id="addNewItem">
                    <td></td>
                    <td class="areaname"><input type="text" class="form-control input-sm" id="areaName"></td>
                    <td class="areaname"><input type="text" class="form-control input-sm" id="areaSite"></td>
                    <td>
                      <div class="btn-group selectfunc">
                        <select class="form-control input-sm" id="areaFunc">
                          <option>教室</option>
                          <option>专用教室</option>
                          <option>操场</option>
                          <option>多功能厅</option>
                        </select>
                      </div>
                    </td>
                    <td><input type="text" class="form-control input-sm" id="areaDesc"></td>
                    <td><button type="button" class="btn btn-success btn-sm" id="addNewArea">添加</button></td>
                  </tr>
                  <%
                  dim name,func,brief,id,site
                  sql="select id,site,name,type,introduction from dbo.field order by id"
                  set rs=conn.execute(sql)
                  if not rs.eof then
                  do while not rs.eof
                  id=rs("id")
                  name=rs("name")
                  func=rs("type")
                  brief=rs("introduction")
                  site=rs("site")
                  %>
                  <tr>
                    <td class="id"><%=id%></td>
                    <td><%=name%></td>
                    <td><%=site%></td>
                    <td><%=func%></td>
                    <td><%=brief%></td>
                    <td><button class="btn btn-danger btn-sm rowDelete">删除</button></td>
                  </tr>
                  <%
                  rs.movenext
                  loop
                  end if
                  %>
<!--                   <tr>
                    <td>1</td>
                    <td>第一教室</td>
                    <td>教室</td>
                    <td>一年级上课教室</td>
                    <td><button class="btn btn-danger btn-sm rowDelete">删除</button></td>
                  </tr> -->
                </tbody>
              </table>
            </div>
            <%
              dim query,term
              query0 = "select year from TermCompare where CurrentTerm=1"
              set re = conn.execute(query0)
              if not re.eof then
              term = re("year")
              end if
            %>
            <div class="tab-pane fade" id="sysset">
              <div class="row">
                <div class="col-md-offset-1 col-md-10">
                  <table class="table">
                    <tr>
                      <td>学期选课设置</td>
                      <td class="col-md-4">
                      
                        <label><%=term%></label>
                        <label>学期</label>
                        <select>
                          <option>----</option>
                          <option>1</option>
                          <option>2</option>
                        </select>
                        <label>第</label>
                        <select>
                          <option>----</option>
                          <option>1</option>
                          <option>2</option>
                        </select>
                        <label>次选课</label>
                      </td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>选课时间范围</td>
                      <td class="col-md-2"><input type="text" style="width: 190px" id="selecttime" placeholder="" name="selecttime" class="form-control" /> </td>
                      <td><button class="btn btn-sm btn-primary" id="opentime">&nbsp;&nbsp;&nbsp;设置&nbsp;&nbsp;&nbsp;</button></td>
                    </tr>
                    <tr>
                      <td>当前学年学生信息</td>
                      <td><button class="btn btn-sm btn-info backupInfo" value="student">备份</button></td>  
                      <td><button class="btn btn-sm btn-primary" id="go_upgrade">批量升级</button></td>                  
                    </tr>
                    <tr>
                      <td>当前学年选课记录</td>
                      <td><button class="btn btn-sm btn-info backupInfo" value="selcourse">备份</button></td>
                    </tr>
                    <tr>
                      <td>当前学年课程记录</td>
                      <td><button class="btn btn-sm btn-info backupInfo" value="course">备份</button></td>
                    </tr>
                  </table>
                </div>
<!--                 <div class="col-md-5 pull-right">
                  <button class="btn btn-sm btn-primary">批量升级</button>
                </div> -->
              </div>
            </div>
            <div class="tab-pane fade" id="copyright">
              <p>©2014 闸北区第一中心小学 版权所有 沪ICP111111 </p>
            </div>           
          </div>
         </div>
       </div>

       <div class="footer">
         <div class="container" id="copyright">
           <p>©2014 闸北区第一中心小学 版权所有 沪ICP111111 <br/> 技术支持：上海大学L&Z工作室</p>
         </div>
       </div> 
    </body>
</html> 