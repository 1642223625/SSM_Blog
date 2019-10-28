<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath=request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>博客首页</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.css">
<title>index</title>
<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<header class="header">
		<div class="title">
			<h1>xxx技术博客</h1>
		</div>
	</header>
	<nav class="nav">
		<div class="container">
			<nav class="navbar navbar-expand-md bg-white navbar-mystyle">
				<a class="navbar-brand" href="#">SSM_Blog</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">首页</a></li>
						<li class="nav-item mydropdown"><a class="nav-link" href="#">生活笔记</a>
							<div class="mydropdown-content">
								<a class="nav-link" href="#">生活笔记</a> <a class="nav-link"
									href="#">生活笔记</a> <a class="nav-link" href="#">生活笔记</a> <a
									class="nav-link" href="#">生活笔记</a> <a class="nav-link" href="#">生活笔记</a>
								<a class="nav-link" href="#">生活笔记</a>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="#">技术杂谈</a></li>
						<li class="nav-item mydropdown"><a class="nav-link" href="#">技术杂谈</a>
							<div class="mydropdown-content">
								<a class="nav-link" href="#">生活笔记</a> <a class="nav-link"
									href="#">生活笔记</a>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="#">技术杂谈</a></li>
						<li class="nav-item"><a class="nav-link" href="#">技术杂谈</a></li>
						<li class="nav-item"><a class="nav-link" href="#">技术杂谈</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</nav>
	<section class="container">
		<div class="coontent-wrap">
			<div class="content">
				<div id="demo" class="carousel slide mt-3" data-ride="carousel">
					<!-- 指示符 -->
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
						<li data-target="#demo" data-slide-to="3"></li>
					</ul>
					<!-- 轮播图片 -->
					<div class="carousel-inner myrounded">
						<div class="carousel-item  active">
							<img class="myrounded" src="images/img3.jpg">
						</div>
						<div class="carousel-item ">
							<img class="myrounded" src="images/img4.jpg">
						</div>
						<div class="carousel-item ">
							<img class="myrounded" src="images/img5.jpg">
						</div>
						<div class="carousel-item ">
							<img class="myrounded" src="images/img6.jpg">
						</div>
					</div>
					<!-- 左右切换按钮 -->
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
				</div>
				<div class="block">
					<div class="head">
						<span class="type">Java</span> <a class="title" href="">[SSM_Bolg个人博客开发实战]
							前端开发之首页</a>
					</div>
					<div class="d-flex flex-row">
						<div class="p-2">
							<img width="165px" height="110px" src="images/block.jpg" alt="">
						</div>
						<div class="p-2">
							<p>简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介
								简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介
								简介简介简介简介简介简介简介简介简介简介简介简介</p>
						</div>
					</div>
					<div class="d-flex flex-row-reverse" style="margin-top: -20px;">
						<div class="p-2">
							<i class="fa fa-heart"></i> 123
						</div>
						<div class="p-2">
							<i class="fa fa-comments"></i> 12
						</div>
						<div class="p-2">
							<i class="fa fa-eye"></i> 456
						</div>
						<div class="p-2">
							<i class="fa fa-clock-o"></i> 2019-10-28 13:48
						</div>
						<div class="p-2">
							<i class="fa fa-user"></i> 姓名
						</div>
					</div>
				</div>
				<div class="block">文章模块</div>
			</div>
		</div>
		<div class="aside mt-3">侧边栏</div>
		<div class="clear"></div>
	</section>
	<footer class="footer"> 底部 </footer>
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>











<!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="js/javascript.js"></script>
</head>
<body>
	<h1>测试页</h1>
	<button class="test btn-primary">测试JQuery</button>
	<button onclick="test()" class="btn-info">测试JavaScript</button>
	<hr/>
	<p><a href="content">跳转到主页</a></p>
	<hr/>
	<p><a href="showAll">查询全部数据</a></p>
	<hr/>
	<form action="show" method="post">
		输入要查询的id：<input type="number" name="id" required/>
		<input type="submit" value="查询" />
	</form>
	<hr/>
	<form action="delete" method="post">
		输入要删除的姓名：<input type="text" name="name" required/>
		<input type="submit" value="删除" />
	</form>
	<hr/>
	<form action="update" method="post">
		输入待更新姓名的id：<input type="number" name="id" required/>
		输入准备更新的姓名：<input type="text" name="name" required/>
		<input type="submit" value="更新" />
	</form>
	<hr/>
	<form action="insert" method="post">
		输入要新增的姓名：<input type="text" name="name" required/>
		<input type="submit" value="新增" />
	</form>
	<hr/>
	带头像的注册
	<form action="upload" method="post" enctype="multipart/form-data">
		姓名：<input type="text" name="name"/>
		头像：<input type="file" name="portrait">
		<input type="submit" value="注册"/>
	</form>
	<hr/>
	<form action="login" method="post">
		姓名：<input type="text" name="name"/>
		<input type="submit" value="登录"/>
	</form>
	<hr/>
	<a href="download?fileName=file.jpg">点击下载浏览器预置的JPG文件</a>
</body>
</html>
 -->