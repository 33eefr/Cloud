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
<title>Insert title here</title>
</head>
<body>
<center>
<table border="1">
	<caption>所有文本</caption>
	<tr>
		<th>文本id</th>
		<th>文本名</th>
		<th>文本路径</th>
		<th>上传用户id</th>
		<th>操作</th>
	</tr>
	<c:if test="${not empty fileNameDoc }">
		<c:forEach items="${fileNameDoc}" var="txtFileName">
			<tr>
				<td>${txtFileName.file_id}</td>
				<td>
				<a href="download?fileName=${txtFileName.file_name}&user_id=${sessionScope.user.user_id}">${txtFileName.file_name}</a></td>
				<td>${txtFileName.file_path}</td>
				<td>${txtFileName.user_id}</td>
				<td>
				<a href="share?fileName=${txtFileName.file_name}&user_id=${sessionScope.user.user_id}">分享链接</a>
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</center>
</body>
</html>