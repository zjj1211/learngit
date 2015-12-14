  <%

  For i=1 to rs.pagesize
  varNo=(page-1)*rs.PageSize+i
  response.Write("<tr><td>"&CStr(varNo)&"</td><td >"&rs.Fields(1).value&"</td><td>"&rs.Fields(2).value&"</td><td>"&rs.Fields(3).value&"</td><td >"&rs.Fields(4).value&"</td></tr>")
    rs.Movenext
    if rs.eof then exit for 
    next 

    %>
    </table>
  <%'设置第一页链接
  if page=1 then 
  response.write("第一页")
  else
  response.Write("<a href=TeacherManage.asp?page=1>第一页</a>")
  end if 
  '设置"上一页"链接
  if page=1 then 
  response.Write("上一页")
  else
  response.Write("<a href=TeacherManage.asp?page="&page-1&">上一页</a>")
  end if 
  '设置"下一页"链接
  if page=rs.pagecount then 
  response.Write("下一页")
  else
  response.Write("<a href=TeacherManage.asp?page="&page+1&">下一页</a>")
  end if 
  '设置"最后一页"链接
  if page=rs.pagecount then 
  response.write("最后一页")
  else
  response.Write("<a href=TeacherManage.asp?page="&rs.pagecount&">最后一页</a>")
  end if 

  conn.close
  if conn.state-0 then 
  end if 
  '释放connection 对象，关闭数据库
  Set conn=nothing
  %>
  <div>当前页码：<%=page%></div>