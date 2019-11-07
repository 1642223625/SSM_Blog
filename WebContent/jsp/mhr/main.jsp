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
<!-- 引用顺序别调换 -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<section class="container">
		<div class="coontent-wrap">
			<div class="content">
				<c:if test="${pageInfo.type==null and pageInfo.date==null}">
					<div class="carousel slide mt-3" data-ride="carousel">
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
						<span>热门排行</span>
						<hr>
						<c:forEach items="${collect}" var="article" varStatus="status">
							<div class="d-flex">
								<div class="p-2">
									<span class="mybutton">${status.count}</span>
								</div>
								<div class="p-2">
									<a href="csf/showArticleContent?id=${article.id}">${article.title}----<i
										class="fa fa-heart"></i>${article.collect}</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
				<c:forEach items="${pageInfo.list}" var="article">
					<div class="block">
						<div class="head">
							<span class="type">${article.type}</span> <a class="title"
								href="csf/showArticleContent?id=${article.id}">${article.title}</a>
						</div>
						<div class="d-flex flex-row">
							<div class="p-2">
								<img width="165px" height="110px" src="images/${article.picUri}"
									alt="${article.title}">
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
				<ul class="pagination">
					<li
						class="page-item <c:if test="${pageInfo.pageNumber==1}">disabled</c:if>"><a
						class="page-link"
						href="main?pageNumber=${pageInfo.pageNumber-1}<c:if test="${pageInfo.type!=null}">&type=${pageInfo.type}</c:if><c:if test="${pageInfo.date!=null}">&date=${pageInfo.date}</c:if>">上一页</a></li>
					<c:forEach items="${pageCount}" varStatus="status">
						<li
							class="page-item <c:if test="${pageInfo.pageNumber==status.count}">active</c:if>"><a
							class="page-link"
							href="main?pageNumber=${status.count}<c:if test="${pageInfo.type!=null}">&type=${pageInfo.type}</c:if><c:if test="${pageInfo.date!=null}">&date=${pageInfo.date}</c:if>">${status.count}</a></li>
					</c:forEach>
					<li
						class="page-item <c:if test="${pageInfo.pageNumber==pageInfo.totalPage}">disabled</c:if>"><a
						class="page-link"
						href="main?pageNumber=${pageInfo.pageNumber+1}<c:if test="${pageInfo.type!=null}">&type=${pageInfo.type}</c:if><c:if test="${pageInfo.date!=null}">&date=${pageInfo.date}</c:if>">下一页</a></li>
				</ul>
			</div>
		</div>
		<div class="aside">
			<div class="block">
				<span>文章归档</span>
				<hr>
				<div class="d-flex flex-wrap">
					<c:forEach items="${articleDates}" var="date">
						<div class="p-2 width-165">
							<a
								href="main?date=${date}<c:if test="${pageInfo.type!=null}">&type=${pageInfo.type}</c:if>"
								<c:if test="${date == pageInfo.date}">style="color: red;"</c:if>>${date}</a>
						</div>
					</c:forEach>
					<c:if test="${pageInfo.date!=null}">
						<div class="p-2 center-block" style="width: 300px">
							<a class="btn btn-sm mybutton"
								href="main<c:if test="${pageInfo.type!=null}">?type=${pageInfo.type}</c:if>">清除日期筛选条件</a>
						</div>
					</c:if>
				</div>
			</div>
			<div class="block">
				<span>标签云</span>
				<hr>
				<div class="d-flex flex-wrap">
					<c:forEach items="${tags}" var="tag">
						<div class="p-2 width-165">
							<a
								href="main?type=${tag.type}<c:if test="${pageInfo.date!=null}">&date=${pageInfo.date}</c:if>"
								<c:if test="${tag.type == pageInfo.type}">style="color: red;"</c:if>>${tag.type}(${tag.count})</a>
						</div>
					</c:forEach>
					<c:if test="${pageInfo.type!=null}">
						<div class="p-2 center-block" style="width: 300px">
							<a class="btn btn-sm mybutton"
								href="main<c:if test="${pageInfo.date!=null}">?date=${pageInfo.date}</c:if>">清除类型筛选条件</a>
						</div>
					</c:if>
				</div>
			</div>
			<div class="block">
				<span>猜你喜欢</span>
				<c:forEach items="${comment}" var="article">
					<hr>
					<div class="d-flex">
						<div class="p-2">
							<img width="99px" height="66px" src="images/${article.picUri}"
								alt="img">
						</div>
						<div class="p-1">
							<a href="csf/showArticleContent?id=${article.id}">${article.title}</a>
						</div>
					</div>
					<div class="d-flex flex-row-reverse"
						style="margin-top: -34px; font-size: 10px;">
						<div class="p-2">
							<i class="fa fa-comments"></i>${article.comment}
						</div>
						<div class="p-2">
							<i class="fa fa-clock-o"></i>${article.date}
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="block">
				<span>友情链接</span>
				<hr>
				<div class="d-flex flex-wrap">
					<c:forEach items="${links}" var="link">
						<div class="p-2 width-165" style="text-align: center;">
							<a href="${link.url}">${link.name}</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>