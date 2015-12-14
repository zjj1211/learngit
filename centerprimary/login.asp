<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="/database/ConnDB.asp" -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="xy">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <link rel="icon" href="">
	<title>闸北区第一中心小学</title>
	<link rel="stylesheet" type="text/css" href="static/style/bootstrap.min.css">
	<!--[if lte IE 7]>
	<meta http-equiv="refresh" content="0;URL=http://<%=Request.ServerVariables("SERVER_NAME") %>/upgrade.html"/>
	<![endif]-->  
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
	<script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="static/style/index.css">

	<script type="text/javascript" src="static/script/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="static/script/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/script/jquery.flexisel.js"></script>
	<script type="text/javascript" src="static/script/script.js"></script>

</head>
<body>
<section class="login-panel" style="width:330px;margin:0 auto;margin-top:200px;">
	
	<form action="database/putSession.asp" target="_blank" method="post" name="form1" id="form1" class="" >
		<h2>登录</h2>
		<div class="form-group">
			<label>用户名</label>
			<input type="text" class="form-control" name="txtUserName">
		</div>
		<div class="form-group">
			<label>密码</label>
			<input type="password" class="form-control" name="txtPwd">
		</div>
		<button class="btn btn-md btn-primary btn-block" type="submit">登录</button>	
	
		
	</form>
</section>

</body>
</html>