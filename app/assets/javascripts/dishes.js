function myFunction(){
	$("#sort").change(function(){
		var q=$("#dish_search input[type='text']").val();
 	  $.ajax({
 		  url: 'http://10.90.90.148:5000/dishes/search',
 		  type:'POST',
 		  dataType: "script",
 		  data:{sort: this.value,'q[name_cont]':q},
 		  success: function(response){	
 		  },
 	  });
  });
	// $('#search-field').on('autocompletechange change', function () {
	// 	$('#search-field').autocomplete({
	//     source: function (request, response) {
	//     	var c_id = $('#category_select').find(':selected').val();
	// 	    $.ajax({
	// 	      url: "/dishes/autocomplete", // should be with '/'
	// 	      dataType: 'json',
	// 	      data: { term: request.term,category:c_id},
	// 	      success: function(data) {
	// 	        // call response to return the result to autocomplete box
	// 	        response(data);
	// 	      }
	// 	    });
	//   	}
	//   });
 //  });
  $('#search-field').autocomplete({
    // source: $('#search-field').data('autocomplete-source')
    source: function (request, response) {
   	var c_id = $('#category_select').find(':selected').val();
	    $.ajax({
	      url: "/dishes/autocomplete", // should be with '/'
	      dataType: 'json',
	      data: { term: request.term,category:c_id },
	      success: function(data) {
	        response(data);
	      }
	    });
  	}
  });
  if($('.pagination').length){
	  $(window).scroll(function(){
	  	var url = $('.pagination .next_page').attr('href')
	  	if(url && $(window).scrollTop() > $(document).height() - $(window).height() - 50 ){
	  		$('.pagination').text("Loading more dishes")
	  		$.getScript(url)
	  	}
	  })
	  $(window).scroll();
	}
	$(".fa-times").click(function(){
		$("#dish_search input[type='text']").val('');
	})
	$("#new_dish").validate({
		rules:{
			"dish[name]":{
				required:true
			},
			"dish[price]":{
				required:true
			},
			"dish[image]":{
				required:true
			},
			"dish[description]":{
				required:true
			}
		},
		messages:{
			"dish[name]":{
				required:"Dish name is required"
			},
			"dish[price]":{
				required:"Price is required"
			},
			"dish[image]":{
				required:"Image is required"
			},
			"dish[description]":{
				required:"Description is required"
			}
		}
	})
}
$(document).ready(function(){
	 $('#sidebarCollapse').on('click', function () {
	 		$('#sidebar').toggleClass('active');
    });
})
 