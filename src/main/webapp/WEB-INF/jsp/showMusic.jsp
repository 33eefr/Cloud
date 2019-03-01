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
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty musicFileName }">
		<c:forEach items="${musicFileName}" var="musicFileName">
		<table>
			<tr>
				<td>
				<a href="download?fileName=${musicFileName.file_name}&user_id=${sessionScope.user.user_id}">${musicFileName.file_name}</a>
				<a href="share?fileName=${musicFileName.file_name}&user_id=${sessionScope.user.user_id}">分享链接</a>
				</td>
			</tr>
		</table>
		</c:forEach>
	</c:if>
</body>
</html>