<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>增加新类型</title>
</head>
<body>
	<div id="addNewType" class="modal fade" tabindex="-1">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body">
	                <button class="close" data-dismiss="modal">
	                    <span>&times;</span>
	                </button>
	            </div>
	            <div class="modal-title">
	                <h1 class="text-center">添加新类型</h1>
	            </div>
	            <div class="modal-body">
                    <div class="form-group">
                        <label for="type">类型名</label>
                        <input id="type" type="text" name="typeName" class="form-control" placeholder="请输入类型名"/>
                    </div>
                    <div class="text-right">
                        <button class="btn mybtn" name="addNewType">确定</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
	            </div>
	        </div>
	    </div>
	</div>
	<script type="text/javascript">
		$(function(){
			$("button[name='addNewType']").click(function(){
				$.getJSON("csf/addNewType", {
					typeName : $("input[name='typeName']").val()
				}, function(res) {
					window.location.reload();
				})
			})
		})
	</script>
</body>
</html>