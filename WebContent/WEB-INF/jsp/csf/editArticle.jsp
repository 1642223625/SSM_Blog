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
<title>编辑博文</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/wangEditor.js"></script>
</head>
<body>
	<form action="csf/saveContent" method="post">
		标题：<input name="title" value="${article.title}" /><br /> 作者：<input
			name="author" value="${article.author}" /> <br /> 博文类型：<select
			name="menu_id">
			<c:forEach items="${menus}" var="menu">
				<c:if test="${menu.belong==3}">
					<option value="${menu.id}"
						<c:if test="${menu.id eq article.menu_id}">selected</c:if>>${menu.name}</option>
				</c:if>
			</c:forEach>
		</select> <br />
		<p>博文内容：</p>
		<div id="editor">
			<p>${article.content}</p>
		</div>
		<script type="text/javascript">
			var E = window.wangEditor
			var editor = new E('#editor')
			editor.create()
			function setContent() {
				document.getElementById("content").value = editor.txt.html()
				return true;
			}
		</script>
		<input id="content" type="hidden" name="content"
			value="${article.content}" /> <input type="submit" value="提交"
			class="btn btn-lg btn-primary" onclick="return setContent()" />
	</form>
</body>
</html>