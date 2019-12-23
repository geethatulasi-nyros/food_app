$(document).on("turbolinks:load",function(){
	$("#rating-form").raty({
		number:5,
		numberMax:5,
		score:1,
		path: '/assets/',
		scoreName: 'review[rating]'
	});
	$(".dish-rating").raty({
		numberMax:5,
		readOnly:true,
		score: function(){
			return $(this).attr('data-score');
		},
		path: '/assets/'
	});
})
function Ratings() {
	$("#rating-form").raty({
		number:5,
		score:1,
		numberMax:5,
		path: '/assets/',
		scoreName: 'review[rating]'
	});
	$(".dish-rating").raty({
		numberMax:5,
		readOnly:true,
		score: function(){
			return $(this).attr('data-score');
		},
		path: '/assets/'
	});
	$("#new_user").validate({
		rules:{
			"user[name]":{
				required:true,
				maxlength:20
			}
		},
		 messages: {
		  name:{
		    required: "name is required.",
		    maxlength: "name must be less than 20"
		  } 
		}
	});
	$("#new_review").validate({
		rules:{
			"review[rating]":{
				required:true
			},
			"review[review]":{
				required:true
			}
		},
		messages:{
			"review[rating]":{
				required:"Please enter rating"
			},
			"review[review]":{
				required:"Please enter review"
			}
		}
	});
}
