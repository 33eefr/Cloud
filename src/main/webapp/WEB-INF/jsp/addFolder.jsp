<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建文件夹</title>
</head>
<body>
	
	<h2>新建文件夹</h2>
	<form class="form-control" action="folderAdd" method="POST" accept-charset="utf-8" >
		文件夹名：<input type="text" name="folderName"/><br/>
		<input type="hidden" name="path" value="${requestScope.folderId}" />
		<input type="submit" value="          新建           " class="button button-3d button-primary button-rounded"/>
	</form>
</body>
</html>