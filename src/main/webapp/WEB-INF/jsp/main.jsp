<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>咕咕云盘</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<style type="text/css">
	#img{
		height: 45px;
		width: 60px;
	}
</style>
</head>
<body style="background-image: url('images/background.jpg');">
	<div id="allDiv">
		<div id="headerDiv">
			<img id="banner" src="images/banner.gif" />			
		</div>
		<div id="clearBoth"></div>
		<div id="middleDiv">
			<div id="leftDiv">
				<p style="margin-left: 20px;"><strong> welcome,${sessionScope.user.username}! </strong></p>
				<a href="outLogin" style="margin-left: 50px;"><img src="images/exit.png" style="height: 38px;width: 40px;"/></a>
				<p style="margin-left: 35px;font-size:20px"><a href="showUser" target="abc">用户管理</a></p> 
				<p style="margin-left: 35px;font-size:20px"><a href="selectFileName?user_id=${sessionScope.user.user_id}" target="abc">文件管理</a></p>
				<ul style="font-color:write;font-size:20px">
					<li><a href="showFolder?user_id=${sessionScope.user.user_id}" target="abc"><img id="img" src="images/home.jpg" /></a></li>
					<li style="margin-top: 20px"><a href="selectImagesFileName?user_id=${sessionScope.user.user_id}" target="abc"><img id="img" src="images/images.png" /></a></li>
					<li style="margin-top: 20px"><a href="selectMusicFileName?user_id=${sessionScope.user.user_id}" target="abc"><img id="img" src="images/music.png" /></a></li>
					<li style="margin-top: 20px"><a href="selectVideoFileName?user_id=${sessionScope.user.user_id}" target="abc"><img id="img" src="images/video.jpg" /></a></li>
					<li style="margin-top: 20px"><a href="selectTxtFileName?user_id=${sessionScope.user.user_id}" target="abc"><img id="img" src="images/txt.png" /></a></li>
				</ul></div>
			<div id="rightDiv">
				<div id="topDiv">
					<iframe width="100%" height="100%" name="abc"></iframe>
				</div>
				<div id="bottomDiv">					
					<ul style="margin-left:70px;">
						<li class="li">
							<p style="margin-left: 100px">上传文件</p>
							<form action="uploadMultiple" method="post" enctype="multipart/form-data">
								<input type="hidden" name="user_id" value="${sessionScope.user.user_id}">
								用户名:<input type="text" name="userName" value="${sessionScope.user.username}"/><br><br>
								附件：<input type="file" name="attachment" multiple="multiple"/><br><br>
								<input style="margin-left: 120px;" type="submit" value="提交" />
							</form>
						</li>
						<li class="li">
							<p style="margin-left: 60px">新建文件夹</p>
							<form action="createDir" method="post">
								<input type="hidden" name="user_id" value="${sessionScope.user.user_id}">
								<input type="text" name="folderName" placeholder="请输入文件夹名">
								<input type="submit" value="新建文件夹">
							</form>
						</li><br><br>
						<li class="li">
							<p style="margin-left: 60px">查询文件</p>
							<form action="selectFileById" method="post" target="abc">
								<input type="text" name="file_id" placeholder="请输入文件id"/>
								<input type="submit" value="查询文件">
							</form>
						</li>
					</ul>
				</div>
			</div>
			<div id="clearBoth"></div>
			<div id="footDiv">
				<p style="text-align: center;">ZZGY-QST-Java一班—一组Cloud-Disk</p>
			</div>
		</div>
	</div>
</body>
</html>