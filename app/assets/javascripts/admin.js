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
	})
}