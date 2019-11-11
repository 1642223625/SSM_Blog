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
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<title>查看评论</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<h1>评论界面</h1>
	<c:forEach items="${comments}" var="comment">
		<%-- <span>评论id：${comment.id}</span> --%>
		<span>内容：${comment.content}</span>
		<span>日期：${comment.date}</span>
		<span>联系方式：${comment.contact}</span>
		<br/>
	</c:forEach>
</body>
</html>