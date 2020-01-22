$(document).on('turbolinks:load', function() {
  usersTable();
  dishesTable();
});
function usersTable(){
	$('#user-table').DataTable({
		language: {
			search: "",
      searchPlaceholder: "Find user..."
    }
	}).rows('.modified').invalidate().draw();
}
function dishesTable(){
	$('#dish-table').DataTable({
		language: {
			search: "",
      searchPlaceholder: "Find dish..."
    }
	}).rows('.modified').invalidate().draw();
}
function formValidate(){
	$("#post-btn").click(function(){
		$("#admin_new_dish").validate({
			rules:{
				"dish[name]":{
					required:true
				},
				"dish[price]":{
					required:true,
					digits:true,
				},
				"dish[images_attributes][0][image]":{
					required:true
				},
				"dish[description]":{
					required:true
				}
			},
			messages:{
				"dish[name]":{
					required:"Dish Name Is Required"
				},
				"dish[price]":{
					required:"Price Is Required",
					digits: "Please Enter Numbers"
				},
				"dish[images_attributes][0][image]":{
					required:"Image Is Required"
				},
				"dish[description]":{
					required:"Description Is Required"
				}
			},
			errorElement : 'span',
	    errorLabelContainer: '.errorTxt',
			errorPlacement: function(error,element) {
	      error.appendTo(element.next());
	    }
		})
	});
	$("#admin_new_user").validate({
		rules:{
			"user[name]":{
				required:true
			},
			"user[email]":{
				required:true,
				email:true
			},
			"user[password]":{
				required:true
			},
			"user[password_confirmation]":{
				required:true
			}
		},
		messages:{
			"user[name]":{
				required:"Name Is Required"
			},
			"user[email]":{
				required:"Email Is Required",
				email:"Enter A Valid Email"
			},
			"user[password]":{
				required:"Password Is Required"
			},
			"user[password_confirmation]":{
				required:"Confirm Password Is Required"
			}
		},
		errorElement : 'span',
    errorLabelContainer: '.errorTxt',
		errorPlacement: function(error,element) {
      error.appendTo(element.parent().next());
    }
	})
}
function imageFileUpload(){
	$('.user-image-preview-filename').css('cursor','not-allowed');
	  var img = $('<img/>', {
      id: 'dynamic',
      width:250,
      height:200
    }); 
  // Create the preview image
  $(".user-image-preview-input input:file").change(function (){     
    var file = this.files[0];
    var reader = new FileReader();
    // Set preview image into the popover data-content
    reader.onload = function (e) {
        $(".user-image-preview-input-title").text("Change");
        $(".user-image-preview-filename").val(file.name);            
        img.attr('src', e.target.result);
    }        
    reader.readAsDataURL(file);
  });  
};
