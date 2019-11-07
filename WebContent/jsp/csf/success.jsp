<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>操作成功，<span id="num">5</span>秒后为你跳转主页</h1>
	<script type="text/javascript">
	setTimeout(function(){
		location.href="http://localhost:8080/SSM_Blog/${next}"
	},5000)
	setInterval(() => {
		var num=document.getElementById("num")
		num.innerText=num.innerText-1
	}, 1001);
	</script>
</body>
</html>