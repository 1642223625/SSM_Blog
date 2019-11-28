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
<link rel="stylesheet" href="css/wangEditor.css">
<script type="text/javascript" src="js/wangEditor.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<style>
.carousel-inner img {
	width: 100%;
	height: 100%;
}

#article a {
	text-decoration: underline !important;
	color: #007BFF;
}

.large-icon{
	font-size: 1.4em;
}

.w-e-text::-webkit-scrollbar{
	display:none;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<section class="container">
		<div class="coontent-wrap">
			<div class="content">
				<div class="block">
					<p>
						<i class="fa fa-home large-icon"></i> ${path} >
						${article.title}
					</p>
					<hr />				
					<h2 style="line-height: 2em;text-overflow: ellipsis;" title="${article.title}">博文标题：${article.title}</h2>	
					<div>
						<span><i class="fa fa-tag large-icon"></i> ${article.type}</span>&nbsp; &nbsp;
						<span><i class="fa fa-user large-icon"></i> ${article.author}</span>&nbsp; &nbsp;
						<span><i class="fa fa-clock-o large-icon"></i> ${article.detailDate}</span>&nbsp; &nbsp;
						<!-- 每浏览一次浏览次数加一， 但因为没有再次查询数据库，所以直接在前台加一 -->
						<span><i class="fa fa-eye large-icon"></i> ${article.browse+1}</span>&nbsp; &nbsp;
						<span><i class="fa fa-comments large-icon"></i> ${article.comment}</span>&nbsp; &nbsp;
						<span><i class="fa fa-heart large-icon"></i> ${article.collect}</span>
						<div class="pull-right">
							<a class="btn btn-sm mybtn-a btn-info"
							href="csf/editArticle?id=${article.id}">编辑该博文</a>
							<a class="btn btn-sm mybtn-a btn-danger"
							href="csf/deleteArticle?id=${article.id}"
							onclick="return confirm('真的要删除该博文吗？')">删除该博文</a>
						</div>
					</div>
					<hr />
					<div class="w-e-text">${article.HTMLContent}</div>
					<hr>
					<div>评论区</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/aside.jsp"></jsp:include>
		<div class="clear"></div>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>