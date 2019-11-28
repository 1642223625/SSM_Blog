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
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/wangEditor.css">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="js/showArticleContent.js"></script>
<style type="text/css">
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

.textarea {
	width: 100%;
	border-radius: 5px;
	height: 80px;
	padding: 6px;
	overflow: auto;
	resize: none;
}

.input_focus{
	border-radius: 4px;
	height: 2.6em;
	border: 1px solid #aaa;
	margin-bottom: 5px;
	padding-left: 6px;
}

.textarea:hover,.input_focus:hover{
	box-shadow: 0 0 2px 2px #717ff9;
}

.bowenTitle{
	line-height: 2em;
	white-space: nowrap;
	text-overflow: ellipsis;
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
						<i class="fa fa-home large-icon"></i> ${path} > ${article.title}
					</p>
					<hr />				
					<h2 class="bowenTitle" title="${article.title}">博文标题：${article.title}</h2>	
					<div>
						<span><i class="fa fa-tag large-icon"></i> ${article.type}</span> &nbsp; &nbsp;
						<span><i class="fa fa-user large-icon"></i> ${article.author}</span> &nbsp; &nbsp;
						<span><i class="fa fa-clock-o large-icon"></i> ${article.detailDate}</span> &nbsp; &nbsp;
						<!-- 每浏览一次浏览次数加一， 但因为没有再次查询数据库，所以直接在前台加一 -->
						<span><i class="fa fa-eye large-icon"></i> ${article.browse+1}</span> &nbsp; &nbsp;
						<span><i class="fa fa-comments large-icon"></i> ${article.comment}</span> &nbsp; &nbsp;
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
					<div>
						<div>
							<input type="hidden" name="id" value="${article.id}"/>
							<textarea class="textarea" name="content" placeholder="想对作者说点什么" required></textarea>
							<input type="text" class="input_focus" name="authorName" size="20" placeholder="昵称" required/>
							<input type="text" class="input_focus" name="contact" size="30" placeholder="联系方式，仅作者可见"/>
							<button class="btn mybtn pull-right" name="submit">发表</button>
						</div>
						<div id="comments">
							<c:forEach items="${comments}" var="comment">
								<p>
									<span style="font-weight: bold;">${comment.authorName}： </span> &nbsp; 
									<span class="pull-right" style="color: #aaa;"> ${comment.date} </span> &nbsp; 
									<span class="pull-right" style="color: #aaa;margin-right: 2em;"> ${comment.contact} </span>
								</p>
								<p style="text-indent: 2em;">${comment.content}</p>
								<hr style="border: 1px dashed #666;">
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/aside.jsp"></jsp:include>
		<div class="clear"></div>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>