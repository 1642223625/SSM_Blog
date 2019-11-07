<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${menus}" var="menu">
		<p>${menu.name}</p>
		<c:forEach items="${menu.subMenus}" var="subMenu">
			<p>>>>>${subMenu.name}</p>
		</c:forEach>
	</c:forEach>
</body>
</html>