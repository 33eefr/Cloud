<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<link href="css/login.css" rel="stylesheet" type="text/css" />
<script>
			function checkForm(){
				//alert("aa");
				/**校验用户名*/
				//1.获取用户输入的数据
				var uValue = document.getElementById("username").value;
				//alert(uValue);
				if(uValue==""){
					//2.给出错误提示信息
					alert("用户名不能为空!");
					return false;
				}
				
				/*校验密码*/
				var pValue = document.getElementById("password").value;
				if(pValue==""){
					alert("密码不能为空!");
					return false;
				}
				
				/**校验确认密码*/
				var rpValue = document.getElementById("repassword").value;
				if(rpValue!=pValue){
					alert("两次密码输入不一致!");
					return false;
				}
				
				/*校验邮箱*/
				var eValue = document.getElementById("email").value;
				if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/.test(eValue)){
					alert("邮箱格式不正确!");
					return false;
				}
				
			}
			
			
		</script>

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
				<p>文件系统</p>
			</div>
			<form action="register" method="post" name="regForm" onsubmit="return checkForm()">
				<input name="username" type="text" id="username" value="用户名" onfocus="this.value=''" onblur="if(this.value==''){this.value='用户名'}"> 
				<input id="password" type="password" name="password" placeholder="密码"/>
				<input id="repassword" type="password" name="repassword" placeholder="确认密码"/>
				<input name="email" type="text" id="email" value="邮箱" onfocus="this.value=''" onblur="if(this.value==''){this.value='邮箱'}">
				
				<input value="注册" style="width: 100%;" type="submit">
			</form>
			<h3>记得账号>>>>>>>>>>>>>>>>>>><a href="tologin">直接登录</a></h3>
		</div>
	</div>
	<!-- <center>
		<font face="楷体" size="6" color="#000">注册界面</font>
		<form action="register" method="post" name="regForm" onsubmit="return checkForm()" >
		<table>
		<tr>	
			<th>用户名:</th>
			<td><input type="text" name="username" id="username"/></td>
		</tr>
		<tr>	
			<th>密码：</th>
			<td><input type="password" name="password" id="password"/></td>
		<tr>	
			<th>确认密码:</th>
			<td><input type="password" name="repassword" id="repassword"/></td>
		<tr>
			<th>邮箱：</th>
			<td><input type="text" name="email" id="email"/></td>
		</tr>
		<tr>
 			<td colspan = "2" align = "center">
 		  		<input type="submit" value="注  册">    
 		  		<input type="reset" value="重  置">
 			</td>
	  </tr>
		</table>
		</form>
		<h3>记得账号<a href="tologin">直接登录</a></h3>
	</center> -->
	
</body>
</html>