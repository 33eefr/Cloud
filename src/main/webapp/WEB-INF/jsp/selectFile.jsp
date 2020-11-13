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
	td{
		text-align: center;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<center>
	<table border="1">
		<tr>
			<th>文件id</th>
			<th>文件名</th>
			<th>文件路径</th>
			<th>上传用户id</th>
			<th>操作</th>
		</tr>
		<c:if test="${not empty files}">
		<c:forEach items= "${files}" var="files">
			<tr>
				<td>${files.file_id}</td>
				<td>
					<a href="download?fileName=${files.file_name}&user_id=${sessionScope.user.user_id}">${files.file_name}</a>
				</td>
				<td>${files.file_path}</td>
				<td>${files.user_id}</td>
				<td>
					<a href="deleteFile/${files.file_id}?file_id=${files.file_id}&fileName=${files.file_name}">删除</a>
				
					<a href="share?fileName=${files.file_name}&user_id=${sessionScope.user.user_id}">分享链接</a>
				</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
	<p>注：点击相应文件名可下载文件</p>
	</center>	
</body>
</html>