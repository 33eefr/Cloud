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
<title>文件夹</title>
</head>
<body>
	<table>
		<c:if test="${not empty folders}">
		<c:forEach items= "${folders}" var="folders">
			<tr>
				<td>
					<a href="showFiles?dir_id=${folders.dir_id}">${folders.dir_name}</a>
				</td>
				<td>	
					<a href="deleteFolder/${folders.dir_id}?dir_id=${folders.dir_id}">删除</a>
				</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
</body>
</html>