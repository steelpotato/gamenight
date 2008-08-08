var nemesis_folder = 'javascripts/nemesis/';
var nemesis_loaded = {};
var nemesis_loading = {};
var nemesis_waiting = {};

jQuery.fn.nemesis_css = function (url) {
	var stylesheet = (url) ? url : nemesis_folder + $(this).attr('nemesis') + ".css";
	
	if (!nemesis_loaded[stylesheet])
	{
		$('head').append("<link type='text/css' rel='stylesheet' href='"+stylesheet+"'/>");
		nemesis_loaded[stylesheet] = true;
	}
}

// jQuery.fn.nemesis_html = function (callback) {
// 	var name = $(this).attr('nemesis');
// 	var source = nemesis_folder + name + ".html";
// 	var comp = $(this);
// 	
// 	var trigger = function (value)
// 	{
// 		nemesis_loaded[name] = value;	// save the html for later
// 		comp.html(value);			// set my html to the goods
// 		comp.trigger("nemesis_html");
// 	}
// 	
// 	var loaded = function (value)
// 	{
// 		
// 	}
// 	
// 	if (!nemesis_loaded[source] && !nemesis_loading[source])
// 	{
// 		$.get(source, loaded);
// 		nemesis_loading[source] = true;
// 	}
// 	
// 	else if (nemesis_loaded[source])	// if it's done
// 		trigger(nemesis_loaded[source]);
// 
// 	else
// 		nemesis_waiting[
// 		
// }


jQuery.fn.nemesis_script = function () {
	var javascript  = nemesis_folder + $(this).attr('nemesis') + ".js";
	
	if (!nemesis_loaded[javascript])
	{
		$('head').append("<script type='text/javascript' src='"+javascript+"'></script>");
		nemesis_loaded[javascript] = true;
	}
}

jQuery.fn.nemesis_init = function (new_nemesis_folder) {

	if (new_nemesis_folder)
	{
		nemesis_folder = new_nemesis_folder;
		if (!nemesis_folder.match(/\/$/i))	// add a trailing slash if we need it
			nemesis_folder += '/';
	}
		
	// 1 // Go through and add classes 
	$('[nemesis]', this).each(function () {
		var name = $(this).attr('nemesis');
		var names = name.split('.');

		// Attach Classes
		for (var i in names)	$(this).addClass(names[i]);		// add all parts of the name as classes
	})
	
	// Attach Javascript // 
	$('[nemesis]', this).nemesis_script();
	
	// Trigger //
	$('[nemesis]', this).trigger('nemesis');
}