<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="aside">
		<!-- 文章归档模块 -->
		<div class="block">
			<span>文章归档</span>
			<hr>
			<div class="d-flex flex-wrap">
				<c:forEach items="${articleDates}" var="date">
					<div class="p-2 width-165">
						<a
							href="main?date=${date}<c:if test="${pageInfo.type!=null}">&type=${pageInfo.type}</c:if>"
							<c:if test="${date == pageInfo.date}">style="color: #717ff9;"</c:if>>${date}</a>
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
		<!-- 标签云模块 -->
		<div class="block">
			<span>标签云</span>
			<hr>
			<div class="d-flex flex-wrap">
				<c:forEach items="${tags}" var="tag">
					<div class="p-2 width-165">
						<a
							href="main?type=${tag.type}<c:if test="${pageInfo.date!=null}">&date=${pageInfo.date}</c:if>"
							<c:if test="${tag.type == pageInfo.type}">style="color: #717ff9;"</c:if>>${tag.type}(${tag.count})</a>
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
		<!-- 猜你喜欢模块 -->
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
		<!-- 友情链接模块 -->
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
</body>
</html>