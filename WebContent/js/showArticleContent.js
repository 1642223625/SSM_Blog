$(function(){
	$("button[name='submit']").click(function(){
		var id = $("input[name='id']").val()
		var authorName = $("input[name='authorName']").val()
		var content = $("textarea[name='content']").val()
		var contact = $("input[name='contact']").val()
		$.getJSON("csf/addComment", {
			id : id,
			authorName : authorName,
			content: content,
			contact: contact
		}, function(date) {
			if (date) {
				var item=new Array();
				item.push("<p><span style='font-weight: bold;'>")
				item.push(authorName)
				item.push("： </span> &nbsp; <span class='pull-right' style='color: #aaa;'> ")
				item.push(date)
				item.push(" </span> &nbsp; <span class='pull-right' style='color: #aaa;margin-right: 2em;'> ")
				item.push(contact)
				item.push(" </span></p><p style='text-indent: 2em;'>")
				item.push(content)
				item.push("</p><hr style='border: 1px dashed #666;'>")
				$("#comments").prepend(item.join(""))
				/*置空*/
				$("input[name='authorName']").val("")
				$("textarea[name='content']").val("")
				$("input[name='contact']").val("")
			} else {
				alert("Failure")
			}
		})
	})
})
function getNewComment(){
	var article_id = $("input[name='id']").val()
	var pageNumber = $("input[name='pageNumber']").val()
	$.getJSON("csf/queryComment", {
		id : article_id,
		pageNumber : parseInt(pageNumber) + 1 //加一代表加载下一部分，中间有一个差值为1
	}, function(res) {
		$("input[name='pageNumber']").val(parseInt(pageNumber)+1)
		if (res.length>0) {
			var item=new Array()
			for(var index in res)
				{
					item.push("<p><span style='font-weight: bold;'>")
					item.push(res[index].authorName)
					item.push("： </span> &nbsp; <span class='pull-right' style='color: #aaa;'> ")
					item.push(res[index].date)
					item.push(" </span> &nbsp; <span class='pull-right' style='color: #aaa;margin-right: 2em;'> ")
					item.push(res[index].contact)
					item.push(" </span></p><p style='text-indent: 2em;'>")
					item.push(res[index].content)
					item.push("</p><hr style='border: 1px dashed #666;'>")
				}
			$("#comments").append(item.join(""))		
		} else {
			alert("全部评论已加载完毕")
			$("input[name='pageNumber']").val(0)//设置标志位为0
		}
	})
}