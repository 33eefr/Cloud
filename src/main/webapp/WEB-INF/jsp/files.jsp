<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/css.css">
</head>
<body>
<center>
	<table border="1">
		<caption><a href="showFolder?user_id=${sessionScope.user.user_id}">返回上一级</a></caption>
		<c:if test="${not empty files}">
		<c:forEach items= "${files}" var="files">
			<tr>
				<td>
					<a href="download?fileName=${files.file_name}&user_id=${sessionScope.user.user_id}">${files.file_name}</a>
				</td>
				<td>
					<a href="share?fileName=${files.file_name}&user_id=${sessionScope.user.user_id}">分享链接</a>
				</td>
				<td>
					<form action="move">
						<input type="hidden" name="fileName" value="${files.file_name}">
						<input type="hidden" name="file_id" value="${files.file_id}">
						<input type="hidden" name="user_id" value="${sessionScope.user.user_id}">
						<p style="Float:left;">移动到:</p>
						<input type="text" name="folderName" placeholder="请输入文件夹名" style="Float:left;margin-top: 14px;"/>
						<input type="submit" value="移动" style="Float:left;margin-top: 13px;"/>
					</form>
				</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
</center>
</body>
</html>