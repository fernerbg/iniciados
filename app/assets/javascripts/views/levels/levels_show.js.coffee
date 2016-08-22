class Iniciados.Views.LevelsShow extends Backbone.View
	el: 'body'
	
	events:
		'click #book-content-wrapper .close-icon' : 'closeBookContent'
		'click .main-link-below .border-bottom' : 'openBookContent'
		
	closeBookContent: (event) ->
		$('#book-content-wrapper').fadeOut(200)
	
	openBookContent: (event) ->
		$('#book-content-wrapper').fadeIn(200)
	
	
			