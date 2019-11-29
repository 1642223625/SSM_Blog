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
<title>编辑 &nbsp; ${article.title}</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/wangEditor.css">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="js/editArticle.js"></script>
<style type="text/css">
.toolbar {
	border: 1px solid #ccc;
  	position: sticky;
  	top: 65px;
  	z-index: 10;
}

.editor {
	border: 1px solid #ccc;
	margin-top: 10px;
	min-height: 400px;
}

.w-e-text::-webkit-scrollbar{
	display:none;
}
</style>
</head>
<body onload="setZIndex()">
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
						<input type="hidden" name="id" value="${article.id}" /> <input
							type="hidden" name="browse" value="${article.browse}" /> <input
							type="hidden" name="comment" value="${article.comment}" /> <input
							type="hidden" name="collect" value="${article.collect}" /> <input
							type="hidden" name="HTMLContent" id="HTMLContent" /> <input
							type="hidden" name="picUri" id="picUri" />
						<div class="form-inline mt-2 input-group-sm">
							<label for="email">标题：</label> 
							<input type="text" class="form-control w-75" name="title" value="${article.title}">
						</div>
						<div class="form-inline mt-2 input-group-sm">
							<label for="email">作者：</label>
							<input type="text"class="form-control w-75" name="author" value="${article.author}">
						</div>
						<div class="form-inline mt-2 input-group-sm">
							<label for="sel1">类型：</label> 
							<select class="form-control w-25" id="sel1" name="menuId_Type">
								<c:forEach items="${types}" var="type">
									<c:if test="${type.belong==3}">
										<option value="${type.id}-${type.name}"
										<c:if test="${type.id eq article.menu_id}">selected</c:if>>${type.name}</option>
									</c:if>
								</c:forEach>
							</select>
							<span data-toggle="modal" data-target="#addNewType" class="mybtn btn-sm ml-2">添加类型</span>
						</div>
						<div class="form-group mt-2">
							<label for="comment">简介：</label>
      						<textarea class="form-control" rows="3" id="comment" name="content">${article.content}</textarea>
    					</div>
    					<label> 设置博文图片：</label><br>
      					<img id="showImg" class="rounded" width="99px" height="66px" alt="图片加载失败，请重试。注意：上传文件不要过大" 
      							src="images/${article.picUri}" />
    					<label for="pic"><span
							class="mybtn btn-sm ml-2">选择图片</span>
						</label>
						<span style="cursor:pointer" class="mybtn btn-sm"
							onclick="return uploadPic()">上传</span><br>
						<label class="mt-2"> 博文内容：</label><br>
						<!-- 富文本组件---始 -->
						<div id="toolbar" class="toolbar rounded"></div>
						<div id="editor" class="editor rounded">
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
						<div class="text-center">
							<input type="submit" style="border:none;width:100px" value="提交" class="btn-lg mybtn"
								onclick="return setContent()" />
						</div>
						<hr>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="../common/aside.jsp"></jsp:include>
		<div class="clear"></div>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<jsp:include page="addNewType.jsp"></jsp:include>
</body>
</html>