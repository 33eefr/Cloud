<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	a{
		text-decoration:none;
	}
</style>
<title>展示所有文件</title>
</head>
<body>
	上传成功
	<table>
		<c:if test="${not empty fileNames}">
		<c:forEach items= "${fileNames}" var="fileNames">
			<tr>
				<td>
					<a href="download?fileName=${fileNames.file_name}&user_id=${sessionScope.user.user_id}">${fileNames.file_name}</a>
				</td>
				<td>
					<a href="deleteFile/${fileNames.file_id}?file_id=${fileNames.file_id}&fileName=${fileNames.file_name}">删除</a>
				</td>
				<td>
					<a href="share?fileName=${fileNames.file_name}&user_id=${sessionScope.user.user_id}">分享链接</a>
				</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
		
	
</body>
</html>