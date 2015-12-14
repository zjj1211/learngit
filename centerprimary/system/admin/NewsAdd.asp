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
               <li><a href="NoticeInformation.asp"><span class="glyphicon glyphicon-folder-close"></span> 公告信息</a></li>
               <li class="active"><a href="FrontManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 前台管理</a></li>
               <!-- <li><a href="AdvertiseManage.asp"><span class="glyphicon glyphicon-folder-close"></span> 广告管理</a></li> -->
             </ul>
           </div>


         </div>

         <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 well wrapper">
            <div class="panel panel-primary">
                <div class="panel-heading">前台管理</div>
                <div class="panel-body">
                  <form class="form form-horizontal" method="post">                
                    <div class="form-group">
                    <%
                    dim editInfo
                    editInfo = request.querystring("newsId")
                    if editInfo <> "" then
                    	editArr = split(editInfo,"!")
	                    newsid = editArr(0)

	                    page = editArr(1) 
	                    if page = "n" then
	                    	table = "dbo.Bulletin"  
	                    else 
	                    	table = "dbo.article"	
	                    end if	
                      if newsid <> 0 then
  	                    sql1 = "select * from "&table&" where id="&newsid&""
  	                    set rs1 = conn.execute(sql1)
  	                    title = rs1("Title")
  	                    content = rs1("Content")
                      end if  	                    
	                else 
	                	title = ""
	                	content = ""                     	
                    end if

                    %>                    
                      <label class="col-sm-2 control-label">新闻名称</label>
                      <div class="col-sm-10">
                      	<input type="text" class="form-control input-sm" name="NewsTitle" value ="<%=title%>"><span class="hidden tableName"><%=table%>@<%=newsid%></span>
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-2 control-label">教学简介</label>
                      <div class="col-sm-10">
                        <script type="text/plain" id="Editor" style="width:100%;height:240px;">
                            <p><%=content%></p>
                        </script>
                      </div>
                    </div>
                  </form>

                  <button class="btn btn-success pull-right" id="submitBtn">提交</button>
                </div>
                
            </div>                               
         </div>

		<script type="text/javascript">
		    //实例化编辑器
		    var um = UM.getEditor('Editor');
		</script>
  <!--[if lte IE 6]>
  <script type="text/javascript" src="js/bootstrap-ie.js"></script>
  <![endif]-->   
<!--#include virtual=/system/common/footer.asp -->            