<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>咕咕云盘</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<style type="text/css">
	
</style>
</head>
<body>
	<div id="allDiv">
		<div id="headerDiv">
			<img id="banner" src="images/banner.gif" />
		</div>
		<div id="clearBoth"></div>
		<div id="middleDiv">
			<div id="leftDiv">
				<p style="margin-left: 20px;"><strong> welcome,${sessionScope.user.username}! </strong></p>
				<p style="margin-left: 35px;font-size:20px"><a href="showUser">用户管理</a></p> 
				<p style="margin-left: 35px;font-size:20px">文件管理</p>
				<ul style="font-color:write;font-size:20px">
					<!-- <li style="line-height:25px"><a href="#" target="abc"><img id="photo" src="images/photo.png" /></a></li>
					<li style="line-height:25px"><a href="#" target="_blank"><img id="photo" src="images/music.png" /></a></li>
					<li style="line-height:25px"><a href="#" target="_blank"><img id="photo" src="images/video.png" /></a></li>
					<li style="line-height:25px"><a href="#" target="_blank"><img id="photo" src="images/download.png" /></a></li> -->
					<li style="line-height:50px"><a href="#" target="abc">图片</a></li>
					<li style="line-height:50px"><a href="#" target="_blank">音频</a></li>
					<li style="line-height:50px"><a href="#" target="_blank">视频</a></li>
					<li style="line-height:50px"><a href="#" target="_blank">压缩包</a></li>
				</ul></div>
			<div id="rightDiv">
				<div id="topDiv">
					<iframe width="100%" height="100%" name="abc"></iframe>
				</div>
				<div id="bottomDiv">					
					<ul style="margin-left:5px;">
						<li class="li">
							<form action="upload" method="post" enctype="multipart/form-data">
								用户名:<input type="text" name="userName" value="admin"/><br><br>
								头像：<input type="file" name="userHeader" id="userHeader" /><br><br>
								描述：<textarea rows="4" cols="30" name="description" id="userHeader"></textarea><br><br>
								<input type="submit" value="上传文件" />
							</form>
						</li>
						<li class="li">
							<form action="createDir" method="post">
								<input type="hidden" name="user_id" value="${sessionScope.user.user_id}">
								文件夹名：<input type="text" name="folderName">
								<input type="submit" value="新建文件夹">
							</form>
						</li>
					</ul>
				</div>
			</div>
			<div id="clearBoth"></div>
			<div id="footDiv">底部div</div>
		</div>
	</div>
</body>
</html>