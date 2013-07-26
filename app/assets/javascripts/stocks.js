// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready( function(){
	
	var livegraph = function(){
		//alert('click.');
		var checked = $('input:checked');
		var stock_array = {};
		// Disable checkboxes
		checkboxes = $('input[type=checkbox]');

		checkboxes.each( function(){
			this.disabled = true;
		});

		//prepare the checkbox values to be sent via ajax
		var intg = 0;
		checked.each( function(){
			var input = $(this);
			stock_array[intg] = input.attr('name');
			intg++;
			
		})
		console.log(stock_array);

		$.ajax({
		      dataType: "script",
		      data: stock_array,
		      type: "post",
		      url: "/livegraph_start"
    	});
	};


	$('#livegraph').on('click', livegraph);
});