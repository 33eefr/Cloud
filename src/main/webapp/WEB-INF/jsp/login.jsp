<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
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
				<img src="images/login_logo.png" /></a>
			</div>
			<div class="login_name">
				<p>咕咕云盘</p>
			</div>
			<form action="login" method="post">
				<input name="username" type="text" value="用户名"
					onfocus="this.value=''"
					onblur="if(this.value==''){this.value='用户名'}"> <span
					id="password_text"
					onclick="this.style.display='none';document.getElementById('password').style.display='block';document.getElementById('password').focus().select();">密码</span>
				<input name="password" type="password" id="password"
					style="display: none;"
					onblur="if(this.value==''){document.getElementById('password_text').style.display='block';this.style.display='none'};" />
				<input value="登录" style="width: 100%;" type="submit">
			</form>
		</div>
		<div class="copyright">咕咕有限公司 版权所有©2018-2019 技术支持电话：000-00000000</div>
	</div>
</body>
</html>
