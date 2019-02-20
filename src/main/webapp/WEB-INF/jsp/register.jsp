<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
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
	<form action="register" method="post" name="regForm" onsubmit="return checkForm()" >
		用户名:<input type="text" name="username" id="username"/><br><br>
		
		密码：  <input type="password" name="password" id="password"/><br><br>
		
		确认密码:<input type="password" name="repassword" id="repassword"/><br><br>
		
		邮箱：<input type="text" name="email" id="email"/><br><br>
		
		注册时间:<input type="text" name="registertime" id="registertime"/><br><br>
		
		<input type="submit" value="注册" />
	</form>
</body>
</html>