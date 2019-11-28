$(function() {
	var heartArray = [ true, true, true, true, true, true, true, true, true,
			true ]
	$(".heart").click(function() {// 点赞功能
		var _this = $(this)
		var count = _this.text()
		var status = heartArray[_this.attr("tabindex")]
		heartArray[_this.attr("tabindex")] = !status
		if (status) {
			count++;
		} else {
			count--;
		}
		$.getJSON("csf/changeHeart", {
			article_id : _this.attr("role"),
			count : count
		}, function(res) {
			if (status) {
				_this.css("color", "red")
				_this.html("<i class='fa fa-heart'></i>" + count);
			} else {
				_this.css("color", "rgb(79,79,79)")
				_this.html("<i class='fa fa-heart'></i>" + count);
			}
		})
	})
})