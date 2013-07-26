// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready( function(){
	window.livemode = 'off';
	var livegraph = function(){

	  if (livemode == 'off'){
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

    	window.intervalID = setInterval(livegraph_refresh, 1000);
    	livemode = 'on';
		} else {
			checkboxes = $('input[type=checkbox]');

		checkboxes.each( function(){
			this.disabled = false;
		});
			clearInterval(intervalID);
			livemode = 'off';
		}

	};

	var livegraph_refresh = function(){
			$.ajax({
		      dataType: "script",
		      data: chartdata,
		      type: "post",
		      url: "/livegraph_refresh"
    	});
	}


	$('#livegraph').on('click', livegraph);
});