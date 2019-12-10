$(document).on("turbolinks:load",function(){
	$("#rating-form").raty({
		path: '/assets/',
		scoreName: 'review[rating]'
	});
})