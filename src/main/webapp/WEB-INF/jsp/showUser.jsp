<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	
	table {
		width:90%;
		background:#ccc;
		 margin: 10px auto;
		 border-collapse:collapse;
	}
/*border-collapse:collapse合并内外边距(去除表格单元格默认的2个像素内外边距*/
 	th, td {
		height:25px;
		line-height:25px;
		text-align:center;
		border:1px solid #ccc;
	}
	th {
		background:#eee;
		font-weight:normal;
	}
	tr {
		background:#fff;
	}
	tr:hover {
		background:#cc0;
	}
	td a {
		color:#06f;
		text-decoration:none;
	}
	td a:hover {
		color:#06f;
		text-decoration:underline;
	} 

</style>
<title>用户管理</title>
</head>
<body>
	
	<center>
		<table border="2">
			<caption>用户列表</caption>
			<tr>
				<th>ID</th>
				<th>用户名</th>
				<th>密码</th>
				<th>邮箱</th>
				<th>注册时间</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${lists}" var="user">
				<tr>
					<td>${user.user_id}</td>
					<td>${user.username}</td>
					<td>${user.password}</td>
					<td>${user.email}</td>
					<td>${user.register_time}</td>
					<td> 
						<a href="deleteUser/${user.user_id}">删除</a>
						<a href="selectOneUser/${user.user_id}">修改</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<form action="outLogin">
			<table>
				<tr>
					<td>
						<input type="submit" value="退出登录">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>