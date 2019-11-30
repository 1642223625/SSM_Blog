<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>跳转页</title>
<script type="text/javascript">
	setTimeout(function(){
		location.href="http://<%=InetAddress.getLocalHost().getHostAddress()%>:8080/SSM_Blog/${next}"
	},4500)
	setInterval(() => {
		var num=document.getElementById("num")
		num.innerText=num.innerText-1
	}, 1001);
</script>
</head>
<body>
	<h1>
		操作成功，<span id="num">5</span>秒后为你跳转主页
	</h1>
</body>
</html>