$(function () {     
	// $('#players_filter').change(function () {  
	// 	var players = $(this).val();    
	// 	window.location = '/game/list/?' + filter({'players':players});
	// });        
	
	$('select.link').change(function () {  
		var value = $(this).val();    
		var location = $(this).attr('href').replace(/VALUE/, value);
		window.location = location;
	});                                    
	
	$('.category_link').click(function () {
		var category = $(this).attr('category_id')
		window.location = '/game/list/?' + filter({'category':category});
	})
	
	$('.disabled a').click(function () {
		return false;
	})    
	
});