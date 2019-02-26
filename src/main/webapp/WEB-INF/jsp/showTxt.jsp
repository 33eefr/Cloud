<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty txtFileName }">
		<c:forEach items="${txtFileName}" var="txtFileName">
		<table>
			<tr>
				<td>
				<a href="download?fileName=${txtFileName.file_name}&user_id=${sessionScope.user.user_id}">${txtFileName.file_name}</a>
				<a href="share?fileName=${txtFileName.file_name}&user_id=${sessionScope.user.user_id}">分享链接</a>
				</td>
			</tr>
		</table>
		</c:forEach>
	</c:if>
</body>
</html>