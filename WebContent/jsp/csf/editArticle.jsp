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
<link rel="stylesheet" href="css/wangEditor.css">
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<style>
.carousel-inner img {
	width: 100%;
	height: 100%;
}

.toolbar {
	border: 1px solid #ccc;
}

.editor {
	border: 1px solid #ccc;
	margin-top: 10px;
	min-height: 400px;
}
</style>
<script type="text/javascript">
	function setContent() {
		$("#HTMLContent").val(editor.txt.html());
		$("#picUri").val($("#showImg").attr("src"));
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
				//设置图片URL，暂存于临时存储区中
				$("#showImg").attr("src", "temp/" + res)
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
					<!-- 该表格组件用于异步上传图片 -->
					<form id="articleForm" enctype="multipart/form-data">
						<input style="display: none;" type="file" id="pic" name="picFile" />
					</form>
					<!-- 该表格组件用于获取博文相关信息 -->
					<form action="csf/updateArticle?add=${add}" method="post">
						<input type="hidden" name="id" value="${article.id}" />
						<input type="hidden" name="browse" value="${article.browse}" />
						<input type="hidden" name="comment" value="${article.comment}" />
						<input type="hidden" name="collect" value="${article.collect}" />
						<input type="hidden" name="HTMLContent" id="HTMLContent" />
						<input type="hidden" name="picUri" id="picUri" />
						<label>
							标题：
							<input name="title" value="${article.title}" size="70" />
						</label>
						<br />
						<label>
							作者：
							<input name="author" value="${article.author}" size="70" />
						</label>
						<br />
						<label>
							博文类型：
							<select name="menuId_Type">
								<c:forEach items="${types}" var="type">
									<c:if test="${type.belong==3}">
										<!-- 每个选项中存储了该选项对应的类型id和类型值 -->
										<option value="${type.id}-${type.name}"
											<c:if test="${type.id eq article.menu_id}">selected</c:if>>${type.name}</option>
									</c:if>
								</c:forEach>
							</select>
						</label>
						<br />
						<label>
							当前的博文显示图片为：<img id="showImg" width="99px" height="66px"
								alt="图片加载失败，请重试。注意：上传文件不要过大" src="images/${article.picUri}" />
						</label>
						<br />
						<label for="pic">
							设置博文图片：<span class="btn btn-sm btn-primary">请选择</span>
						</label>
						<button class="btn btn-sm btn-primary"
							onclick="return uploadPic()">上传</button>
						<label>
							博文简介：
							<textarea name="content" cols="80" rows="5" class="float-right">${article.content}</textarea>
						</label>
						<br />
						<p>博文内容：</p>
						<!-- 富文本组件---始 -->
						<div id="toolbar" class="toolbar"></div>
						<div id="editor" class="editor">
							<p>${article.HTMLContent}</p>
						</div>
						<script type="text/javascript">
							var E = window.wangEditor
							var editor = new E('#toolbar', '#editor')
							editor.customConfig.uploadImgMaxSize = 1 * 1024 * 1024 //图片上传大小限制为1M
							editor.customConfig.uploadImgMaxLength = 1 //限制一次只允许上传一张图片
							editor.customConfig.uploadFileName = 'fileName' //定义上传文件名
							editor.customConfig.uploadImgServer = 'csf/uploadArticlePic?id=${article.id}' //定义服务器地址
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
							//'emoticon', // 表情
							'image', // 插入图片
							//'table', // 表格
							//'video', // 插入视频
							'code', // 插入代码
							'undo', // 撤销
							'redo' // 重复
							]
							editor.create()
						</script>
						<!-- 富文本组件---终-->
						<p></p>
						<center>
							<input type="submit" value="提交" class="btn btn-lg btn-primary"
								onclick="return setContent()" />
						</center>
						<hr>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="../common/aside.jsp"></jsp:include>
		<div class="clear"></div>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>