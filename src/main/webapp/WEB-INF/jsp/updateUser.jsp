<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
table {
		width:80%;
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
<title>修改用户信息</title>
</head>
<body>
	<center>
		<form action="${pageContext.request.contextPath}/updateUser" method="post">
			
			<input type="hidden" name="user_id" value="${user.user_id}" /> 
			<table>
				<caption>修改用户信息</caption>
				<tr><td></td><td></td></tr>
				<tr>
					<th>用户名:</th>
					<td><input type="text" name="username" size="30" value="${user.username}" /></td>
				</tr>
				<tr><td></td><td></td></tr>
				<tr>
					<th>密码：</th>
					<td><input type="text" name="password" size="30" value="${user.password}" /></td>
				</tr>
				<tr><td></td><td></td></tr>
				<tr>
					<th>邮箱：</th>
					<td><input type="text" name="email" size="30" value="${user.email}" /></td>
				</tr>
				<tr><td></td><td></td></tr>
				<tr>
					<th>注册时间:</th>
					<td><input type="text" name="register_time" size="30" value="${user.register_time}" /></td>
				</tr>
				<tr><td></td><td></td></tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="更新" />
						<input type="reset" value="重置"/>
						<a href="${pageContext.request.contextPath}/showUser">取消</a>
					</td>
				</tr>
			</table>
		</form>
		
	</center>
</body>
</html>