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
	<caption>所有图片</caption>
	<tr>
		<th>图片id</th>
		<th>图片名</th>
		<th>图片路径</th>
		<th>上传用户id</th>
		<th>操作</th>
	</tr>
	<c:if test="${not empty fileNameImage }">
		<c:forEach items="${fileNameImage}" var="imagesFileName">
			<tr>
				<td>${imagesFileName.file_id}</td>
				<td>
				<a href="download?fileName=${imagesFileName.file_name}&user_id=${sessionScope.user.user_id}">${imagesFileName.file_name}</a></td>
				<td>${imagesFileName.file_path}</td>
				<td>${imagesFileName.user_id}</td>
				<td>
				<a href="share?fileName=${imagesFileName.file_name}&user_id=${sessionScope.user.user_id}">分享链接</a>
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</center>
</body>
</html>