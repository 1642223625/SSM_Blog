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