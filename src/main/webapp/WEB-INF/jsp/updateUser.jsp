<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户信息</title>
</head>
<body>
	<center>
		<form action="${pageContext.request.contextPath}/updateUser" method="post">
			<input type="hidden" name="user_id" value="${user.user_id}" /> 
			用户名:<input type="text" name="username" value="${user.username}" /><br> 
			密码：<input type="text" name="password" value="${user.password}" /><br> 
			邮箱：<input type="text" name="email" value="${user.email}" /><br> 
			注册时间:<input type="text" name="register_time" value="${user.register_time}" /><br> 
			<input type="submit" value="更新" />
		</form>
		
	</center>
</body>
</html>