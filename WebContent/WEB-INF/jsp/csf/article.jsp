<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>导航路径：${path}</p>
	<p>博文编号：${article.id}</p>
	<p>博文归属：${article.menu_id}</p>
	<p>博文标题：${article.title}</p>
	<p>博文作者：${article.author}</p>
	<p>发表日期：${article.date}</p>
	<p>浏览人数：${article.browse}</p>
	<p>喜欢人数：${article.collect}</p>
	<p>博文内容：${article.content}</p>
</body>
</html>