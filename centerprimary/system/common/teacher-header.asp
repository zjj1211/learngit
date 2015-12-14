<!--#include virtual="/database/ConnDB.asp"-->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html">
        <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
        <link rel="icon" href="">
        <title>选课系统</title>
        
        <link href="/static/style/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="/static/style/global.css" rel="stylesheet" type="text/css">
        <link href="/static/style/teacher.css" rel="stylesheet" type="text/css">
        <link href="/static/style/datetimepicker.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="/static/style/daterangepicker-bs3.css">
        <link href="/static/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
        <script src="/static/script/jquery-1.11.1.min.js"></script>
        <script src="/static/script/bootstrap.min.js"></script>
        <script type="text/javascript" src="/static/script/moment.js"></script>
        <script type="text/javascript" src="/static/script/daterangepicker.js"></script>
        <script type="text/javascript" src="/static/script/datetimepicker.js"></script>
        <script type="text/javascript" charset="utf-8" src="/static/script/umeditor.config.js"></script>
        <script type="text/javascript" charset="utf-8" src="/static/script/umeditor.min.js"></script>
        <script type="text/javascript" src="/static/script/teacher.js"></script>
        <script type="text/javascript" src="/static/lang/zh-cn/zh-cn.js"></script>
  <!--[if lte IE 7]>

  <![endif]-->      
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
  <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]--> 
    </head>
    <%
    if session("utype")="" or session("uName")="" or session("userId")="" then
    response.redirect("/index.asp")
    else
    Dim uName1,uflag,userId
    'server对象的createobject方法建立connection对象
    uflag=session("utype")
    uName1=session("uName")
    userId=session("userId")
    end if 

    %>
    <body>
       <div class="navbar navbar-default navbar-fixed-top" role="navigation">
           <div class="container-fluid">           
               <div class="collapse navbar-collapse">
                 <a href="/index.asp"><span class="glyphicon glyphicon-home brand"></span></a> 
                 <ul class="nav navbar-nav navbar-right">
                  <li><a>
                    <span class="glyphicon glyphicon-user"></span> <%=uName1%>
                   </a></li>
                   <li><a href="settings.asp"><span class="glyphicon glyphicon-cog"></span> 设置</a></li>
                   <li><a href="/system/common/logout.asp"><span class="glyphicon glyphicon-log-out"></span> 退出登录</a></li>
                   <li><a href="/system/common/help-admin.asp"><span class="glyphicon glyphicon-question-sign"></span> 查看帮助</a></li>
                  </ul>
                </div>
           </div>
       </div> 
       <div class="jumbotron">
          <div class=""><img src="/static/img/header.jpg"></div>
        </div>         