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
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.css">
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}
</style>
<script type="text/javascript">
	function setContent() {
		document.getElementById("content").value = editor.txt.text()
		document.getElementById("HTMLContent").value = editor.txt.html()
		document.getElementById("picUri").value = $("#img").attr("src")
		return true;
	}
	function uploadPic() {
		var formData = new FormData($("#articleForm")[0])
		formData.append("picFile", $('#pic')[0].files[0])
		$.ajax({
			url : "csf/uploadPic",
			type : "POST",
			contentType : false,
			data : formData,
			processData : false,
			success : function(res) {
				$("#img").attr("src", "temp/" + res)
			},
			error : function() {
				alert("请求出错");
			}
		});
		return false;
	}
</script>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<section class="container">
		<div class="coontent-wrap">
			<div class="content">
				<div class="block">
					<form id="articleForm" enctype="multipart/form-data">
						设置博文图片：<input type="file" id="pic" name="picFile" />
						<button onclick="return uploadPic()">上传</button>
					</form>
					<hr>
					<form action="csf/saveContent" method="post">
						<input type="hidden" name="id" value="${article.id}" /> <input
							type="hidden" name="browse" value="${article.browse}" /> <input
							type="hidden" name="comment" value="${article.comment}" /> <input
							type="hidden" name="collect" value="${article.collect}" /> <input
							type="hidden" name="content" id="content" /> <input type="hidden"
							name="HTMLContent" id="HTMLContent" /> <input type="hidden"
							name="picUri" id="picUri" /> 标题：<input name="title"
							value="${article.title}" size="70"/><br /> 作者：<input name="author"
							value="${article.author}" size="70"/><br /> 博文类型：<select
							name="menuId_Type">
							<c:forEach items="${types}" var="type">
								<c:if test="${type.belong==3}">
									<option value="${type.id}-${type.name}"
										<c:if test="${type.id eq article.menu_id}">selected</c:if>>${type.name}</option>
								</c:if>
							</c:forEach>
						</select> <br /> 当前的博文显示图片为：<img id="img" width="99px" height="66px"
							alt="图片加载失败，请重试。注意：上传文件不要过大" src="images/${article.picUri}" />
						<p>博文内容：</p>
						<div id="editor">
							<p>${article.HTMLContent}</p>
						</div>
						<script type="text/javascript">
							var E = window.wangEditor
							var editor = new E('#editor')
							editor.customConfig.menus = [ 'head', // 标题
							'bold', // 粗体
							'fontSize', // 字号
							'fontName', // 字体
							'italic', // 斜体
							'underline', // 下划线
							'strikeThrough', // 删除线
							'foreColor', // 文字颜色
							'backColor', // 背景颜色
							'link', // 插入链接
							'list', // 列表
							'justify', // 对齐方式
							'quote', // 引用
							'emoticon', // 表情
							'image', // 插入图片
							'table', // 表格
							'video', // 插入视频
							'code', // 插入代码
							'undo', // 撤销
							'redo' // 重复
							]
							editor.create()
						</script>
						<input type="submit" value="提交" class="btn btn-lg btn-primary"
							onclick="return setContent()" />
					</form>
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