$(function () {     
    var holdClick = false;
    
    $('div.gamebox a').click(function() {
        holdClick = true;
    });
    
    $('div.gamebox[href]').mouseover(function () { 
        $(this).addClass('over');
    })
    .click(function() {
        if ( holdClick == false ) 
			window.location = $(this).attr('href');
            
        holdClick = false;
    }); 
    
    $('div.gamebox[href]').mouseout(function () { 
        $(this).removeClass('over');
    });
});