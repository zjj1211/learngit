<%

response.buffer=true

formsize=request.totalbytes

formdata=request.binaryread(formsize)

bncrlf=chrB(13) & chrB(10)

divider=leftB(formdata,clng(instrb(formdata,bncrlf))-1)

datastart=instrb(formdata,bncrlf & bncrlf)+4

dataend=instrb(datastart+1,formdata,divider)-datastart

mydata=midb(formdata,datastart,dataend)


set connGraph=server.CreateObject("ADODB.connection")

connGraph.ConnectionString="driver={Microsoft Access Driver (*.mdb)};DBQ=" &

server.MapPath("images.mdb") & ";uid=;PWD=;"

connGraph.Open


set rec=server.createobject("ADODB.recordset")

rec.Open "SELECT * FROM [images] where id is null",connGraph,1,3

rec.addnew

rec("img").appendchunk mydata

rec.update

rec.close

set rec=nothing

set connGraph=nothing

%>