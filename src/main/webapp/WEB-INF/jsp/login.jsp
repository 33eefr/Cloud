<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
<link href="css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="login_box">
		<div class="login_l_img">
			<img src="images/login-img.png" />
		</div>
		<div class="login">
			<div class="login_logo">
				<img src="images/login_logo.png" />
			</div>
			<div class="login_name">
				<p>咕咕云盘</p>
			</div>
			<form action="login" method="post">
				<input name="username" type="text" value="用户名" onfocus="this.value=''" onblur="if(this.value==''){this.value='用户名'}"> 
				<span id="password_text" onclick="this.style.display='none';document.getElementById('password').style.display='block';document.getElementById('password').focus().select();">密码</span>
				<input name="password" type="password" id="password" style="display: none;"
					onblur="if(this.value==''){document.getElementById('password_text').style.display='block';this.style.display='none'};" />
				<input value="登录" style="width: 100%;" type="submit">
			</form>
			<h3>没有账号？>>>>>>>>>>>>>>>>>><a href="toregister">前往注册</a></h3>
		</div>
	</div>
</body>
</html>
