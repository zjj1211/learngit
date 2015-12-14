<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/system/common/header.asp"-->
	<div class="container">
		<div >
			<img src="/static/img/banner.png">
		</div>
		<div class="header"></div>
		<div class="panel panel-success">
			<div class="panel-heading">公告标题</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-4 col-md-3 sidenav">
						<ul class="noticeDisplay noticeNav">
							<!-- <li><a href="">news1</a></li> -->
						
						
							<%
							dim tempid,title,content,posttime,poster,pic,table
							tempid=request.querystring("id")
							table=request.querystring("table")
							if tempid="" then
							tempid=1
							end if
							sql1="select Id,Title from "&table&" order by Id desc"
							set rs1 = conn.execute(sql1)
							
							do while not rs1.eof
							id=rs1("Id")
							title=rs1("Title")
							
							%>
							<li data-toggle="tab" role="presentation"><a role="tab" data-toggle="tab" href="#<%=id%>"><%=title%></a></li>
							<%
							rs1.movenext
							loop
							%>
						</ul>	
					</div>
					<div class="col-sm-8 col-md-9">
						<div class="tab-content">
						<%
						dim tempContent,tempTime,tempPoster
						sql3="select Content,PostTime,Poster from "&table&" where Id="&tempid&""
						set rs3=conn.execute(sql3)
						tempContent=rs3("Content")
						tempPoster=rs3("Poster")
						tempTime=rs3("PostTime")

						%>	
							<div  role="tabpanel" class="tab-pane active" ><p class="noticeContent"><%=tempContent%></p><p class="noticePoster"><%=tempPoster%><br/><%=tempTime%></p></div>
						<%
						Dim iddirect
						sql2="select Id,Content,PostTime,Poster,Picture from "&table&""
						set rs2=conn.execute(sql2)
						do while not rs2.eof
						iddirect=rs2("Id")
						content=rs2("Content")
						posttime=rs2("PostTime")
						poster=rs2("poster")
						%>
						<div  role="tabpanel" class="tab-pane" id="<%=iddirect%>"><p class="noticeContent"><%=content%></p><p class="noticePoster"><%=poster%><br/><%=posttime%></p></div>
						
						<%
						rs2.movenext
						loop
						%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!--#include virtual="/system/common/footer.asp"-->