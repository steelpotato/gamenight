jQuery('.seanhess.containers.test').one('nemesis', function () {
	
	var title = $(this).attr('title');
	var description = $(this).html();
	
	// $(this).one('nemesis_html', function () {
	// 	$('div.title a', this).html(title);
	// 	$('div.description', this).html(description);
	// })
	
	$(this).nemesis_css();
	// $(this).nemesis_html();
	
	$(this).click(function () {
		alert("WAHOO");
	});
	
	// var contents = "<div class='title'><a href='http://www.google.com'>"+$(this).attr('title')+"</a></div>";
	// 	contents += "<div class='description'>"+$(this).html()+"</div>";
	// 
	// $(this).html(contents)
})

jQuery('.seanhess.containers.test').one('nemesis-html', function () {
})
