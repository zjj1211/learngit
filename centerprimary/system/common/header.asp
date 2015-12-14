<!--#include virtual="/database/ConnDB.asp" -->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="">
        <title>选课系统</title>
        
        <link href="/static/style/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="/static/style/index.css" rel="stylesheet" type="text/css">
        <!--[if lte IE 7]>
       
        <![endif]-->    
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
        <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript" src="/static/script/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="/static/script/bootstrap.min.js"></script>
        <script src="./static/script/LodopFuncs.js"></script>
        <object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0 class="hidden"> 
        <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
    </object>
    </head>
    <%
    if session("utype")="" or session("uName")="" or session("userId")="" then
    'response.redirect("/index.asp")
    else
    Dim uName1,uflag,userId
    'server对象的createobject方法建立connection对象
    uflag=session("utype")
    uName1=session("uName")
    userId=session("userId")
    end if 

    %>

    <body>
    <% if uflag<>3 or uflag<>4 then %>
        <div class="navbar navbar-ghost">
        <div class="navbar-collapse collapse">
            <div class=" container">
                <!-- <a class="navbar-brand" href="StudentIndex.html"><img src="img/header.png"></a>
                <h1 class="title">学生选课系统</h1> -->
                <form class="nav navbar-form navbar-right form-ctrl" >
                    <% if userId<>"" then %>
                    <div class="form-group">
                        <label>姓名：<%=uName1%>&nbsp;&nbsp;</label>
                    </div>
                    <div class="form-group">
                        <label>学号：<%=userId%>&nbsp;&nbsp;</label>
                    </div>
                    <a href="/system/common/logout.asp" class="btn btn-danger btn-xs">退出</a>
                    <% else %>
                    <div class="form-group">
                        <label for="txtUserName">用户名</label>
                        <input type="text" name="txtUserName" id="txtUserName" placeholder="用户名" class="form-control login">
                    </div>
                    <div class="form-group">
                        <label for="txtPwd">密码</label>
                        <input type="password" name="txtPwd"   id="txtPwd" placeholder="密码" class="form-control login">
                    </div>
                    <input type="submit" name="Submit" onclick="return ChkFields()" class="btn btn-success btn-xs" value="登录"></input>
                    <% end if %>
                </form>
            </div>          
        </div>
    </div>
    <% end if %>