<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/teacher-header.asp"-->

<% dim rs,Grade,Banji
 Set rs=Server.CreateObject("ADODB.Recordset")
  '设置rs的ActiveConnection属性，绑定到连接
  Set rs.ActiveConnection = Conn
  '设置游标类型
  rs.CursorType = 3
  '打开记录集
  rs.Open "SELECT teano,teaname,sex,teachtype,classno,teaimage FROM dbo.tabteach where teano='"&userId&"'"
%>
<%
Dim Teano,Teaname,Teasex,Teachtype,Classno
if not rs.eof then
Teano=rs("teano")
Teaname = rs("teaname")
Teasex = rs("sex")
Teachtype= rs("teachtype")
Classno = rs("classno")


end if
%>
<%
if Left(Classno,2)="01" then
       Grade="小一年级"
     else if Left(Classno,2)="02"  then
        Grade="小二年级"
     else if  Left(Classno,2)="03"   then
          Grade="小三年级"
        else if Left(Classno,2)="04"   then
              Grade="小四年级"
           else if Left(Classno,2)="05"   then
                   Grade="小五年级"
            end if 
         end if 
      end if 
    end if 
  end if 
if  Right(Classno,2)="01" then 
       Banji="一班"
     else if Right(Classno,2)="02" then 
         Banji="二班"
      else if Right(Classno,2)="03" then 
           Banji="三班"
         else if Right(Classno,2)="04" then 
             Banji="四班"
          else if Right(Classno,2)="05" then 
            Banji="五班"
            else if Right(Classno,2)="06" then
            Banji="六班"
           else if Right(Classno,2)="07" then
              Banji="七班" 
              else if Right(Classno,2)="08" then 
                Banji="八班"
                else if Right(Classno,2)="09" then 
                  Banji="九班"
              else if Right(Classno,2)="10" then 
                  Banji="十班"
                   end if 
                 end if 
                 end if 
               end if 
             end if 
           end if 
           end if 
        end if 
      end if 
    end if 
  
%>
      
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
           <div class="col-md-10 col-sm-9 col-sm-offset-3 col-md-offset-2 well wrapper">
            <table class="table">
              <thead>
                <tr>
                  <th>教师号</th>
                  <th>姓名</th>
                  <th>性别</th>
                  <th>职务类型</th>
                  <th>班级</th>
                  <th>
                    <form enctype="multipart/form-data" action="upload.asp?txtid=<%=request.QueryString("txtid")%>" method="post" name="form1">
                      <div style="font-weight:500;">（大小限制在200k以下）</div>
                      <div class="fileBox"><a class="btn btn-xs btn-info">选择照片</a><input class="chooseFile" type="file" name="file1"> <button class="btn btn-xs btn-info upload" type="submit" name="act" value="upload">确定上传</button></div>
                     
                    </form>
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><%=Teano%></td>
                  <td><%=Teaname%></td>
                  <td><%=Teasex%></td>
                  <td><%=Teachtype%></td>
                  <td><%=Grade%><%=Banji%></td>
                  <td><img class="profileimg" src="<%=(rs.Fields.Item("teaimage").Value)%>"></td>
                </tr>

              </tbody>
            </table>
            <table class="table table-bordered">
              <thead>
                <tr>所授课程</tr>
              </thead>
              <tbody>
                 <tr>
                  <%
                  sql1="select courseid,course_name from dbo.tabcourse where teano='"&userId&"'"
                  set rs1=conn.execute(sql1)
                  do while not rs1.eof
                  Courseid = rs1("courseid")
                  Course_name=rs1("course_name")             
                  %>
                  
                    <td><%=courseid%><br/><%=course_name%></td>                            
                  
                  <%
                  rs1.movenext
                  loop
                  %>
                </tr> 
              </tbody>
              
            </table>
           </div>
         
       </div>