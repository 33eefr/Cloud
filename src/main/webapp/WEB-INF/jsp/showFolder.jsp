<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="css/css.css">
<style type="text/css">
	a{
		text-decoration:none;
	}
</style>
<title>文件夹</title>
</head>
<body>
<center>
	<table border="1">
	<caption>文件夹展示</caption>
		<tr>
			<th>文件夹id</th>
			<th>文件夹名称</th>
			<th>文件夹路径</th>
			<th>用户id</th>
			<th>操作</th>
		</tr>
		<c:if test="${not empty folders}">
		<c:forEach items= "${folders}" var="folders">
		<tr>
			<td>
				${folders.dir_id}
			</td>
			<td>
				<a href="showFiles?dir_id=${folders.dir_id}">${folders.dir_name}</a>
			</td>
			<td>
				${folders.dir_path}
			</td>
			<td>
				${folders.user_id}
			</td>
			<td>	
				<a href="deleteFolder/${folders.dir_id}?dir_id=${folders.dir_id}">删除</a>
			</td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
</center>
</body>
</html>