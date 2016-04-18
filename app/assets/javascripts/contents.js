/*
 * Basic sample
*/

var bookImages = []
var currentPage = 1
function ready_contents(){
	var jqxhr = $.post( 'delivery_pages.json',{page_number: 1, title: $('#book-page').data('title')}, function(data) {
	  bookImages = data.images
	  $('#book-page').attr('src', bookImages[0])
	  $('#book-page').show()
	}, 'json')
	/*$('img').bind('contextmenu', function(e) {
	    return false;
	}); */
	$('#slider').slider({
		slide: refreshSwatch,
	  	change: refreshSwatch,
	  	value: 80,
	  	min: 20,
	  	max: 100
	})
}

function refreshSwatch(){
	$('#book-page').css('width', $('#slider').slider('value') + '%')
}

$(document).ready(ready_contents)
$(document).on('page:load', ready_contents)
document.onmousedown=function(event){
	console.log(event)
	if(event.button==2)
   {
     return false;    
   }
}