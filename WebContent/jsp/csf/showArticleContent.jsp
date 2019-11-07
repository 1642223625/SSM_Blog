<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>${article.title}</title>
<link rel="stylesheet" href="css/bootstrap.css">
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
				<div class="block">
					<p>导航路径：${path}</p>
					<a class="btn btn-primary btn-sm float-right"
						href="csf/editArticle?id=${article.id}">编辑该博文</a>
					<p>博文类型：${article.type}</p>
					<p>博文标题：${article.title}</p>
					<p>博文作者：${article.author}</p>
					<p>发表日期：${article.detailDate}</p>
					<p>浏览人数：${article.browse}</p>
					<p>评论人数：${article.comment}</p>
					<p>喜欢人数：${article.collect}</p>
					<p>博文显示</p>
					<hr />
					<div>${article.HTMLContent}</div>
				</div>
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
							<a href="csf/showContent?id=${article.id}">${article.title}</a>
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
	<footer class="footer d-flex flex-wrap align-content-center mt-2">
		<div class="p-2 text-white w-100 text-center">河南大学2019年大三Javaweb大作业</div>
	</footer>
</body>
</html>