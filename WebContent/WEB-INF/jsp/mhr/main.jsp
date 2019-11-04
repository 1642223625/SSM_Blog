<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath() + "/";
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
								<a class="nav-link" href="#">个人随笔</a> <a class="nav-link"
									href="#">个人日记</a> <a class="nav-link" href="#">个人展示</a>
							</div></li>
						<li class="nav-item mydropdown"><a class="nav-link" href="#">技术杂谈</a>
							<div class="mydropdown-content">
								<a class="nav-link" href="#">C/C++</a> <a class="nav-link"
									href="#">Java</a> <a class="nav-link" href="#">PHP</a> <a
									class="nav-link" href="#">HTML</a> <a class="nav-link" href="#">Python</a>
								<a class="nav-link" href="#">JS</a> <a class="nav-link" href="#">Other</a>
							</div></li>
						<li class="nav-item"><a class="nav-link" href="#">福利专区</a></li>
						<li class="nav-item"><a class="nav-link" href="#">关于博主</a></li>
						<li class="nav-item"><a class="nav-link" href="#">给我留言</a></li>
						<li class="nav-item"><a class="nav-link" href="#">给我留言</a></li>
						<li class="nav-item"><a class="nav-link" href="#">赞助作者</a></li>
						<li class="nav-item"><a class="nav-link" href="#">技术交流</a></li>
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
				<c:forEach items="${pageInfo.list}" var="article">
					<div class="block">
						<div class="head">
							<span class="type">${article.type}</span> <a class="title" href="">${article.title}</a>
						</div>
						<div class="d-flex flex-row">
							<div class="p-2">
								<img width="165px" height="110px" src="images/block.jpg" alt="">
							</div>
							<div class="p-2">
								<p>${article.content}</p>
							</div>
						</div>
						<div class="d-flex flex-row-reverse" style="margin-top: -20px;">
							<div class="p-2">
								<i class="fa fa-heart"></i> ${article.collect}
							</div>
							<div class="p-2">
								<i class="fa fa-comments"></i> ${article.comment}
							</div>
							<div class="p-2">
								<i class="fa fa-eye"></i> ${article.browse}
							</div>
							<div class="p-2">
								<i class="fa fa-clock-o"></i> ${article.detailDate}
							</div>
							<div class="p-2">
								<i class="fa fa-user"></i> ${article.author}
							</div>
						</div>
					</div>
				</c:forEach>
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