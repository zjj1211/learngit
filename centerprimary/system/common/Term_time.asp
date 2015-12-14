
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Dim Time_segment,Term_time,T,Tcurrent
sql="select time_segment,status,term_time from tbltime where status='n'"
set myres=conn.execute(sql)
if not myres.eof then
Time_segment=myres("time_segment")
Term_time=myres("term_time")
end if 
T=split(Time_segment,"-")
Tcurrent=T(0)&T(1)&Term_time
%>