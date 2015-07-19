$(function(){
	var trigger = $('.box-trigger')

	$(".box-trigger").mouseover(function() {
	    $(this).children("div.box").show();
	}).mouseout(function() {
	    $(this).children(".box").hide();
	});
})