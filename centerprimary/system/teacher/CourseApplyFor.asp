<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/teacher-header.asp"-->

      
             <li><a href="CourseReview.asp"><span class="glyphicon glyphicon-folder-open"></span> 课程申报</a></li>
               
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
         <%
         dim courseid
         courseid = request.querystring("courseid")
         if courseid <> "" then
         sql = "select * from dbo.tabkcsb where courseid='"&courseid&"'"
         set rs = conn.execute(sql)
         if not rs.eof then
          jsbh = rs("teano")
          jsxm = rs("teaname")
          kclx = rs("course_type")
          zsfs = rs("enrolmode")
          skzs = rs("courseweeknum")
          'sksj1 = rs("")
          'sksj2 = rs("")
          'sksj3 = rs("")
          'sksj4 = rs("")
          mxnj = rs("grade")
          kcmc = rs("course_name")
          zxss = rs("coursehour")
          kcxf = rs("credit")
          xzxb = rs("sex_lt")
          xzrs = rs("stucount")
          skdd = rs("areano")
          sxsb = rs("facility")
          jxmb = rs("destination")
          nrzy = rs("substance")
          ssjh = rs("courseplan")

         end if
         end if
         %>
         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 well wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading">课程申报</div>
                <div class="panel-body">
                  <form class="form-horizontal" role="form" method="post" action="CourseResourceSubmit.asp?courseid=<%=courseid%>">
                    <div class="form-group">
                      <label class="col-sm-2 control-label">教师编号</label>
                      <div class="col-sm-2">
                        <input type="text" class="form-control" name="jsbh" value="<%=jsbh%>">
                      </div>

                      <label class="col-sm-2 control-label">教师姓名</label>
                      <div class="col-sm-2">
                        <input type="text" class="form-control" name="jsxm" value="<%=jsxm%>">
                      </div>
                    </div>

                    <div class="form-group"> 
                      <label class="col-sm-2 control-label">课程名称</label>
                      <div class="col-sm-2">
                        <input type="text" class="form-control" name="kcmc" value="<%=kcmc%>">
                      </div>
                                           
                      <label class="col-sm-2 control-label">课程类型</label>
                      <div class="col-sm-2">
                        <select class="form-control" name="kclx">
                          <%
                          dim kclxSelectType
                          select case kclx
                            case "A"
                              kclxSelectType = "跑班"
                            case "B"
                              kclxSelectType = "社团"
                            case "C"
                              kclxSelectType = "普及型拓展课程"
                            case "D"
                              kclxSelectType = "其他"
                            case else
                              kclxSelectType = ""
                          end select                    
                          if kclx <> "" then 
                          %>
                          <option value="<%=kclx%>" selected><%=kclxSelectType%></option>
                          <%
                          end if
                          %>
                          <option>选择类型</option>
                          <option value="A">跑班</option>
                          <option value="B">社团</option>
                          <option value="C">普及型拓展课程</option>
                          <option value="D">其他</option>
                        </select>
                      </div>
                    

                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">上课周数</label>
                      <div class="col-sm-2">
                        <select class="form-control" name="skzs">
                        <%
                        if skzs <> "" then
                        %>
                          <option selected><%=skzs%></option>
                        <%
                        end if
                        %>  
                          <option>6</option>
                          <option>7</option>
                          <option>8</option>
                          <option>18</option>
                          <option>21</option>
                          <option>24</option>
                        </select>
                      </div>
                      <label class="col-sm-2 control-label">招生方式</label>
                      <div class="col-sm-2">
                        <select class="form-control" name="zsfs">
                        <%
                          dim zsfsSelectType
                          select case zsfs
                            case "long"
                              zsfsSelectType = "长课程"
                            case "short"
                              zsfsSelectType = "短课程"
                            case else
                              zsfsSelectType = "无"
                          end select                    
                          if zsfs <> "" then 
                          %>
                          <option value="<%=zsfs%>" selected><%=zsfsSelectType%></option>
                          <%
                          end if
                          %>
                          <option>选择类型</option>
                          <option value="long">长课程</option>
                          <option value="short">短课程</option>                         
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">面向年级</label>
                      <div class="col-sm-6">
                        <label class="checkbox-inline"></label><input type="checkbox" value="1" name="mxnj">一年级
                        <label class="checkbox-inline"></label><input type="checkbox" value="2" name="mxnj">二年级
                        <label class="checkbox-inline"></label><input type="checkbox" value="4" name="mxnj">三年级
                        <label class="checkbox-inline"></label><input type="checkbox" value="8" name="mxnj">四年级
                        <label class="checkbox-inline"></label><input type="checkbox" value="13" name="mxnj">五年级
                      </div>

                    

                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">总学时数</label>
                      <div class="col-sm-2">
                        <input type="text" class="form-control" name="zxss" value="<%=zxss%>">
                      </div>
                    
                      <label class="col-sm-2 control-label">课程学分</label>
                      <div class="col-sm-2">
                        <input type="text" class="form-control" name="kcxf" value="<%=kcxf%>">
                      </div>
                    </div>
                    <div class="form-group">

                      <label class="col-sm-2 control-label">限制性别</label>
                      <div class="col-sm-2">
                        <select class="form-control" name="xzxb">
                          <option>无</option>
                          <option>男</option>
                          <option>女</option>
                          
                        </select>
                      </div>
                    
                      <label class="col-sm-2 control-label">限制人数</label>
                      <div class="col-sm-2">
                        <input type="text" class="form-control" name="xzrs" value="<%=xzrs%>">
                      </div>
                    </div>
                    <div class="form-group">

                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">教学所需设备</label>
                      <div class="col-sm-6">
                        <textarea type="text" class="form-control" rows="3" name="sxsb"><%=sxsb%></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">课程教学目标</label>
                      <div class="col-sm-6">
                        <textarea type="text" class="form-control" rows="3" name="jxmb"><%=jxmb%></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">课程内容摘要</label>
                      <div class="col-sm-6">
                        <textarea type="text" class="form-control" rows="3" name="nrzy"><%=nrzy%></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label">课程实施计划</label>
                      <div class="col-sm-6">
                        <textarea type="text" class="form-control" rows="3" name="ssjh"><%=ssjh%></textarea>
                      </div>
                    </div>
                    <div class="form-group pull-right">
                      <!-- <button class="btn btn-warning" type="reset">重新填写</button> -->
                      <button class="btn btn-success"  id="submitCourse" name="submit">确认提交</button>
                    </div>
                    
                  </form>
                </div>
               <!-- <button id="test">test</button>  -->
            </div>            
         </div>

<!--#include virtual=/system/common/footer.asp -->