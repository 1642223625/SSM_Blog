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
			// 设置图片URL，暂存于临时存储区中
			$("#showImg").attr("src", "temp/" + res)
		},
		error : function() {
			alert("请求出错");
		}
	});
	return false;
}
function setZIndex(){
	$(".editor").css("z-index","1")
}